{
  pkgs,
  ...
}:
{
    environment.gnome.excludePackages = (with pkgs; [
      atomix # puzzle game
      cheese # webcam tool
      epiphany # web browser
      evince # document viewer
      geary # email reader
      gedit # text editor
      gnome-characters
      gnome-music
      gnome-photos
      gnome-terminal
      gnome-tour
      hitori # sudoku game
      iagno # go game
      tali # poker game
      totem # video player
    ]);
  environment.systemPackages = with pkgs; [
    waybar
    rofi-wayland
    # hyprlock
    # swww
    # gnome-tweaks

    # Screensoots
    # wl-clipboard
    # slurp
    # grim

    # Theme 4 gtk
    gtk4
    rose-pine-gtk-theme
    catppuccin-gtk
    rose-pine-hyprcursor
  ];

  services.xserver = {
    enable = true;
    displayManager.gdm.enable = true;
    desktopManager.gnome.enable = true;
  };

  services.displayManager.autoLogin.enable = true;
  services.displayManager.autoLogin.user = "account";
}
