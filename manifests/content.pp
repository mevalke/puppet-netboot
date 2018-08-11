class netboot::content { 
  $imagr_server_ip   = $netboot::imagr_server_ip
  $imagr_server_dns  = $netboot::imagr_server_dns
  $puppetmaster      = $netboot::puppetmaster
  $password          = $netboot::password
  $autodmg           = $netboot::autodmg
  $nbi               = $netboot::nbi
  $nbi_url		       = $netboot::nbi_url
  $nbi_checksum      = $netboot::nbi_checksum
  $nbi_checksum_type = $netboot::nbi_checksum_type
  $puppet_agent      = $netboot::puppet_agent
  $description       = $netboot::description
  $mac_1             = $netboot::mac_1
  $mac_2             = $netboot::mac_2
  $mac_3             = $netboot::mac_3
  $mac_4             = $netboot::mac_4
  $mac_5             = $netboot::mac_5
  $mac_6             = $netboot::mac_6
  $mac_7             = $netboot::mac_7
  $mac_8             = $netboot::mac_8
  $mac_9             = $netboot::mac_9
  $mac_10            = $netboot::mac_10

  wget::fetch { 'download autodmg':
    source      => "$nbi_url/$autodmg",
    destination => "/usr/local/docker/html/imagr/images/",
    timeout     => 0,
    verbose     => true,
  }
  archive { 'download and extract nbi':
    path          => "/usr/local/docker/nbi/$nbi",
    source        => "$nbi_url/$nbi",
    checksum      => "$nbi_checksum",
    checksum_type => "$nbi_checksum_type",
    extract       => true,
    extract_path  => '/usr/local/docker/nbi/',
    cleanup       => true,
  }
  wget::fetch { 'download puppet agent':
    source      => "$nbi_url/$puppet_agent",
    destination => "/usr/local/docker/html/imagr/packages/",
    timeout     => 0,
    verbose     => true,
  }	
  file {'/usr/local/docker/html/imagr/workflow/imagr_config.plist':
    ensure  => file,
    mode    => '0777',
    content => template('netboot/imagr_config.plist.erb'),
  }
  file {'/usr/local/docker/html/imagr/scripts/base_script':
    ensure  => file,
    mode    => '0777',
    content => template('netboot/base_script.erb'),
  }
  file {'/usr/local/docker/html/imagr/files/macs':
    ensure  => file,
    mode    => '0777',
    content => template('netboot/macs.erb'),
  }
  file {'/usr/local/bin/startup':
    ensure  => file,
    mode    => '0755',
    content => template('netboot/startup.erb'),
  }
  file {'/usr/local/docker/html/imagr/files/validateplist':
    ensure  => file,
    mode    => '0755',
    content => template('netboot/validateplist.erb'),
  }
}

