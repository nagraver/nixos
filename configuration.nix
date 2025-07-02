{
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
    # ./bundle/gnome.nix
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
      "docker"
    ];
  };

  security.sudo = {
    enable = true;
    wheelNeedsPassword = false;
  };

  console = {
    keyMap = "us";
  };

  system.stateVersion = "25.05";
}
