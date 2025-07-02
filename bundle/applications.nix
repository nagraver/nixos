{
  pkgs,
  ...
}:
{
  environment.systemPackages = with pkgs; [
    telegram-desktop
    discord
    gimp3-with-plugins
    vscode
    zed-editor
    nautilus
    nemo
    libreoffice-qt
    hunspell
    hunspellDicts.ru_RU
  ];

  programs.steam = {
    enable = true;
    # remotePlay.openFirewall = true; # Open ports in the firewall for Steam Remote Play
    # dedicatedServer.openFirewall = true; # Open ports in the firewall for Source Dedicated Server
    # localNetworkGameTransfers.openFirewall = true; # Open ports in the firewall for Steam Local Network Game Transfers
  };

  programs.firefox.enable = true;
}
