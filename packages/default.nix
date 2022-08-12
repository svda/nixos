{ config, pkgs, ... }:

{
  nixpkgs.config = with pkgs; {
    packageOverrides = super: let self = super.pkgs; in {
      # 3.1.13 has kernel panics
      netatalk = super.netatalk.overrideDerivation (old: {
        version = "3.1.12";
        src = fetchurl {
          url = "mirror://sourceforge/netatalk/netatalk/netatalk-3.1.12.tar.bz2";
          sha1 = "cc1fe1ebdbdb4da9cf82835c440e82ba28a832c5";
        };
      });
    };
  };

  environment.systemPackages = with pkgs; [
    git
    nano
    wget
    netatalk
  ];
}
