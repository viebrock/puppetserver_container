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

Other Notes
-----------
* Upon container startup, the Puppet CA certificate will be added to the
  OS certificate store.
* The Foreman smart-proxy currently executes as root.
