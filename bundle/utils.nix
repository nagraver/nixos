{
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
    htop
    btop
    python313
    python312
    uv
    p7zip
    redis
    postgresql_16
    yt-dlp
  ];

  virtualisation.docker.enable = true;

  # Garbage cleaner
  nix = {
    gc.automatic = true;
    gc.dates = "daily";
    gc.options = "--delete-older-than 5d";
  };
}
