# == Class: uwsgi::service
# Ensures that the uwsgi service is running.

class uwsgi::service {
  service {'uwsgi':
    ensure     => running,
    enable     => true,
    hasstatus  => true,
    hasrestart => true,
    require    => Package['uwsgi']
  }
}
