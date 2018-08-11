class netboot::dirs { 
  File {
    ensure	=> directory,
    mode	=> '0777',
  }

  file {'/usr/local/docker':}
  file {'/usr/local/docker/nbi':}
  file {'/usr/local/docker/html':}
  file {'/usr/local/docker/html/imagr':}
  file {'/usr/local/docker/html/imagr/files':}
  file {'/usr/local/docker/html/imagr/images':}
  file {'/usr/local/docker/html/imagr/packages':}
  file {'/usr/local/docker/html/imagr/scripts':}
  file {'/usr/local/docker/html/imagr/workflow':}
}
