# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:

{
  imports =
    [ 
      ./hardware-configuration.nix
    ];

  programs = {
    hyprland = {
enable = true;
  xwayland = {
    enable = true;
  };
    };
    thunar.enable = true;
    fish = {
      enable = true;
      shellAliases = {
        v = "nvim";
    };
      interactiveShellInit = ''set fish_greeting'';
    };
  };

  environment.sessionVariables.NIXOS_OZONE_WL = "1";

  fonts.packages = with pkgs; [
    noto-fonts
    noto-fonts-cjk
    noto-fonts-emoji
    nerdfonts
  ];

  boot.loader = {
    systemd-boot.enable = true;
    efi.canTouchEfiVariables = true;
  };

  networking = {
    hostName = "nixos";
    wireless = {
      enable = true;
      networks.VM2119B8.psk = "yb7tLeyddppv";
    };
  };

  time.timeZone = "Europe/London";

  i18n = {

    defaultLocale = "en_GB.UTF-8";

    extraLocaleSettings = {
      LC_ADDRESS = "en_GB.UTF-8";
      LC_IDENTIFICATION = "en_GB.UTF-8";
      LC_MEASUREMENT = "en_GB.UTF-8";
      LC_MONETARY = "en_GB.UTF-8";
      LC_NAME = "en_GB.UTF-8";
      LC_NUMERIC = "en_GB.UTF-8";
      LC_PAPER = "en_GB.UTF-8";
      LC_TELEPHONE = "en_GB.UTF-8";
      LC_TIME = "en_GB.UTF-8";
    };
  };


  services = {
    emacs = {
      enable = true;
    };
    pipewire = {
      enable = true;
      alsa = {
         enable = true;
         support32bit = true;
      };
      alsa.enable = true;
      alsa.support32Bit = true;
      pulse.enable = true;
      jack.enable = true;
    };
    xserver = {
      enable = true;
      displayManager.sddm.enable = true;
      layout = "us";
   };
  };

  sound.enable = true;
  hardware.pulseaudio.enable = false;
  security.rtkit.enable = true;

  users = {
    defaultUserShell = pkgs.fish;
     users.mudia = {
      isNormalUser = true;
      description = "Mudia";
      extraGroups = [ "wheel" ];
    };
  };

  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  environment = {
    shells = with pkgs; [ fish ];
    systemPackages = with pkgs; [
      git
      wget
      curl
      dunst
      libnotify
      rofi-wayland
      lf
      waybar
      firefox
      nerdfonts
      sxiv
      swww
      zathura
      neovide
      brightnessctl
      neofetch
      mpv
      wl-clipboard
      neovim
      ripgrep
      gcc
      unzip
      imagemagick
      swayosd
      emacs
      coreutils
      fd
      clang
      xwayland
      ventoy-full
    ];
    variables.EDITOR = "neovim";
    variables.PATH = "$HOME/.emacs.d/bin:$PATH";
  };

  system.stateVersion = "23.11";

}
