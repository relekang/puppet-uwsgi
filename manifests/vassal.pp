define uwsgi::vassal (
  $project,
  $chdir,
  $virtualenv,
  $port,
  $master=true,
  $vacuum=true,
  $single_interpreter=true,
  $enable_threads=true
){
  file {"$project.ini":
    path    => "/etc/uwsgi/apps-enabled/$project.ini",
    owner   => root,
    group   => root,
    mode    => '640',
    content => template("${module_name}/vassal.ini.erb"),
    ensure  => 'present',
    require => Package['uwsgi'],
  }
}
