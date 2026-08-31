{ config, pkgs, ... }:

{
  programs.git = {
    enable = true;
    userName = "John McBride";
    userEmail = "jpmmcbride@gmail.com";

    # Work-specific git configuration
    includes = [
      {
        condition = "gitdir:~/workspace/paper-compute-co/";
        contents = {
          user = {
            email = "john@papercompute.com";
          };
        };
      }
      {
        condition = "gitdir:~/workspace/pcc-labs/";
        contents = {
          user = {
            email = "john@papercompute.com";
          };
        };
      }
    ];

    extraConfig = {
      init = {
          defaultBranch = "main";
      };
      user = {
        signingKey = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIDmjZu1j6flqXNL8DtdChgbzJ6CKN8QDCDcUoVDenkP2";
      };
      gpg = {
        format = "ssh";
      };
      commit = {
        gpgsign = true;
      };
      push = {
        autoSetupRemote = true;
      };
    } // {
      "gpg \"ssh\"" = {
        program = if pkgs.stdenv.isDarwin
          then "/Applications/1Password.app/Contents/MacOS/op-ssh-sign"
          else "/opt/1Password/op-ssh-sign";
      };
    };
  };
}
