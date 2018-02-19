node agent {
  user { 'git':
    ensure => present,
    managehome => true,
  }
}

node master {
  cron { 'logrotate':
    command => '/usr/bin/git clone foo.com',
    user    => 'root',
    hour    => 2,
    minute  => 0,
  }
}
