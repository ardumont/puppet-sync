#
# Class: puppet-aptitude
#
# Installs ``puppet-aptitude`` and keeps it up-to-date. Optionally allows full system
# updates.
#
# Usage:
#
#   # Installs ``puppet-aptitude`` and keeps it up-to-date.
#   class { "puppet-aptitude": }
#
#   # Same as above, except also updates *all* packages on the system every day.
#   class { "puppet-aptitude": update => true }
#
class puppet-aptitude($update=false) {

    package { "aptitude": ensure => latest }

    exec { "aptitude-update":
        command     => "/usr/bin/aptitude -y update",
        require     => Package["aptitude"],
        timeout     => 0,
        tries       => 3,
        try_sleep   => 60,
    }

    file { "auto-update":
        group   => "root",
        mode    => 755,
        owner   => "root",
        path    => "/etc/cron.daily/auto-update",
        source  => "puppet:///modules/puppet-aptitude/auto-update",
    }

    if $update {
        File["auto-update"] { ensure => present }
    } else {
        File["auto-update"] { ensure => absent }
    }

}
