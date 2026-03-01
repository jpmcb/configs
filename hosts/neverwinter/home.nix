{ config, pkgs, ... }:

{
  imports = [
    # Uber modules
    ../../modules/home-manager/dev.nix

    # Individual packages
    ../../pkgs/aerospace/aerospace.nix
    ../../pkgs/git/git.nix
    ../../pkgs/fish/fish.nix
    ../../pkgs/ssh/ssh.nix
    ../../pkgs/starship/starship.nix
    ../../pkgs/zellij/zellij.nix
  ];

  # The Ghostty package is currently broken for Darwin - can't use the
  # ./pkgs/ghostty module
  home.file.".config/ghostty/config" = {
    text = builtins.readFile ../../pkgs/ghostty/ghostty.config;
  };

  home.packages = [
    pkgs._1password-cli
  ];

  # The state version is required and should stay at the version you
  # originally installed.
  home.stateVersion = "25.05";

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
