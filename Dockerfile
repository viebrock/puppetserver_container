FROM puppet/puppetserver:5.3.7
MAINTAINER "Gerard Hickey and Dave Viebrock"

ENV FOREMAN_VERSION 1.16

ENV DEBIAN_FRONTEND noninteractive

ENV PATH=/opt/puppetlabs/bin:/opt/puppetlabs/puppet/lib/ruby/vendor_gems/bin:$PATH

RUN echo "deb http://deb.theforeman.org/ jessie $FOREMAN_VERSION" > /etc/apt/sources.list.d/foreman.list && \
    echo "deb http://deb.theforeman.org/ plugins $FOREMAN_VERSION" >> /etc/apt/sources.list.d/foreman.list && \
    apt-get -y update && apt-get -y upgrade && \
    apt-get -y --allow-unauthenticated install foreman-proxy && \
    apt-get -y install libkrb5-dev krb5-user && \
    apt-get -y update && \
    gem install bundler_ext rack sinatra concurrent-ruby semi hiera-eyaml && \
    mkdir -p /var/lib/puppet && chown puppet:puppet /var/lib/puppet

COPY foreman-enc.rb /usr/local/bin/
COPY foreman.rb /opt/puppetlabs/puppet/lib/ruby/vendor_ruby/puppet/reports/
COPY foreman-proxy/ /etc/foreman-proxy

COPY puppet/ /etc/puppetlabs/puppet/

COPY entrypoint.sh /
COPY semi.conf /etc

EXPOSE 8000
EXPOSE 8443

ENTRYPOINT ["semi"]