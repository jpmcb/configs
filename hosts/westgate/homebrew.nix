{ inputs, config, ... }:

{
  imports = [ inputs.nix-homebrew.darwinModules.nix-homebrew ];

  nix-homebrew = {
    # Install Homebrew under the default prefix
    enable = true;

    # Apple Silicon Only: Also install Homebrew under the default Intel prefix for Rosetta 2
    enableRosetta = true;

    # User owning the Homebrew prefix
    user = "jpmcb";

    # Declarative tap management
    taps = {
      "homebrew/homebrew-core" = inputs.homebrew-core;
      "homebrew/homebrew-cask" = inputs.homebrew-cask;
    };

    # With mutableTaps disabled, taps can no longer be added imperatively with `brew tap`.
    mutableTaps = true;
  };

  # Align homebrew taps config with nix-homebrew
  homebrew.taps = builtins.attrNames config.nix-homebrew.taps;
}
