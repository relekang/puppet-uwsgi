# == Class: uwsgi

class uwsgi {
    include uwsgi::service

    package {'uwsgi':
        ensure => installed,
    }

    file {'/etc/uwsgi/apps-enabled':
        ensure => 'directory'
    }

    class {'uwsgi::config':
        require => Package['uwsgi']
    }
}
