class puppet_stumpwm {
    # install the package
    package {'stumpwm':
      provider => 'aptitude',
      ensure => 'latest',
    }

   # Install the file that permits to choose the window manager at login time
   file {'stumpwm.desktop':
     path   => '/usr/share/xsessions/stumpwm.desktop',
     ensure => 'present',
     source => "puppet:///modules/puppet_stumpwm/stumpwm.desktop",
   }
}
