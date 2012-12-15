class emacs24 {
  include apt::update

  Exec['add-repo'] -> Exec['apt_update'] -> Package['emacs24']

  exec { 'add-repo':
    command => '/usr/bin/add-apt-repository ppa:cassou/emacs'
  }

  # install the package
  package {'emacs24':
    ensure   => 'latest',
  }
}
