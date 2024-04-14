{config, pkgs, inputs, ...}:
{
    programs.kitty = {
      enable = true;
      font = {
        name = "JetBrainsMono Nerd Font";
      };
      settings = {
        enable_audio_bell = false;
	confirm_os_window_close = 0;
	window_margin_width = 10;
	background_opacity = "0.8";
  initial_command = "neofetch --kitty";

	color0 = "#${config.colorScheme.palette.base00}";
	color1 = "#${config.colorScheme.palette.base01}";
	color2 = "#${config.colorScheme.palette.base09}";
	color3 = "#${config.colorScheme.palette.base03}";
	color4 = "#${config.colorScheme.palette.base04}";
	color5 = "#${config.colorScheme.palette.base05}";
	color6 = "#${config.colorScheme.palette.base06}";
	color7 = "#${config.colorScheme.palette.base07}";
	color8 = "#${config.colorScheme.palette.base08}";
	color9 = "#${config.colorScheme.palette.base09}";
	color10 = "#${config.colorScheme.palette.base0A}";
	color11 = "#${config.colorScheme.palette.base0B}";
	color12 = "#${config.colorScheme.palette.base0C}";
	color13 = "#${config.colorScheme.palette.base0D}";
	color14 = "#${config.colorScheme.palette.base0E}";
	color15 = "#${config.colorScheme.palette.base0F}";
      };
    };
}
