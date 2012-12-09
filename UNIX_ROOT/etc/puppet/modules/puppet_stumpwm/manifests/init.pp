class puppet_stumpwm {

   Package['stumpwm'] -> File['xsessions'] -> File['stumpwm.desktop']

   $xsessions='/usr/share/xsessions'

   # install the package
   package {'stumpwm':
     provider => 'aptitude',
     ensure => 'latest',
   }

   # pre-requisite regarding the folder into which installed the stumpwm file
   file { 'xsessions':
     path => $xsessions,
     ensure => 'directory',
     owner  => 'root',
     group  => 'root',
     mode   => '0755',
   }

   # Install the file that permits to choose the window manager at login time
   file {'stumpwm.desktop':
     path   => "$xsessions/stumpwm.desktop",
     ensure => 'present',
     source => 'puppet:///modules/puppet_stumpwm/stumpwm.desktop',
   }
}
