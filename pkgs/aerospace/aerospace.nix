{ config, pkgs, ... }:

{
  home.file.".aerospace.toml" = {
    text = builtins.readFile ./aerospace.toml;
  };
}
