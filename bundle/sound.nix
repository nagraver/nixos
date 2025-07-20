{
  pkgs,
  ...
}:
{
  environment.systemPackages = with pkgs; [
    pulseaudio
    pamixer
    pavucontrol
    myxer
    libsForQt5.kmix
  ];

  services.pipewire = {
    enable = true;
    pulse.enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    jack.enable = true;
  };
}
