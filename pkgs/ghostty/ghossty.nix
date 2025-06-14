{ config, pkgs, ... }:

{
  home.packages = with pkgs; [
    ghostty
  ];

  home.file.".config/ghostty/config" = {
    text = builtins.readFile ./ghostty.config;
  };
}
