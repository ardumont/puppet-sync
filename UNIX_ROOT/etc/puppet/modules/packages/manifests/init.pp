class packages () {
  $all = ['python-software-properties',
          'git',
          'gitk',
          'tmux',
          'wget',
          'chromium-browser',
          'localepurge',
          'deborphan',
          'language-pack-en',
          'language-pack-fr',
          'gparted',
          'stalonetray',
          'inotify-tools',
          'ruby',
          'curl',
          'yajl-tools',
          'openssh-server',
          'sysvbanner',
          'most',
          'graphviz',
          'audacious',
          'audacious-plugins',
          'gnuplot',
          'nautilus-dropbox',
          'meld',
          'dstat',
          'htop',
          'zip',
          'unzip',
          'rar',
          'unrar',
          'p7zip',
          'p7zip-rar',
          'xclip',
          'gpointing-device-settings']

  Exec['apt-update'] -> Package['aptitude'] -> Package[$all]

  # global policy for the packages
  Package {
    ensure => 'installed'
  }

  exec { 'apt-update':
    command => '/usr/bin/apt-get update'
  }

  package {'aptitude':}

  # fill the packages here
  package {$all:
    provider => 'aptitude'
  }
}
