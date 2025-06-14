{ config, pkgs, ... }:

{
  home.packages = with pkgs; [
    ###########
    # Game launchers
    ###########
    lutris           # Open gaming platform
    heroic           # Epic Games, GOG, Amazon Prime launcher
    bottles          # Wine prefix manager

    ###########
    # Utilities
    ###########
    mangohud         # Performance overlay
    goverlay         # MangoHud configuration GUI
    gamescope        # Wayland compositor for gaming
    gamemode         # System optimization for games

    ###########
    # Windows compatibility
    ###########
    wine             # Windows compatibility layer
    winetricks       # Wine helper scripts

    ###########
    # Emulation
    ###########
    retroarch        # Multi-system emulator
    dolphin-emu      # GameCube/Wii emulator
    pcsx2            # PS2 emulator
  ];
}
