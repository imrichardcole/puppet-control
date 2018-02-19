node agent.home {
  file { '/tmp/example.txt':
    ensure => present,
    content => "This will only be present here $node"
  }
  user { 'git':
    ensure => present,
    managehome => true,
  }
}
