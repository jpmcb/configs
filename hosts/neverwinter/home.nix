{ config, pkgs, ... }:

{
  home.username = "jpmcb";
  home.homeDirectory = "/Users/jpmcb";
  home.stateVersion = "24.11";
  
  programs.home-manager.enable = true;
}
