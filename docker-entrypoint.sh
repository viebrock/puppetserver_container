#!/bin/bash

chown -R puppet:puppet /etc/puppetlabs/puppet/ssl
chown -R puppet:puppet /opt/puppetlabs/server/data/puppetserver/

if test -n "${PUPPETDB_SERVER_URLS}" ; then
  sed -i "s@^server_urls.*@server_urls = ${PUPPETDB_SERVER_URLS}@" /etc/puppetlabs/puppet/puppetdb.conf
fi

# Configure puppet to use a certificate autosign script (if it exists)
# AUTOSIGN=true|false|path_to_autosign.conf
if test -n "${AUTOSIGN}" ; then
  puppet config set autosign "$AUTOSIGN" --section master
fi

if test -f /etc/puppetlabs/puppet/ssl/certs/ca.pem; then
  cp /etc/puppetlabs/puppet/ssl/certs/ca.pem /usr/share/ca-certificates/puppet-ca.crt
  echo "puppet-ca.crt" >> /etc/ca-certificates.conf && update-ca-certificates
fi

# Startup the Foreman smartproxy
# SMARTPROXY=true
if test -n "${SMARTPROXY}" ; then
  /opt/puppetlabs/puppet/bin/ruby /usr/share/foreman-proxy/bin/smart-proxy
fi

exec /opt/puppetlabs/bin/puppetserver "$@"
