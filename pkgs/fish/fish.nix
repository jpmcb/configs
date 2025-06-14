{ config, pkgs, ... }:

{
  programs.fish = {
    enable = true;
    shellAliases = {
      "vim" = "nvim";
    };
    shellInit = builtins.readFile ./config.fish;
  };
}
