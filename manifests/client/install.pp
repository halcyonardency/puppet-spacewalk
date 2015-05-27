# == Class spacewalk::client::install
#
# This class is called from spacewalk::client for install.
#
class spacewalk::client::install {
  
  ### TODO: Remove repo installation
  ######################################
  exec {'spacewalkClientRepo':
    cwd     => '/etc/yum.repos.d', 
    path    => '/usr/bin:/usr/sbin:/bin',
    creates => '/etc/yum.repos.d/spacewalk-client.repo',
    command => "rpm -Uvh http://yum.spacewalkproject.org/${::spacewalk::client::version}/RHEL/${::operatingsystemmajrelease}/${::architecture}/spacewalk-client-repo-${::spacewalk::client::version}-${::spacewalk::client::repo_release}.el${::operatingsystemmajrelease}.noarch.rpm"
  }
  
  if ! defined(Package['epel-release']) {
    package { 'epel-release':
      ensure => present,
    }
  }
  


  ########################################
  
  package { 'rhn-client-tools':
    ensure  =>  present,
    require => Package['epel-release'],
  }

  package { 'rhn-check':
    ensure  =>  present,
    require => Package['epel-release'],
  }
  
  package { 'rhn-setup':
    ensure  =>  present,
    require => Package['epel-release'],
  }
  
  package { 'rhnsd':
    ensure  =>  present,
    require => Package['epel-release'],
  }
    
  package { 'm2crypto':
    ensure  =>  present,
    require => Package['epel-release'],
  }
    
  package { 'yum-rhn-plugin':
    ensure  =>  present,
    require => Package['epel-release'],
  }

}
