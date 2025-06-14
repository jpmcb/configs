
# pkgs/i3/default.nix
{ config, pkgs, ... }:

{
  # i3 window manager configuration
  xsession.windowManager.i3 = {
    enable = true;

    config = {
      modifier = "Mod4";  # Use Super key
      terminal = "ghostty";
      # Menu
      menu = "rofi -show drun";
      
      # Key bindings
      keybindings = let
        modifier = config.xsession.windowManager.i3.config.modifier;
      in {
        # Window management
        "${modifier}+Return" = "exec ${config.xsession.windowManager.i3.config.terminal}";
        "${modifier}+Shift+q" = "kill";
        "${modifier}+d" = "exec ${config.xsession.windowManager.i3.config.menu}";
        
        # Focus
        "${modifier}+h" = "focus left";
        "${modifier}+j" = "focus down";
        "${modifier}+k" = "focus up";
        "${modifier}+l" = "focus right";
        
        # Move windows
        "${modifier}+Shift+h" = "move left";
        "${modifier}+Shift+j" = "move down";
        "${modifier}+Shift+k" = "move up";
        "${modifier}+Shift+l" = "move right";
        
        # Workspaces
        "${modifier}+1" = "workspace number 1";
        "${modifier}+2" = "workspace number 2";
        "${modifier}+3" = "workspace number 3";
        "${modifier}+4" = "workspace number 4";
        "${modifier}+5" = "workspace number 5";
        "${modifier}+6" = "workspace number 6";
        "${modifier}+7" = "workspace number 7";
        "${modifier}+8" = "workspace number 8";
        "${modifier}+9" = "workspace number 9";
        "${modifier}+0" = "workspace number 10";
        
        # Move to workspaces
        "${modifier}+Shift+1" = "move container to workspace number 1";
        "${modifier}+Shift+2" = "move container to workspace number 2";
        "${modifier}+Shift+3" = "move container to workspace number 3";
        "${modifier}+Shift+4" = "move container to workspace number 4";
        "${modifier}+Shift+5" = "move container to workspace number 5";
        "${modifier}+Shift+6" = "move container to workspace number 6";
        "${modifier}+Shift+7" = "move container to workspace number 7";
        "${modifier}+Shift+8" = "move container to workspace number 8";
        "${modifier}+Shift+9" = "move container to workspace number 9";
        "${modifier}+Shift+0" = "move container to workspace number 10";
        
        # Layout
        "${modifier}+b" = "splith";
        "${modifier}+v" = "splitv";
        "${modifier}+f" = "fullscreen toggle";
        "${modifier}+a" = "focus parent";
        
        # Floating
        "${modifier}+Shift+space" = "floating toggle";
        "${modifier}+space" = "focus mode_toggle";
        
        # Reload/restart
        "${modifier}+Shift+c" = "reload";
        "${modifier}+Shift+r" = "restart";
        
        # Use Plasma's logout instead of i3's
        "${modifier}+Shift+e" = "exec --no-startup-id qdbus-qt5 org.kde.ksmserver /KSMServer org.kde.KSMServerInterface.logout -1 -1 -1";
        
        # Audio controls using Plasma's system
        "XF86AudioRaiseVolume" = "exec --no-startup-id qdbus org.kde.kglobalaccel /component/kmix invokeShortcut increase_volume";
        "XF86AudioLowerVolume" = "exec --no-startup-id qdbus org.kde.kglobalaccel /component/kmix invokeShortcut decrease_volume";
        "XF86AudioMute" = "exec --no-startup-id qdbus org.kde.kglobalaccel /component/kmix invokeShortcut mute";
        "XF86AudioMicMute" = "exec --no-startup-id qdbus org.kde.kglobalaccel /component/kmix invokeShortcut mic_mute";
      };
      
      # Window rules for Plasma compatibility
      window.commands = [
        # Plasma compatibility improvements
        {
          criteria = { window_role = "pop-up"; };
          command = "floating enable";
        }
        {
          criteria = { window_role = "task_dialog"; };
          command = "floating enable";
        }
        {
          criteria = { class = "yakuake"; };
          command = "floating enable";
        }
        {
          criteria = { class = "systemsettings"; };
          command = "floating enable";
        }
        {
          criteria = { class = "plasmashell"; };
          command = "floating enable";
        }
        {
          criteria = { class = "Plasma"; };
          command = "floating enable, border none";
        }
        {
          criteria = { title = "plasma-desktop"; };
          command = "floating enable, border none";
        }
        {
          criteria = { class = "krunner"; };
          command = "floating enable, border none";
        }
        {
          criteria = { class = "Kmix"; };
          command = "floating enable, border none";
        }
        {
          criteria = { class = "Klipper"; };
          command = "floating enable, border none";
        }
        {
          criteria = { class = "Plasmoidviewer"; };
          command = "floating enable, border none";
        }
        {
          criteria = { class = "plasmashell"; window_type = "notification"; };
          command = "border none, move position 70 ppt 81 ppt, no_focus";
        }
        # Kill the desktop window that covers everything (for Plasma >= 5.27)
        {
          criteria = { title = "Desktop @ QRect.*"; };
          command = "kill, floating enable, border none";
        }
      ];
      
      # Startup applications
      startup = [
        {
          command = "feh --bg-scale ~/.config/wallpaper/current.jpg";
          always = false;
          notification = false;
        }
        {
          command = "picom -b";
          always = false;
          notification = false;
        }
      ];
      
      # Bar configuration
      bars = [
        {
          mode = "hide";
          hiddenState = "hide";
          position = "bottom";
          workspaceButtons = true;
          workspaceNumbers = true;
          statusCommand = "${pkgs.i3status}/bin/i3status";
          fonts = {
            names = [ "monospace" ];
            size = 8.0;
          };
          colors = {
            background = "#242424";
            statusline = "#ffffff";
            separator = "#666666";
          };
        }
      ];
    };
  };
}
