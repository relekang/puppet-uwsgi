class uwsgi {
    include uwsgi::service

    package {'uwsgi':
        ensure => installed,
    }
    class {'uwsgi::config': 
        require => Package['uwsgi']
    }
}
