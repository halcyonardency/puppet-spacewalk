# == Class: spacewalk::client
#
# This installs and configures the spacewalk client.
#
# === Parameters
#
# [*client_package_name*]
#   The name of the spacewalk-client package.
#
# [*version*]
#   The version of spacewalk client that will be installed.
#
# [*release*]
#   The spacewalk-client package release number.
#
# [*repo_release*]
#   The spacewalk repo package release number.
#
# [*server_fqdn*]
#   The FQDN of the spacewalk server the client will register with.
#
# [*activationkey*]
#   The spacewalk activationkey that will be used to register
#   with the server.
#
class spacewalk::client (
  $client_package_name = $::spacewalk::params::client_package_name,
  $version             = $::spacewalk::params::version,
  $repo_release        = $::spacewalk::params::repo_release,
  $server_fqdn         = undef,
  $activationkey       = undef,
) inherits ::spacewalk::params {

  # validate parameters here

  contain ::spacewalk::client::install
  contain ::spacewalk::client::config

}
