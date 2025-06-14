{ config, pkgs, ... }:

{
  home.packages = with pkgs; [
    zellij
  ];

  home.file = {
    ".config/zellij/config.kdl" = {
      text = builtins.readFile ./zellij.kdl;
    };
  };
}
