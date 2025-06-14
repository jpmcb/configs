{
  description = "Nix-darwin system flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    nix-darwin.url = "github:nix-darwin/nix-darwin/master";
    nix-darwin.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = inputs@{ self, nix-darwin, nixpkgs }:
  let
    configuration = { pkgs, ... }: {
      # List packages installed in system profile. To search by name, run:
      # $ nix-env -qaP | grep wget
      environment.systemPackages = with pkgs; [
        pkgs.fish
        pkgs.tmux
        pkgs.neovim
      ];

      # Necessary for using flakes on this system.
      nix.settings.experimental-features = "nix-command flakes";

      # Enable alternative shell support in nix-darwin.
      programs.fish.enable = true;
      #programs.npm.enable = true;

      # Set Git commit hash for darwin-version.
      system.configurationRevision = self.rev or self.dirtyRev or null;

      # Used for backwards compatibility, please read the changelog before changing.
      # $ darwin-rebuild changelog
      system.stateVersion = 6;

      # The platform the configuration will be used on.
      nixpkgs.hostPlatform = "aarch64-darwin";

      users.knownUsers = [ "jpmcb" ];
      users.users.jpmcb = {
        uid = 501;
        shell = pkgs.fish;
      };

      # Fonts!
      fonts.packages = with pkgs; [
        nerd-fonts.sauce-code-pro
      ];


      # OLED Burn-in Prevention Settings

      # General appearance settings for Dark Mode and scrollbars
      system.defaults.NSGlobalDomain = {
        # Set appearance to Dark Mode to minimize white UI
        AppleInterfaceStyle = "Dark";

        # Set accent color to Graphite to avoid colorful window controls
        #AppleAccentColor = "6"; # 6 corresponds to Graphite
        #AppleHighlightColor = "0.847059 0.847059 0.862745 Graphite"; # Graphite highlight color

        # Enable wallpaper tinting in windows
        #NSColorTintMenuBars = true;

        # Show scroll bars only when scrolling
        AppleShowScrollBars = "WhenScrolling";
      };

      # Dock settings for auto-hide
      system.defaults.dock = {
        # Automatically hide and show the Dock
        autohide = true;

        # Make the auto-hide animation faster
        autohide-delay = 0.0;
        autohide-time-modifier = 0.2;

        # Hot corner: bottom-right corner activates screen saver
        wvous-br-corner = 5; # 5 = Start Screen Saver
      };


      # Finder settings for showing file extensions
      system.defaults.finder = {
        # Show all file extensions
        AppleShowAllExtensions = true;

        # Disable the warning when changing a file extension
        FXEnableExtensionChangeWarning = false;
      };
    };
  in
  {
    # Build darwin flake using:
    # $ darwin-rebuild build --flake .#neverwinter
    darwinConfigurations."neverwinter" = nix-darwin.lib.darwinSystem {
      modules = [ configuration ];
    };
  };
}
