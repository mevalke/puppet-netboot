class netboot {
  $imagr_server_ip   = lookup(netboot::imagr_server_ip)
  $imagr_server_dns  = lookup(netboot::imagr_server_dns)
  $puppetmaster      = lookup(netboot::puppetmaster)
  $password          = lookup(netboot::password)
  $autodmg           = lookup(netboot::autodmg)
  $nbi               = lookup(netboot::nbi)
  $nbi_url           = lookup(netboot::nbi_url)
  $nbi_checksum      = lookup(netboot::nbi_checksum)
  $nbi_checksum_type = lookup(netboot::nbi_checksum_type)
  $puppet_agent      = lookup(netboot::puppet_agent)
  $description       = lookup(netboot::description)
  $bsdpy_iface       = lookup(netboot::bsdpy_iface)
  $mac_1             = lookup(netboot::mac_1)
  $mac_2             = lookup(netboot::mac_2)
  $mac_3             = lookup(netboot::mac_3)
  $mac_4             = lookup(netboot::mac_4)
  $mac_5             = lookup(netboot::mac_5)
  $mac_6             = lookup(netboot::mac_6)
  $mac_7             = lookup(netboot::mac_7)
  $mac_8             = lookup(netboot::mac_8)
  $mac_9             = lookup(netboot::mac_9)
  $mac_10            = lookup(netboot::mac_10)

  include netboot::dirs
  include netboot::content
  include netboot::docker
}
