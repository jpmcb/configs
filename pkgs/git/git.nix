{ config, pkgs, ... }:

{
  programs.git = {
    enable = true;
    extraConfig.init.defaultBranch = "main";
    userName = "John McBride";
    userEmail = "jpmmcbride@gmail.com";

    # Work-specific git configuration
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
        program = if pkgs.stdenv.isDarwin 
          then "/Applications/1Password.app/Contents/MacOS/op-ssh-sign"
          else "op-ssh-sign";
      };
      commit = {
        gpgsign = true;
      };
    };
  };
}
