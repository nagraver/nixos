{
  pkgs,
  ...
}:
{
  environment.systemPackages = with pkgs; [
    wget # Tool for retrieving files using HTTP, HTTPS, and FTP
    sing-box
    zapret
  ];

  systemd.services.sing-box-tun = {
    description = "Sing-box TUN Proxy";
    wantedBy = [ "multi-user.target" ];
    after = [ "network.target" ];
    serviceConfig = {
      ExecStart = "${pkgs.sing-box}/bin/sing-box run --config /home/nagraver/.config/sing-box/config-tun.json";
      Restart = "on-failure";
      User = "nagraver";
      CapabilityBoundingSet = "CAP_NET_ADMIN CAP_NET_RAW";
      AmbientCapabilities = "CAP_NET_ADMIN CAP_NET_RAW";
      NoNewPrivileges = true;
    };
    enable = true;
  };

  networking = {
    hostName = "nixos";
    networkmanager.enable = true;
    firewall.enable = false;
  };

  programs.gnupg.agent = {
    enable = true;
    enableSSHSupport = true;
  };

  programs.mtr.enable = true;

  services.openssh.enable = true;
}
