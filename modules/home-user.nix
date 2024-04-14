{ config, pkgs, inputs, ... }:
{
  home = {
    stateVersion = "23.11";
    username = "mudia";
    homeDirectory = "/home/mudia";
    packages = with pkgs; [ pkgs.dconf ];
  };

    programs.home-manager.enable = true;
}
