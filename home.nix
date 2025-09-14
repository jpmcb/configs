{ config, pkgs, ... }:

{
  home.username = "jpmcb";
  home.homeDirectory = "/Users/jpmcb";

  home.file = {
    ".config/ghostty/config" = {
      text = builtins.readFile ./ghostty.config;
    };
  };

  home.file = {
    ".aerospace.toml" = {
      text = builtins.readFile ./aerospace.toml;
    };
  };

  home.file = {
    ".gitconfig" = {
      text = builtins.readFile ./.gitconfig;
    };
  };

  home.file = {
    ".config/zellij/config.kdl" = {
      text = builtins.readFile ./zellij.kdl;
    };
  };

  nixpkgs = {
    config = {
      allowUnfree = true;
      allowUnfreePredicate = (_: true);
    };
  };

  # Let Home Manager install and manage itself
  programs.home-manager.enable = true;

  # Packages
  home.packages = with pkgs; [
    # Xcode-select dev tools replacement
    gnumake
    gcc
    libiconv

    starship

    # Gclodu shenanigans
    (
      google-cloud-sdk.withExtraComponents [
        google-cloud-sdk.components.log-streaming
        google-cloud-sdk.components.cloud-run-proxy
      ]
    )
    google-cloud-sql-proxy

    crane
    act
    fish
    fd
    fzf
    jump
    k6
    htop
    jq
    ripgrep
    vim
    nodejs
    go
    zellij
    ollama
    uv
    gh
    zig_0_14
    openfga
    postgresql
    vale
    delta
    openfga-cli
    just
    awscli2
    kubectx
    kubectl
    k9s


    # If we are not free now, when?
    _1password-cli
  ];


  # Git configs
  programs.git = {
    enable = true;
    extraConfig.init.defaultBranch = "main";
    userName = "John McBride";
    userEmail = "jpmmcbride@gmail.com";
    includes = [
    {
      condition = "gitdir:~/workspace/zuplo/";
      contents = {
        user = {
          email = "john@zuplo.com";
        };
      };
    }
    {
      condition = "gitdir:~/workspace/zuplo-poc/";
      contents = {
        user = {
          email = "john@zuplo.com";
        };
      };
    }
    ];

    extraConfig = {
      user = {
        signingKey = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIDmjZu1j6flqXNL8DtdChgbzJ6CKN8QDCDcUoVDenkP2";
      };
      gpg = {
        format = "ssh";
      };
      "gpg \"ssh\"" = {
        program = "/Applications/1Password.app/Contents/MacOS/op-ssh-sign";
      };
      commit = {
        gpgsign = true;
      };
    };
  };

  # Fish fish fish
  programs.fish = {
    enable = true;
    shellAliases = {
      "vim" = "nvim";
    };
    shellInit = builtins.readFile ./config.fish;
  };

  programs.ssh = {
    enable = true;

    extraConfig = ''
      Host *
        IdentityAgent "~/Library/Group Containers/2BUA8C4S2C.com.1password/t/agent.sock"
    '';
  };

  programs = {
    direnv = {
      enable = true;
      enableBashIntegration = true; # see note on other shells below
      nix-direnv.enable = true;
    };

    bash.enable = true; # see note on other shells below
  };

  # User-level environment variables
  home.sessionVariables = {
    EDITOR = "nvim";
  };

  # This value determines the Home Manager release that your
  # configuration is compatible with. This helps avoid breakage
  # when a new Home Manager release introduces backwards
  # incompatible changes.
  #
  # You can update Home Manager without changing this value. See
  # the Home Manager release notes for a list of state version
  # changes in each release.
  home.stateVersion = "24.11";
}
