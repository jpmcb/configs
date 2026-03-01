{ config, pkgs, lib, modulesPath, ... }:

{
  imports = [
    # EC2-specific hardware and boot configuration
    (modulesPath + "/virtualisation/amazon-image.nix")
  ];

  networking.hostName = "baldursgate";

  # Localization settings
  i18n.defaultLocale = "en_US.UTF-8";

  # Define a user account.
  users.users.jpmcb = {
    isNormalUser = true;
    description = "John McBirde";
    extraGroups = [ "wheel" ];
    shell = pkgs.fish;
  };
  programs.fish.enable = true;

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # System packages
  environment.systemPackages = with pkgs; [
    vim
    wget
    _1password-cli
  ];

  # Enable the OpenSSH daemon (essential for EC2)
  services.openssh = {
    enable = true;
    settings = {
      PermitRootLogin = "no";
      PasswordAuthentication = false;
    };
  };

  # Enable nix flakes
  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken.
  system.stateVersion = "25.05";
}
