{
  config,
  lib,
  pkgs,
  ...
}:
{
  environment.systemPackages = with pkgs; [
    waybar
    wofi
    rofi-wayland
    hyprlock
    nemo
    swww

    # Screensoots
    wl-clipboard
    slurp
    grim

    # Dark theme
    adw-gtk3
  ];

  programs.hyprland = {
    enable = true;
    xwayland.enable = true;
  };
  
  services.displayManager.sddm = {
    enable = true;
    wayland.enable = true;
  };
}
