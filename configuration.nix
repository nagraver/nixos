# Edit this configuration file to define what should be installed on
# your system. Help is available in the configuration.nix(5) man page, on
# https://search.nixos.org/options and in the NixOS manual (`nixos-help`).

{
  config,
  lib,
  pkgs,
  ...
}:

{
  imports = [
    # Include the results of the hardware scan.
    ./hardware-configuration.nix
  ];

  # Use the systemd-boot EFI boot loader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.hostName = "nixos"; # Define your hostname.
  # Pick only one of the below networking options.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.
  networking.networkmanager.enable = true; # Easiest to use and most distros use this by default.

  # Set your time zone.
  time.timeZone = "Europe/Moscow";

  # Select internationalisation properties.
  # i18n.defaultLocale = "en_US.UTF-8";
  # i18n.extraLocales = [
  #   "en_US.UTF-8"
  #   "ru_RU.UTF-8"
  # ];

  console = {
    font = "Lat2-Terminus16";
    keyMap = "us";
    # useXkbConfig = true; # use xkb.options in tty.
  };

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

  security.sudo.enable = true;
  security.sudo.wheelNeedsPassword = false;

  hardware = {
    graphics.enable = true;
    nvidia.modesetting.enable = true;
    nvidia.nvidiaSettings = true;
    nvidia.open = false;
  };

  nixpkgs.config = {
    allowUnfree = true;
  };

  fonts = {
    enableDefaultPackages = true;
    packages = with pkgs; [
      roboto
      inter
      font-awesome
      font-awesome_5
      font-awesome_4
      fira-code
      material-icons
      nerd-fonts.fantasque-sans-mono
      nerd-fonts.caskaydia-cove
      nerd-fonts.fira-code
      nerd-fonts.hack
      nerd-fonts.jetbrains-mono
      dejavu_fonts
      fira-sans
      helvetica-neue-lt-std
      noto-fonts
      noto-fonts-emoji-blob-bin
      noto-fonts-color-emoji
      noto-fonts-monochrome-emoji
      papirus-icon-theme
    ];
  };

  environment.systemPackages = with pkgs; [
    vim
    wget
    kitty
    zsh
    oh-my-zsh
    zsh-powerlevel10k
    zsh-syntax-highlighting
    git
    telegram-desktop
    google-chrome
    waybar
    wofi
    rofi-wayland
    nixd
    nixfmt-rfc-style
    nil
    fastfetch
    swww
    sing-box
    discord
    pulseaudio
    pamixer
    pavucontrol
    nemo
    vscode
    killall
    hyprlock
    wev
    gimp3-with-plugins
    adw-gtk3 # Темная тема
    grim # Скриншоты
    wl-clipboard
    slurp
  ];

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  programs.firefox.enable = true;

  programs.hyprland = {
    enable = true;
    xwayland.enable = true;
  };

  programs.zsh = {
    enable = true;
    promptInit = "source ${pkgs.zsh-powerlevel10k}/share/zsh-powerlevel10k/powerlevel10k.zsh-theme";
    interactiveShellInit = "source ${pkgs.zsh-syntax-highlighting}/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh";
    ohMyZsh = {
      enable = true;
      plugins = [
        "git"
        "sudo"
      ];
    };
  };

  services.pipewire = {
    enable = true;
    pulse.enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    jack.enable = true;
  };

  programs.gnupg.agent = {
    enable = true;
    enableSSHSupport = true;
  };

  services.displayManager.sddm = {
    enable = true;
    wayland.enable = true;
  };

  services.openssh.enable = true;

  services.xserver.videoDrivers = [ "nvidia" ];

  programs.mtr.enable = true;

  networking.firewall.enable = false;

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

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  # Copy the NixOS configuration file and link it from the resulting system
  # (/run/current-system/configuration.nix). This is useful in case you
  # accidentally delete configuration.nix.
  # system.copySystemConfiguration = true;

  # This option defines the first version of NixOS you have installed on this particular machine,
  # and is used to maintain compatibility with application data (e.g. databases) created on older NixOS versions.
  #
  # Most users should NEVER change this value after the initial install, for any reason,
  # even if you've upgraded your system to a new NixOS release.
  #
  # This value does NOT affect the Nixpkgs version your packages and OS are pulled from,
  # so changing it will NOT upgrade your system - see https://nixos.org/manual/nixos/stable/#sec-upgrading for how
  # to actually do that.
  #
  # This value being lower than the current NixOS release does NOT mean your system is
  # out of date, out of support, or vulnerable.
  #
  # Do NOT change this value unless you have manually inspected all the changes it would make to your configuration,
  # and migrated your data accordingly.
  #
  # For more information, see `man configuration.nix` or https://nixos.org/manual/nixos/stable/options#opt-system.stateVersion .
  system.stateVersion = "25.05"; # Did you read the comment?
}
