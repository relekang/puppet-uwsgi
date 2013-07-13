class uwsgi::vassal ($project, $slug, $port){
  file {"$project.ini":
    path    => "/etc/uwsgi/apps-enabled/$project.ini",
    owner   => root,
    group   => root,
    mode    => '640',
    content => template('uwsgi.erb'),
    require => Package['uwsgi'],
  }
}
