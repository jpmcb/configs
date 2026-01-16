{ pkgs, ... }: {
  # Necessary for using flakes on this system.
  nix.settings.experimental-features = "nix-command flakes";

  # Enable alternative shell support in nix-darwin.
  programs.fish.enable = true;

  # Used for backwards compatibility, please read the changelog before changing.
  # $ darwin-rebuild changelog
  system.stateVersion = 6;

  # The platform the configuration will be used on.
  nixpkgs.hostPlatform = "aarch64-darwin";

  users.knownUsers = [ "jpmcb" ];
  users.users.jpmcb = {
    home = "/Users/jpmcb";
    uid = 501;
    shell = pkgs.fish;
  };

  system.primaryUser = "jpmcb";

  # Fonts!
  fonts.packages = with pkgs; [
    nerd-fonts.sauce-code-pro
  ];

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  #########
  # OLED Burn-in Prevention Settings
  #########

  # General appearance settings for Dark Mode and scrollbars
  system.defaults.NSGlobalDomain = {
    # Set appearance to Dark Mode to minimize white UI
    AppleInterfaceStyle = "Dark";

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
}
