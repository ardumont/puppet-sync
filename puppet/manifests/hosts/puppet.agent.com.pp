node 'puppet.agent.com' {
  class {'packages':}

  class {'network':}

  class {'stumpwm':}

  class {'emacs24':}

  class {'java':}

#  class {'clojure':}
}
