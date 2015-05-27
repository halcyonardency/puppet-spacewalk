# == Class spacewalk::install
#
# This class is called from spacewalk for install.
#
class spacewalk::install {
  
  ### TODO: Remove repo installation
  ######################################
  exec {'spacewalkRepo':
    cwd     => '/etc/yum.repos.d', 
    path    => '/usr/bin:/usr/sbin:/bin',
    creates => '/etc/yum.repos.d/spacewalk.repo',
    command => "rpm -Uvh http://yum.spacewalkproject.org/${::spacewalk::client::version}/RHEL/${::operatingsystemmajrelease}/${::architecture}/spacewalk-repo-${::spacewalk::client::version}-${::spacewalk::client::repo_release}.el${::operatingsystemmajrelease}.noarch.rpm"
  }
  
  file {'/etc/yum.repos.d/jpackage-generic.repo':
    ensure => present,
    owner  => 'root',
    group  => 'root',
    mode   => '0644',
    source => 'puppet:///modules/spacewalk/jpackage-generic.repo',
  }

  if ! defined(Package['epel-release']) {
    package { 'epel-release':
      ensure => present,
    }
  }
  ########################################

  package { $::spacewalk::db_package_name:
    ensure  =>  present,
    require => Exec['spacewalkRepo'],
  }

  package { $::spacewalk::package_name:
    ensure          => present,
    install_options => [ '--nogpgcheck' ],
    require         => Package[$::spacewalk::db_package_name],
  }
  
  package { $::spacewalk::utils_package_name:
    ensure          => present,
    install_options => [ '--nogpgcheck' ],
    require         => Package[$::spacewalk::package_name],
  }

}
