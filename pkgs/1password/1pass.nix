{ config, pkgs, ... }:

{
  home.packages = with pkgs; [
  ];

  programs._1password.enable = true;
  programs._1password-gui = {
    enable = true;
    polkitPolicyOwners = [ "jpmcb" ];
  };
}
