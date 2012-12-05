class packages () {

  # fill the packages here
  package {["emacs",
            "git",
            "gitk",
            "tmux",
            "wget"]:
    ensure => present,
  }
}
