{
  config,
  lib,
  pkgs,
  ...
}:
{
  environment.systemPackages = with pkgs; [
    vim
    kitty
    zsh
    oh-my-zsh
    zsh-powerlevel10k
    zsh-syntax-highlighting
  ];

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
}
