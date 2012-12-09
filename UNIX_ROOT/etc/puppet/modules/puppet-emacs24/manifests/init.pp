class puppet-emacs24 {
  Exec['add-repo'] -> Exec['aptitude-update'] -> Package['emacs24']

  exec { 'add-repo':
    command => '/usr/bin/add-apt-repository ppa:cassou/emacs'
  }

  # install the package
  package {'emacs24':
    ensure   => 'latest',
    provider => 'aptitude',
  }
}
