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
# [*rhn_user*]
#   The rhn user
#
# [*rhn_pass*]
#   The rhn pass
#
class spacewalk::errata (
  $spacewalk_user = undef,
  $spacewalk_pass = undef,
  $rhn_user       = undef,
  $rhn_pass       = undef,
) inherits ::spacewalk::params {

  contain ::spacewalk::errata::install
  contain ::spacewalk::errata::config

}
