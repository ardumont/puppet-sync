class puppet-emacs24 {
  $source_list='cassou-emacs-precise.list'

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
