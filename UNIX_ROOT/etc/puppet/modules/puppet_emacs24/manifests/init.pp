class puppet_emacs24 {
  $source_list='cassou-emacs-precise.list'

  File[$source_list] -> Exec['apt-update'] -> Package['emacs24']

  exec { 'apt-update':
    command => '/usr/bin/aptitude update'
  }

  # install the package
  package {'emacs24':
    ensure   => 'latest',
    provider => 'aptitude',
  }

  # Install the repository
  file {$source_list:
    path   => "/etc/apt/sources.list.d/$source_list",
    ensure => 'present',
    source => "puppet:///modules/puppet_emacs24/$source_list",
  }
}
