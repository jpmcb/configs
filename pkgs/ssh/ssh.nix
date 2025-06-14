{ config, pkgs, lib, ... }:

{
  programs.ssh = {
    enable = true;

    # Platform-specific configuration
    extraConfig = lib.optionalString pkgs.stdenv.isDarwin ''
      Host *
        IdentityAgent "~/Library/Group Containers/2BUA8C4S2C.com.1password/t/agent.sock"
    '' + lib.optionalString pkgs.stdenv.isLinux ''
      Host *
        IdentityAgent ~/.1password/agent.sock
    '';
  };
}

