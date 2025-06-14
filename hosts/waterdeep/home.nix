{ config, pkgs, ... }:

{
  imports = [
    # Uber modules
    ../../modules/home-manager/dev.nix

    # Individual packages
    ../../pkgs/git/git.nix
    ../../pkgs/fish/fish.nix
    ../../pkgs/ssh/ssh.nix
    ../../pkgs/ghostty/ghossty.nix
    ../../pkgs/zellij/zellij.nix
    ../../pkgs/obs
  ];

  home.username = "jpmcb";
  home.homeDirectory = "/home/jpmcb";

  home.packages = with pkgs; [
    godot
  ];

  # This value determines the Home Manager release that your configuration is
  # compatible with. This helps avoid breakage when a new Home Manager release
  # introduces backwards incompatible changes.
  #
  # You should not change this value, even if you update Home Manager. If you do
  # want to update the value, then make sure to first check the Home Manager
  # release notes.
  home.stateVersion = "24.11"; # Please read the comment before changing.

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
