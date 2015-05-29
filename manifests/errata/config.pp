# == Class spacewalk::config
#
# This class is called from spacewalk for service config.
#
class spacewalk::errata::config {

  file {'/etc/ya-errata-import.cfg':
    ensure  => present,
    owner   => 'root',
    group   => 'root',
    mode    => '0600',
    content => template('spacewalk/ya-errata-import.cfg.erb'),
  }

}
