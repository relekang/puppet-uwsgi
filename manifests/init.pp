# == Class: uwsgi

class uwsgi {
    include uwsgi::service

    package { 'uwsgi':
        ensure   => installed,
        provider => 'pip',
        require  => Class['python']
    }

    file { ['/etc/uwsgi', '/etc/uwsgi/apps-enabled']:
        ensure  => 'directory',
        require => Package['uwsgi']
    }

    file {'/etc/init.d/uwsgi':
        ensure => 'present',
        source => "puppet:///modules/${module_name}/files/initd.conf",
        owner  => root,
        group  => root,
        mode   => '0755',
    }
}
