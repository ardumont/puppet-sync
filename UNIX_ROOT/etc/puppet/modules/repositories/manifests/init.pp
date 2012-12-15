class repositories {
  class{'git':
    svn => false
  }

  git::user{'username':
    user_name  => 'ardumont',
    user_email => 'some-email@example.org',
  }

  # added my sh git repository
  git::repo{'sh':
    path   => "/home/vagrant/repo/perso/sh",
    source => 'git://github.com/ardumont/sh.git',
    update => 'true',
  }
}
