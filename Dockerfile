FROM puppet/puppetserver:5.3.4
MAINTAINER "Gerard Hickey"

COPY foreman-enc.rb /usr/local/bin/
COPY foreman.rb /opt/puppetlabs/puppet/lib/ruby/vendor_ruby/puppet/reports/

