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

  # The state version is required and should stay at the version you
  # originally installed.
  home.stateVersion = "25.05";

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
