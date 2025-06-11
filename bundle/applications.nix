{
  config,
  lib,
  pkgs,
  ...
}:
{
  environment.systemPackages = with pkgs; [
    telegram-desktop
    google-chrome
    discord
    gimp3-with-plugins
    vscode
  ];

  programs.firefox.enable = true;
}
