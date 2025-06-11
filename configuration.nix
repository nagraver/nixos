{
  config,
  lib,
  pkgs,
  ...
}:

{
  imports = [
    ./hardware-configuration.nix
    ./sound.nix
    ./fonts.nix
    ./terminal.nix
    ./hyperland.nix
    ./utils.nix
    ./networking.nix
    ./applications.nix
    ./nvidia.nix
  ];

  nixpkgs.config = {
    allowUnfree = true;
  };

  # Use the systemd-boot EFI boot loader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  time.timeZone = "Europe/Moscow";

  console = {
    font = "Lat2-Terminus16";
    keyMap = "us";
    # useXkbConfig = true; # use xkb.options in tty.
  };

  # Users
  users.users.nagraver = {
    isNormalUser = true;
    shell = pkgs.zsh;
    extraGroups = [
      "wheel"
      "input"
      "networkmanager"
      "audio"
    ];
  };

  security.sudo = {
    enable = true;
    wheelNeedsPassword = false;
  };

  # Select internationalisation properties.
  # i18n.defaultLocale = "en_US.UTF-8";
  # i18n.extraLocales = [
  #   "en_US.UTF-8"
  #   "ru_RU.UTF-8"
  # ];

  system.stateVersion = "25.05"; # Did you read the comment?
}
