class network () {

  file { "hosts":
    path => "/etc/hosts",
    ensure => "present",
    source => "puppet:///modules/network/hosts",
  }

  file { "resolv.conf":
    path => "/etc/resolv.conf",
    ensure => "present",
    source => "puppet:///modules/network/resolv.conf",
  }

}
