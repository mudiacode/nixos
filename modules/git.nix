{ config, pkgs, inputs, ... }:
{
    programs.git = {
      enable = true;
      userName = "mudia";
      userEmail = "mudia@nixos.com";
      extraConfig = {
        init.defaultBranch = "main";
      };
    };
}
