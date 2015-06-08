# == Class: spacewalk::client
#
# This installs and configures https://github.com/liedekef/spacewalk_scripts
# scripts used to get the spacewalk errata data.
#
# === Parameters
#
# [*spacewalk_user*]
#   The spacewalk user, this will be used to upload the 
#   errata to spacewalk.
#
# [*spacewalk_pass*]
#   The spacewalk pass, this will be used to upload the 
#   errata to spacewalk.
#
class spacewalk::errata (
  $spacewalk_user = undef,
  $spacewalk_pass = undef,
) inherits ::spacewalk::params {
  
  package { 'perl-Text-Unidecode':
    ensure  =>  present,
  }
  
  package { 'perl-XML-Simple':
    ensure  =>  present,
  }
  
  file {'/sbin/errata-import.pl':
    ensure  => present,
    owner   => 'root',
    group   => 'root',
    mode    => '0700',
    source => 'puppet:///modules/spacewalk/errata-import.pl',
  }
  
  file {'/sbin/errata-import.sh':
    ensure  => present,
    owner   => 'root',
    group   => 'root',
    mode    => '0700',
    source => 'puppet:///modules/spacewalk/errata-import.sh',
  }
  
  file {'/etc/errata-import.cfg':
    ensure  => present,
    owner   => 'root',
    group   => 'root',
    mode    => '0600',
    content => template('spacewalk/errata-import.cfg.erb'),
  }
  
  cron {'errata-import':
    ensure  => present,
    command => "/sbin/errata-import.sh",
    user    => 'root',
    hour    => '*/6',
    minute  => '0'
  }

}
