# == Define: spacewalk::errata_setup
#
# Sets up errata for daily download.
# Initializes errata with older errata data.
#
# === Parameters
#
# [*ensure*]
#   Ensure that the system is setup to download the errata
#   data on a daily basis through a chron job
#
#   Default: present
#
# [*channel*]
#   The name of the channel to subscribe
#
#   Default is the $title of the defined type.
#
# [*username*]
#   Username for the satellite.
#
# [*password*]
#   Password for the satellite user.
#
# [*channel_key_uri*]
#   URI to a gpg key we need to import for this channel.
#
#   Default is unset, so no channel key is added
#
# [*channel_key_id*]
#   The gpg key id used for this channel. We need this
#   so we can check if this particular key is already present
#   in the rpm database.
#
#   Default is unset.
#
# === Examples
#
#  spacewalk::channel { 'rhel-x86_64-server-6':
#    user     => 'username',
#    password => 'secret',
#  }
#
# === Authors
#
# Toni Schmidbauer <toni@stderr.at>
#
# === Copyright
#
# Copyright 2014 Toni Schmidbauer
#
define spacewalk::channel(
  $ensure     = present,
  $channel    = $title,
  $os_version = undef,
) {

  file {"/sbin/centos-${os_version}-clone-errata-full.sh":
    ensure  => $ensure,
    owner   => 'root',
    group   => 'root',
    mode    => '0600',
    content => template('spacewalk/centos-clone-errata-full.sh.erb'),
  }
  
#  file {'/etc/spacewalk.answer':
#    ensure  => present,
#    owner   => 'root',
#    group   => 'root',
#    replace => false,
#    content => template('spacewalk/spacewalk.answer.erb'),
#  }
#
#  exec {'spacewalkRepo':
#    cwd     => '/etc/yum.repos.d', 
#    path    => '/usr/bin:/usr/sbin:/bin',
#    creates => '/etc/yum.repos.d/spacewalk.repo',
#    command => "rpm -Uvh http://yum.spacewalkproject.org/${::spacewalk::client::version}/RHEL/${::operatingsystemmajrelease}/${::architecture}/spacewalk-repo-${::spacewalk::client::version}-${::spacewalk::client::repo_release}.el${::operatingsystemmajrelease}.noarch.rpm"
#  }
#
#  exec { $title:
#    command => "spacewalk-channel ${channel_option} -c ${channel} -u ${username} -p ${password}",
#    path    => ['/usr/bin', '/usr/sbin', '/bin', ],
#    unless  => "yum -C repolist enabled 2>/dev/null | grep -qw ${channel}",
#  }
#
#  exec { "${$title}_channel_key":
#    command => "rpm --import ${channel_key_uri}",
#    path    => ['/bin', '/usr/bin', ],
#    unless  => "rpm -qa --nosignature --nodigest --qf '%{VERSION}\n' gpg-pubkey|grep -q ${channel_key_id}",
#  }

}