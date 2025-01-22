# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
    ];

  
  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  services.tlp.enable = true;

  networking.hostName = "nixos"; # Define your hostname.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Enable networking
  networking.networkmanager.enable = true;

  # Set your time zone.
  time.timeZone = "Africa/Cairo";
  fonts.fontDir.enable = true;
  fonts.fontconfig.enable = true;

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "en_US.UTF-8";
    LC_IDENTIFICATION = "en_US.UTF-8";
    LC_MEASUREMENT = "en_US.UTF-8";
    LC_MONETARY = "en_US.UTF-8";
    LC_NAME = "en_US.UTF-8";
    LC_NUMERIC = "en_US.UTF-8";
    LC_PAPER = "en_US.UTF-8";
    LC_TELEPHONE = "en_US.UTF-8";
    LC_TIME = "en_US.UTF-8";
  };

  # Configure keymap in X11
  services.xserver.xkb = {
    layout = "us";
    variant = "";
  };

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.marwan = {
    isNormalUser = true;
    description = "marwan";
    extraGroups = [ "networkmanager" "wheel" ];
    packages = with pkgs; [];
  };

 xdg = {
    autostart.enable = true;
    portal = {
       extraPortals = [
	    pkgs.xdg-desktop-portal
	    pkgs.xdg-desktop-portal-gtk
       ];
    };
 };

 services.xserver.displayManager.gdm = {
	enable = true;
	wayland = true;
};

services.dbus.enable = true;
services.gvfs.enable = true;

programs = {
	hyprland = {
		enable = true;
		xwayland = {
			enable = true;
		};
	};
	waybar = {
		enable = true;
	};
};


  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
   vim # Do not forget to add an editor to edit configuration.nix! The Nano editor is also installed by default.
   wget
   kitty
   polkit_gnome
   udiskie
   swaynotificationcenter
   wlr-randr
   ydotool
   wl-clipboard
   hyprland-protocols
   hyprpicker
   swayidle
   swaylock
   xdg-desktop-portal-hyprland
   hyprpaper
   rofi-wayland
   firefox-wayland
   swww
   grim
   xdg-utils
   xdg-desktop-portal
   xdg-desktop-portal-gtk   
   helix
   waybar
   git
   rustup
   fastfetch
   rustup
   go
   pcmanfm
   ppsspp
   networkmanagerapplet
   dunst
   libgcc
   gcc
   vlc
   geeqie
   font-awesome
   btop
   nerdfonts
   fzf
   ghostty
   foot
   ripgrep
   fzf
   mpd
   brightnessctl
   playerctl
   yazi
   swaylock
   hyprlock
   spotify
   brave
   chromium
   zathura
   zellij
   gopls
   lazygit
   htop
  ];
  
fonts.packages = with pkgs; [
  (nerdfonts.override { fonts = [ "FiraCode" "ZedMono"]; })
  font-awesome
];

  environment.sessionVariables = {
    XDG_SESSION_TYPE = "wayland";
    WLR_NO_HARDWARE_CURSORS = "1";
    NIXOS_OZONE_WL = "1";
    MOZ_ENABLE_WAYLAND = "1";
    SDL_VIDEODRIVER = "wayland";
    _JAVA_AWT_WM_NONREPARENTING = "1";
    CLUTTER_BACKEND = "wayland";
    XDG_CURRENT_DESKTOP = "Hyprland";
    XDG_SESSION_DESKTOP = "Hyprland";
    GTK_USE_PORTAL = "1";
    NIXOS_XDG_OPEN_USE_PORTAL = "1";
  }; 

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };

  # List services that you want to enable:

  # Enable the OpenSSH daemon.
  # services.openssh.enable = true;

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "24.11"; # Did you read the comment?

}
