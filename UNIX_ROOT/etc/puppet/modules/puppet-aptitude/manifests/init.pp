#
# Class: aptitude
#
# Installs ``aptitude`` and keeps it up-to-date. Optionally allows full system
# updates.
#
# Usage:
#
#   # Installs ``aptitude`` and keeps it up-to-date.
#   class { "aptitude": }
#
#   # Same as above, except also updates *all* packages on the system every day.
#   class { "aptitude": update => true }
#
class aptitude($update=false) {

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
        source  => "puppet:///modules/aptitude/auto-update",
    }

    if $update {
        File["auto-update"] { ensure => present }
    } else {
        File["auto-update"] { ensure => absent }
    }

}
