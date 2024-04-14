{config, pkgs, ...}: {
  services.dunst = {
    enable = true;
    inherit (config.gtk) iconTheme;
    settings = {
      global = {
        follow = "mouse";
        width = 500;
        origin = "top-center";
        alignment = "left";
        vertical_alignment = "center";
        ellipsize = "middle";
        offset = "0x12";
        padding = 15;
        horizontal_padding = 15;
        text_icon_padding = 15;
        icon_position = "left";
        min_icon_size = 48;
        max_icon_size = 64;
        progress_bar = true;
        progress_bar_height = 8;
        progress_bar_frame_width = 1;
        progress_bar_min_width = 150;
        progress_bar_max_width = 300;
        separator_height = 2;
        frame_width = 1;
        frame_color = "#${config.colorScheme.palette.base01}";
        separator_color = "frame";
        corner_radius = 5;
        transparency = "0.8";
        gap_size = 8;
        line_height = 0;
        notification_limit = 0;
        idle_threshold = 120;
        history_length = 20;
        show_age_threshold = 60;
        markup = "full";
        word_wrap = "yes";
        sort = "yes";
        shrink = "no";
        indicate_hidden = "yes";
        sticky_history = "yes";
        ignore_newline = "no";
        show_indicators = "no";
        stack_duplicates = true;
        always_run_script = true;
        hide_duplicate_count = false;
        ignore_dbusclose = false;
        force_xwayland = false;
        force_xinerama = false;
        mouse_left_click = "do_action";
        mouse_middle_click = "close_all";
        mouse_right_click = "close_current";
      };
      urgency_critical = {
        background = "#${config.colorScheme.palette.base0A}"; 
        foreground = "#${config.colorScheme.palette.base06}"; 
        frame_color = "#${config.colorScheme.palette.base0A}";
      };
      urgency_low = {
        background = "#000000CC";
        foreground = "#${config.colorScheme.palette.base06}";
        frame_color = "#${config.colorScheme.palette.base01}";
      };
      urgency_normal = {
        background = "#000000CC";
        foreground = "#${config.colorScheme.palette.base06}";
        frame_color = "#${config.colorScheme.palette.base01}";
      };
    };
  };
}
