{
  config,
  lib,
  pkgs,
  ...
}:

{
  imports = [
    ./bundle/sound.nix
    ./bundle/hardware-configuration.nix
    ./bundle/fonts.nix
    ./bundle/terminal.nix
    ./bundle/hyperland.nix
    ./bundle/utils.nix
    ./bundle/networking.nix
    ./bundle/applications.nix
    ./bundle/nvidia.nix
  ];

  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
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
      "video"
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

  system.stateVersion = "25.05";
}
