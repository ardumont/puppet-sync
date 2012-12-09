node 'puppet.agent.com' {
  class {'aptitude':
    update => true,
  }

  class {'packages':}

  class {'network':}

  class {'stumpwm':}

  class {'emacs24':}

  class {'java':}

#  class {'clojure':}
}
