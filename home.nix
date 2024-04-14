{ config, pkgs, inputs, ... }:
{
  imports = [
    ./modules/hyprland.nix
    ./modules/kitty.nix
    ./modules/xdg.nix
    ./modules/gtk.nix
    ./modules/qt.nix
    ./modules/git.nix
    ./modules/color.nix
    ./modules/home-user.nix
    ./modules/neofetch.nix
    ./modules/dunst.nix
  ];
}
