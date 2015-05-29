# == Class spacewalk::config
#
# This class is called from spacewalk for service config.
#
class spacewalk::config {
  
  firewall { '100 allow http and https access':
    port   => [80, 443],
    proto  => tcp,
    action => accept,
  }
  
  file {'/etc/spacewalk.answer':
    ensure  => present,
    owner   => 'root',
    group   => 'root',
    replace => false,
    content => template('spacewalk/spacewalk.answer.erb'),
  }
  
  exec {'spacewalk-setup':
    cwd       => '/root',
    path      => '/usr/bin:/usr/sbin:/bin:/sbin',
    creates   => '/var/www/html/pub/RHN-ORG-TRUSTED-SSL-CERT',
    command   => 'spacewalk-setup --disconnected --answer-file=/etc/spacewalk.answer',
    logoutput => true,
    require   => [Package['spacewalk-postgresql'], File['/etc/spacewalk.answer'] ],
  }

}
