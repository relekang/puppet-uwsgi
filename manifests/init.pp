# == Class: uwsgi

class uwsgi {
    include uwsgi::service

    package {'uwsgi':
        ensure   => installed,
        provider => 'pip'
    }

    file {'/etc/uwsgi/apps-enabled':
        ensure => 'directory'
    }

    file {'/etc/init.d/uwsgi':
        ensure => 'present',
        source => "puppet:///modules/${module_name}/files/initd.conf",
        owner  => root,
        group  => root,
        mode   => '0755',
    }

    class {'uwsgi::config':
        require => Package['uwsgi']
    }
}
