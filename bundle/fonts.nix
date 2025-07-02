{
  pkgs,
  ...
}:

{
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
}
