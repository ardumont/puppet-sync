class puppet_emacs24 {
  $source_list='cassou-emacs-precise.list'

  Exec['add-repo'] -> Exec['apt-update'] -> Package['emacs24']

  exec { 'add-repo':
    command => '/usr/bin/add-apt-repository ppa:cassou/emacs'
  }

  exec { 'apt-update':
    command => '/usr/bin/aptitude update'
  }

  # install the package
  package {'emacs24':
    ensure   => 'latest',
    provider => 'aptitude',
  }
}
