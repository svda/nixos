# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:

{
  imports =
    [
      ./hardware/intel-nuc.nix
      ./system
      ./services
      ./packages
    ];

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.sander = {
    isNormalUser = true;
    extraGroups = [ "wheel" ]; # Enable ‘sudo’ for the user.
    openssh = {
      authorizedKeys = {
        keys = [
          "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIC/LfJFMjJ1RrfFEvd5WYnQUS/wB30UCPwG3ULkhZj74 sander@sandervandenakker.nl"
        ];
      };
    };
    packages = with pkgs; [
  #     firefox
  #     thunderbird
    ];
  };


}
