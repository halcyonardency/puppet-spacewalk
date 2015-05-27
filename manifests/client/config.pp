# == Class spacewalk::client::config
#
# This class is called from spacewalk::client for service config.
#
class spacewalk::client::config {
  
  exec {'registerSpacewalkClient':
    path    => '/usr/bin:/usr/sbin:/bin',
    creates => '/etc/sysconfig/rhn/systemid',
    command => "rhnreg_ks --serverUrl=http://${spacewalk::client::server_fqdn}/XMLRPC --activationkey=${spacewalk::client::activationkey}",
    require => Package['rhn-setup'],
  }

}
