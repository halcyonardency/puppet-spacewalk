# == Define: spacewalk::create_channel
#
# Creates a Spacewalk channel or child channel
#
# === Parameters
#
# [*user*]
#   Username for the Spacewalk server.
#
# [*pass*]
#   Password for the Spacewalk server.
#
# [*label*]
#   The channel label.
#   - Must be at least 6 characters in length.
#   - Must not begin with rhn, redhat.
#   - Must contain only lowercase letters, hyphens ('-'), periods ('.'), underscores ('_'), and numerals.
#
# [*parent_channel*]
#   The parent channel label, if any.
#
# [*arch*]
#   The architecture for this channel.
#
# [*checksum*]
#   Yum Repository Checksum Type.
#
# [*gpg_url*]
#   GPG key URL.
#
# [*gpg_id*]
#   GPG key ID.
#
# [*gpg_fingerprint*]
#   GPG key Fingerprint.
#
define spacewalk::create_channel(
  $ensure          = present,
  $user            = undef,
  $pass            = undef,
  $label           = undef,
  $parent_channel  = undef,
  $arch            = 'x86_64',
  $checksum        = 'sha1',
  $gpg_url         = undef,
  $gpg_id          = undef,
  $gpg_fingerprint = undef,
  ) {
    
  case $ensure {
    absent:  { 
      exec { $title:
        command => "spacecmd -u ${user} -p ${pass} softwarechannel_delete ${$label} ",
        path    => ['/usr/bin', '/usr/sbin', '/bin',],
        onlyif  => "spacecmd -u ${user} -p ${pass} softwarechannel_list | grep -q '${$label}'",
      }
    }
    default: { 
      if $parent_channel {
        $p= "-p ${$parent_channel}"
      }
      
      if $gpg_url {
        $u= "-u ${$gpg_url}"
      }
      
      if $gpg_id {
        $i= "-i ${$gpg_id}"
      }
      
      if $gpg_fingerprint {
        $f= "-f '${$gpg_fingerprint}'"
      }
      
      $cmd = "spacecmd -u ${user} -p ${pass} -- softwarechannel_create -n '${$title}' -l ${$label} -a ${$arch} -c ${$checksum} ${$p} ${$u} ${$i} ${$f}"
      exec { $title:
        command => $cmd,
        path    => ['/usr/bin', '/usr/sbin', '/bin',],
        unless  => "spacecmd -u ${user} -p ${pass} softwarechannel_list | grep -q '${$label}'",
      }
    }
  }
}