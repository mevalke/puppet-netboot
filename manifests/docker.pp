class netboot::docker {
  $bsdpy_iface     = $netboot::bsdpy_iface
  $imagr_server_ip = $netboot::imagr_server_ip

  include docker

  docker::image { 'httpd': }
  docker::image { 'macadmins/netboot-httpd': }
  docker::image { 'macadmins/tftpd': }
  docker::image { 'bruienne/bsdpy:1.0': }

  docker::run { 'web_8080':
    image            => 'httpd',
    volumes          => "/usr/local/docker/html:/usr/local/apache2/htdocs",
    ports            => '0.0.0.0:8080:80',
    name             => 'web_8080',
    require          => Docker::Image[ 'httpd' ],
    extra_parameters => [ '--restart=always' ],
  }
  docker::run { 'web_80':
    image            => 'macadmins/netboot-httpd',
    volumes          => "/usr/local/docker/nbi:/nbi",
    ports            => '0.0.0.0:80:80',
    name             => 'web_80',
    require          => Docker::Image[ 'macadmins/netboot-httpd' ],
    extra_parameters => [ '--restart=always' ],
  }
  docker::run { 'tftpd':
    image            => 'macadmins/tftpd',
    volumes          => "/usr/local/docker/nbi:/nbi",
    ports            => '0.0.0.0:69:69/udp',
    name             => 'tftpd',
    require          => Docker::Image[ 'macadmins/tftpd' ],
    extra_parameters => [ '--restart=always' ],
  }
  docker::run { 'bsdpy':
    image            => 'bruienne/bsdpy:1.0',
    volumes          => "/usr/local/docker/nbi:/nbi",
    ports            => '0.0.0.0:67:67/udp',
    name             => 'bsdpy',
    require          => Docker::Image[ 'bruienne/bsdpy:1.0' ],
    extra_parameters => ["-e BSDPY_IFACE=$bsdpy_iface","-e BSDPY_NBI_URL=http://$imagr_server_ip","-e BSDPY_IP=$imagr_server_ip", '--restart=always'],
  }
}
