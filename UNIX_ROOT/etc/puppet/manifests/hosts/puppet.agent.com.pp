node 'puppet.agent.com' {
  class {'puppet-aptitude':
    update => true,
  }

  class {'packages':}

  class {'network':}

  class {'stumpwm':}

  class {'emacs24':}

  class {'java':}

#  class {'clojure':}
}
