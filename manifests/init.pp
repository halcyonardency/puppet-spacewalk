# == Class: spacewalk
#
# This isntall and configures a spacewalk server.
#
# === Parameters
#
# [*package_name*]
#   The name of the spacewalk package.
#
# [*version*]
#   The version of spacewalk that will be installed.
#
# [*repo_release*]
#   The spacewalk repo package release number.
#
# [*db_package_name*]
#   The database package that will be installed.
#
# [*db_name*]
#   The name of the database spacewalk will use.
#
# [*db_user*]
#   Database user.
#
# [*db_pass*]
#   The password used for the database.
#
# [*db_port*]
#   The port we will connect to the database on.
#
# [*admin_email*]
#   The admin e-mail for spacewalk and the self signed cert we use for it.
#
# [*ca_cert_pass*]
#   The CA cert password.
#
# [*ca_org*]
#   The CA cert organization.
#
# [*ca_org_unit*]
#   The CA cert organization unit.
#
# [*ca_city*]
#   The CA cert city.
#
# [*ca_state*]
#   The CA cert state.
#
# [*ca_country_code*]
#   The CA cert country.
#
# [*utils_package_name*]
#   Utility package names.
#
# [*cmd_package_name*]
#   Command utility package names. This is used
#   for some of the funtionality of this module.
#
class spacewalk (
  $package_name       = $::spacewalk::params::package_name,
  $version            = $::spacewalk::params::version,
  $repo_release       = $::spacewalk::params::repo_release,
  $db_package_name    = $::spacewalk::params::db_package_name,
  $db_name            = $::spacewalk::params::db_user,
  $db_user            = $::spacewalk::params::db_user,
  $db_pass            = undef,
  $db_host            = $::spacewalk::params::db_host,
  $db_port            = $::spacewalk::params::db_port,
  $admin_email        = $::spacewalk::params::admin_email,
  $ca_cert_pass       = undef,
  $ca_org             = $::spacewalk::params::ca_org,
  $ca_org_unit        = $::spacewalk::params::ca_org_unit,
  $ca_city            = $::spacewalk::params::ca_city,
  $ca_state           = $::spacewalk::params::ca_state,
  $ca_country_code    = $::spacewalk::params::ca_country_code,
  $utils_package_name = $::spacewalk::params::utils_package_name,
) inherits ::spacewalk::params {

  # validate parameters here

  contain ::spacewalk::install
  contain ::spacewalk::config

}
