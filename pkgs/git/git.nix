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
    } // (if pkgs.stdenv.isDarwin then {
      "gpg \"ssh\"" = {
        program = "/Applications/1Password.app/Contents/MacOS/op-ssh-sign";
      };
    } else {});
  };
}
