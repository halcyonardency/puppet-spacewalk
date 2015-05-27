# == Class spacewalk::params
#
# This class is meant to be called from spacewalk.
# It sets variables according to platform.
#
class spacewalk::params {
  $version            = '2.3'
  $repo_release       = '4'
  $db_package_name    = 'spacewalk-setup-postgresql'
  $db_name            = 'spacewalk'
  $db_user            = 'spacewalk'
  $db_host            = 'localhost'
  $db_port            = '5432'
  $admin_email        = 'root@localhost'
  $ca_org             = 'ops'
  $ca_org_unit        = $::fqdn
  $ca_city            = 'San Francisco'
  $ca_state           = 'CA'
  $ca_country_code    = 'US'
  $utils_package_name = 'spacewalk-utils'
  
  case $::osfamily {
    'RedHat', 'Amazon': {
      $package_name        = 'spacewalk-postgresql'
      $client_package_name = ''
    }
    default: {
      fail("${::operatingsystem} not supported")
    }
  }
}
