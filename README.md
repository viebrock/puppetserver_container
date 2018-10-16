puppetserver_container
======================
This container is a fork of the puppet/puppetserver container with a few
additional components. Included in this container is the Foreman ENC script,
the Foreman report processor and the Foreman smart_proxy.

Container Controls
------------------
The following environmental variables are recognized by the contianer:

Puppet variables
----------------

   * PUPPET_CA_ENABLED: Configure the Puppet instance in the container as a
      Puppet certificate authority. The default is `true`.

   * PUPPET_REPORTS: What report processors to enable. Currently the only
      report processors are `puppetdb` and `foreman`. The default is
      `puppetdb`.

   * PUPPET_STORECONFIGS: Enable or disable stored configs on the Puppet
      instance. The default is `true`.

   * PUPPET_STORECONFIGS_BACKEND: The backing store for storing configs.
      Default is `puppetdb`.

   * PUPPET_NODE_TERMINUS: Sets the node terminus for node classification.
      This variable is only used when the `PUPPET_EXTERNAL_NODES` is not
      set. The default is `plain`.

   * PUPPET_EXTERNAL_NODES: Enable the external node classifier. Setting to
      to `foreman` will enable the settings for the Foreman ENC script. No
      default value.

   * PUPPET_STRICT_VARIABLES: Set strict variables on the Puppet instance.
      The default is `false`.

   * DNS_ALT_NAMES: The SANS to use when generating the CSR for the Puppet
      instance. The default is `puppet,$HOSTNAME`.

   * PUPPETDB_SERVER_URLS: Add the listed URLs to the puppetdb.conf file.

   * AUTOSIGN: Turn on auto signing when set to "true" or turn off auto
        signing when set to "false". AUTOSIGN can also be set to the path
        of the autosign.conf file.

Foreman smartproxy variables
----------------------------

   * SMARTPROXY: When set to any value the Foreman smart_proxy will be
        started. The configuration for the smart_proxy is located in
        /etc/foreman-proxy.

   * HOSTNAME: This is the hostname that the container should operate as.
        In a containerized environment the `HOSTNAME` variable usually
        contains the container ID rather than a hostname. Setting this
        will allow the container to find the correct certificates and keys.
        Note: if the container is run under Docker and the `--hostname`
        switch is used, then the `HOSTNAME` variable will be set accordingly
        instead of using the container ID.

   * SMARTPROXY_TRUSTED_HOSTS: Comma seperated list of hosts that the
        Foreman smart proxy should trust and respond to.

   * SMARTPROXY_LOG_LEVEL: The log level that the smartproxy should emit
        logs for. The default is `INFO'. The other useful setting is
        `DEBUG`.

   * SMARTPROXY_PUPPET_CACHE: Enable or disable the cache of Puppet classes.
        The default is `false`. Set to `true` to enable.

   * FOREMAN_URL: This is the URL where to find the Foreman UI.

   * Smartproxy feature switches: The following variables turn on and off
        funtionality within the smartproxy. Defaults are specifed after
        variable names.

      * SMARTPROXY_BMC_ENABLED: false
      * SMARTPROXY_DHCP_ENABLED: false
      * SMARTPROXY_DNS_ENABLED: false
      * SMARTPROXY_FACTS_ENABLED: true
      * SMARTPROXY_LOGS_ENABLED: true
      * SMARTPROXY_PUPPET_ENABLED: true
      * SMARTPROXY_PUPPETCA_ENABLED: false
      * SMARTPROXY_REALM_ENABLED: false
      * SMARTPROXY_TEMPLATES_ENABLED: false
      * SMARTPROXY_TFTP_ENABLED: false

   * PUPPET_VERSION: This sets the version of Puppet being executed for
      the Foreman smartproxy. It is usually set by the container environment
      and is not necessary to change. The default is 5.3.4

   * PUPPET_URL: Location of the Puppet API when using the smartproxy
      to interface Puppet for CA and environmental information.

Other Notes
-----------
* Upon container startup, the Puppet CA certificate will be added to the
  OS certificate store.
* The Foreman smart-proxy currently executes as root.
* Foreman ENC script installed as `/usr/local/bin/foreman-enc.rb`.
