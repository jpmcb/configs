{ config, pkgs, ... }:

{
  programs.starship = {
    enable = true;
    enableFishIntegration = true;
    settings = {
      directory = {
        # Show the full path from the repo root so that worktree directories
        # are unambiguous (e.g. "speaker-wire.git/main" instead of just "main").
        truncate_to_repo = false;
      };
    };
  };
}
