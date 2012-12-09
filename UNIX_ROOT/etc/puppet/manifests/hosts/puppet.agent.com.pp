node 'puppet.agent.com' {
  class {'puppet-aptitude':
    update => true,
  }

  class {'packages':}

  class {'network':}

  class {'puppet-stumpwm':}

  class {'puppet-emacs24':}

  class {'puppet-java':}

#  class {'puppet-clojure':}
}
