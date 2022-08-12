{ ... }:

{
  services.openssh.enable = true;  

  services.netatalk = {
    enable = true;
    settings = {
      "Backups on NixOS" = {
        "time machine" = "yes";
        path = "/home/sander/backups";
        "valid users" = "sander";
      };
      "NixOS configuration" = {
        path = "/etc/nixos";
        "valid users" = "sander";
      };
    };
  };

  services.avahi = {
    enable = true;
    nssmdns = true;
    publish = {
      enable = true;
      userServices = true;
    };
  };
}
