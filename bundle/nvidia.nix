{
  services.xserver.videoDrivers = [ "nvidia" ];

  hardware = {
    graphics.enable = true;
    nvidia.modesetting.enable = true;
    nvidia.nvidiaSettings = true;
    nvidia.open = false;
  };
}
