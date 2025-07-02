{
  pkgs,
  ...
}:
{

  environment.systemPackages = with pkgs; [
    waybar
    rofi-wayland
    hyprlock
    hyprswitch
    swww

    # Screensoots
    wl-clipboard
    slurp
    grim

    # Theme 4 gtk
    rose-pine-hyprcursor
  ];

  programs.hyprland = {
    enable = true;
    xwayland.enable = true;
  };

  services.getty.autologinUser = "nagraver";
}
