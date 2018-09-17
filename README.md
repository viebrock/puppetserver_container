puppetserver_container
======================
This container is a fork of the puppet/puppetserver container with a few
additional components. Included in this container is the Foreman ENC script,
the Foreman report processor and the Foreman smart_proxy.

Container Controls
------------------
The following environmental variables are recognized by the contianer:

   * PUPPETDB_SERVER_URLS: Add the listed URLs to the puppetdb.conf file.

   * AUTOSIGN: Turn on auto signing when set to "true" or turn off auto
        signing when set to "false". AUTOSIGN can also be set to the path
        of the autosign.conf file.

   * SMARTPROXY: When set to any value the Foreman smart_proxy will be
        started. The configuration for the smart_proxy is located in
        /etc/foreman-proxy.

HOSTNAME

SMARTPROXY_TRUSTED_HOSTS
SMARTPROXY_LOG_LEVEL = INFO
SMARTPROXY_PUPPET_CACHE = false
FOREMAN_URL 

SMARTPROXY_BMC_ENABLED = false
SMARTPROXY_DHCP_ENABLED = false
SMARTPROXY_DNS_ENABLED = false
SMARTPROXY_FACTS_ENABLED = true
SMARTPROXY_LOGS_ENABLED = true
SMARTPROXY_PUPPET_ENABLED = true
SMARTPROXY_PUPPETCA_ENABLED = false
SMARTPROXY_REALM_ENABLED = false
SMARTPROXY_TEMPLATES_ENABLED = false
SMARTPROXY_TFTP_ENABLED = false

PUPPET_VERSION = 5.3.4
PUPPET_URL

PUPPET_CA_ENABLED = true
PUPPET_REPORTS = puppetdb
PUPPET_STORECONFIGS = true
PUPPET_STORECONFIGS_BACKEND = puppetdb
PUPPET_NODE_TERMINUS = plain
PUPPET_EXTERNAL_NODES
PUPPET_STRICT_VARIABLES = false


DNS_ALT_NAMES = puppet,$HOSTNAME

HOSTNAME

Other Notes
-----------
* Upon container startup, the Puppet CA certificate will be added to the
  OS certificate store.
* The Foreman smart-proxy currently executes as root.
* Foreman ENC script installed as `/usr/local/bin/foreman-enc.rb`.
