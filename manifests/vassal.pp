# == Class uwsgi::vassal
# Defines settings for a uwsgi vassal

define uwsgi::vassal (
  $chdir,
  $virtualenv,
  $wsgi_file,
  $port,
  $processes=1,
  $master=true,
  $vacuum=true,
  $single_interpreter=true,
  $enable_threads=true
){
  file {"${title}.ini":
    ensure  => 'present',
    path    => "/etc/uwsgi/apps-enabled/${title}.ini",
    owner   => root,
    group   => root,
    mode    => '0640',
    content => template("${module_name}/vassal.ini.erb"),
  }
}
