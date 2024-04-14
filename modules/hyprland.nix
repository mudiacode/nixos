{config, pkgs, inputs, ...}:

  let
    startupScript = pkgs.pkgs.writeShellScriptBin "start" ''
      ${pkgs.waybar}/bin/waybar &
      ${pkgs.swww}/bin/swww init &
      ${pkgs.dunst}/bin/dunst init &
  
      sleep 1
  
      ${pkgs.swww}/bin/swww img ${/home/mudia/Pictures/wallpapers/distortion1.jpg} &
    '';
in
{ 
    home.sessionVariables = {
    QT_QPA_PLATFORM = "wayland";
    SDL_VIDEODRIVER = "wayland";
    XDG_SESSION_TYPE = "wayland";
  };
 wayland.windowManager.hyprland = {
    xwayland = {
      enable = true;
    };
    enable = true;
    systemd = {
      variables = ["--all"];
      extraCommands = [
      ];
    };
    settings = {
            env = [
        "QT_QPA_PLATFORM,wayland"
        "QT_QPA_PLATFORMTHEME,qt5ct"
        "QT_WAYLAND_DISABLE_WINDOWDECORATION,1"
        "QT_AUTO_SCREEN_SCALE_FACTOR,1"
      ];
      exec-once = [

      ''${startupScript}/bin/start''
      "firefox"
      "kitty"
      "emacs"
      "pypr"

      ];
      input = {
        kb_layout = "us";
	follow_mouse = 2;
	sensitivity = 0;
      };
      general = {
      	monitor = [
          "eDP-1,2160x1350@60,0x0,1.2"
	];
        gaps_in = 5;
        gaps_out = 20;
        border_size = 1;
        "col.active_border" = "rgb(${config.colorScheme.palette.base0A})";
        "col.inactive_border" = "rgb(${config.colorScheme.palette.base03})";
        layout = "dwindle";
        allow_tearing = false;
        no_cursor_warps = true;
      };
      decoration = {
	rounding = 5;
	blur = {
          size = 4;
          passes = 4;
          };
        drop_shadow = "yes";
        shadow_range = 4;
        shadow_render_power = 3;
        "col.shadow" = "rgba(1a1a1aee)";
      };
      animation = {
        bezier = [
	  "myBezier, 0.05, 0.9, 0.1, 1.05"
	];
      	animation = [
       	  "windows, 1, 7, myBezier"
          "windowsOut, 1, 7, default, popin 80%"
          "border, 1, 10, default"
          "borderangle, 1, 8, default"
          "fade, 1, 7, default"
          "workspaces, 1, 6, default"
        ];
       };
      dwindle = {
        pseudotile = true;
    	preserve_split = true;
    	force_split = 2;
      };
      misc = {
        force_default_wallpaper = 0;
    	focus_on_activate = true;
    	disable_hyprland_logo = true;
        disable_splash_rendering = true;
      };
      "$MOD" = "SUPER";
      bind = [
      	"$MOD, Return, exec, kitty"
	"$MOD, Q, killactive" 
	"$MODSHIFT, Q, exit"
	"$MOD, E, exec, thunar"
	"$MOD, W, exec, firefox"
	"$MOD, Space, togglefloating"
	"$MOD, F, fullscreen" 
	"$MODSHIFT, F, fullscreen, 1"
	"$MOD, D, exec, rofi -show drun -show-icons"
	"$MOD, S, togglespecialworkspace"
        "$MODSHIFT, S, movetoworkspace, special"
	"$MOD, Space, togglefloating"
        "$MOD, K, movefocus, u"
        "$MOD, J, movefocus, d"
        "$MOD, L, movefocus, r"
        "$MOD, H, movefocus, l"
        "$MODSHIFT, K, movewindow, u"
        "$MODSHIFT, J, movewindow, d"
        "$MODSHIFT, L, movewindow, r"
        "$MODSHIFT, H, movewindow, l"
        "$MODCTRL, K, resizeactive,  0 -20"
        "$MODCTRL, J, resizeactive,  0 20"
        "$MODCTRL, L, resizeactive,  20 0"
        "$MODCTRL, H, resizeactive, -20 0"
	"${builtins.concatStringsSep "\n" (builtins.genList (x: let
            ws = let c = (x + 1) / 10; in builtins.toString (x + 1 - (c * 10));
          in ''
            bind = $MOD, ${ws}, workspace, ${toString (x + 1)}
            bind = $MODSHIFT, ${ws}, movetoworkspace, ${toString (x + 1)}
          '')
          10)}"
      ];
      bindl = [ 
        ",XF86AudioMute, exec, wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"
        ",XF86AudioRaiseVolume, exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%+"
        ",XF86AudioLowerVolume, exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"
	",XF86MonBrightnessDown, exec, brightnessctl set 5%-"
	",XF86MonBrightnessUp,exec,brightnessctl set +5%"
      ];
      bindm = ["$MOD, mouse:272, movewindow" "$MOD, mouse:273, resizewindow"];
      windowrulev2 = [
        "float,class:^(download)$"
        "float,title:^(Open File)$"
        "float,class:^(mpv)$"
        "float,class:^(thunar)$"
        "float, title:^(Picture-in-Picture)$"
        "pin, title:^(Picture-in-Picture)$"
        "idleinhibit focus, class:^(mpv|.+exe)$"
        "idleinhibit focus, class:^(firefox)$, title:^(.*Piped.*)$"
        "idleinhibit fullscreen, class:^(firefox)$"
      ];
      windowrule = [
        "workspace 1 silent, ^(.*Kitty.*)$"
        "workspace 2 silent, ^(.*firefox.*)$"
        "workspace 3 silent, ^(.*Emacs.*)$"
      ];
    };
  };
}
