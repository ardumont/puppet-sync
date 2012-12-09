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

  # global policy for the packages
  Package {
    ensure => 'installed',
  }

  # fill the packages here
  package {$all:
    provider => 'aptitude',
    require  => Class['puppet-aptitude'],
  }
}
