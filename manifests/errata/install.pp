# == Class spacewalk::install
#
# This class is called from spacewalk for install.
#
class spacewalk::errata::install {
  
  file {'/sbin/ya-errata-import.pl':
    ensure  => present,
    owner   => 'root',
    group   => 'root',
    mode    => '0600',
    source => 'puppet:///modules/spacewalk/ya-errata-import.pl',
  }

}
