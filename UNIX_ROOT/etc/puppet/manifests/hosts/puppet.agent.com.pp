node 'puppet.agent.com' {
  class {'puppet-aptitude':
    update => true,
  }

  include packages

  include network

  include puppet-stumpwm

  include puppet-emacs24

#  include puppet-java

#  include puppet-clojure
}
