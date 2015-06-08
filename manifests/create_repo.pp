# == Define: spacewalk::create_repo
#
# Creates a Spacewalk repository
#
# === Parameters
#
# [*user*]
#   Username for the Spacewalk server.
#
# [*pass*]
#   Password for the Spacewalk server.
#
# [*repo_url*]
#   Repository URL.
#
define spacewalk::create_repo(
  $ensure   = present,
  $user     = undef,
  $pass     = undef,
  $repo_url = undef,
  ) {
    
  case $ensure {
    absent:  { 
      exec { $title:
        command => "spacecmd -u ${user} -p ${pass} -- repo_create -n '${$title}' -u ${$repo_url}",
        path    => ['/usr/bin', '/usr/sbin', '/bin',],
        onlyif  => "spacecmd -u ${user} -p ${pass} -- repo_list | grep -q '${$title}'",
      }
    }
    default: { 
      $cmd = "spacecmd -u ${user} -p ${pass} -- repo_create -n '${$title}' -u ${$repo_url}"
      
      exec { $title:
        command => $cmd,
        path    => ['/usr/bin', '/usr/sbin', '/bin',],
        unless  => "spacecmd -u ${user} -p ${pass} -- repo_list | grep -q '${$title}'",
      }
    }
  }
}