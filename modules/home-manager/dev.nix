# modules/home-manager/dev.nix
{ config, pkgs, ... }:

{
  home.packages = with pkgs; [
    atuin
    direnv
    tmux

    # Build tools
    gcc
    gnumake
    libiconv
    just
    cmake
    hurl

    # Shell / terminal workflows
    atuin
    fish
    jump
    neovim

    vim

    # Dev tools
    act
    delta
    fd
    fzf
    gh
    htop
    hurl
    jq
    ripgrep
    wget
    nixd

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
    openfga-cli

    # Gcloud
    (google-cloud-sdk.withExtraComponents [
      google-cloud-sdk.components.log-streaming
      google-cloud-sdk.components.cloud-run-proxy
    ])
    google-cloud-sql-proxy

    # AI
    llama-cpp
  ];

  # Development environment variables
  home.sessionVariables = {
    EDITOR = "nvim";
  };
}
