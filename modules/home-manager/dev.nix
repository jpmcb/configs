# modules/home-manager/dev.nix
{ config, pkgs, ... }:

{
  # Common development packages
  home.packages = with pkgs; [
    # Build tools
    gcc
    gnumake

    # Shell / terminal workflows
    fish
    jump
    neovim
    starship 
    vim

    # Dev tools
    act
    delta
    fd
    fzf
    gh
    htop
    jq
    ripgrep
    wget

    # Languages / runtimes
    go
    nodejs
    uv
    zig_0_14

    # Database / infrastructure
    crane
    k6
    ollama
    postgresql
    openfga

    # Gcloud
    (google-cloud-sdk.withExtraComponents [
      google-cloud-sdk.components.log-streaming
      google-cloud-sdk.components.cloud-run-proxy
    ])
    google-cloud-sql-proxy

  ];

  # Development environment variables
  home.sessionVariables = {
    EDITOR = "nvim";
  };

  # Allow unfree packages
  nixpkgs = {
    config = {
      allowUnfree = true;
      allowUnfreePredicate = (_: true);
    };
  };
}
