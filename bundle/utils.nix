{
  config,
  lib,
  pkgs,
  ...
}:
{
  environment.systemPackages = with pkgs; [
    home-manager
    nixd
    nixfmt-rfc-style
    nil
    git
    killall
    wev
    fastfetch
  ];

  # Garbage cleaner
  nix = {
    gc.automatic = true;
    gc.dates = "daily";
    gc.options = "--delete-older-than 5d";
  };
}
