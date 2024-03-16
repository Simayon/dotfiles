{ pkgs, config, lib, ... }:

let 
  inherit (import ../../options.nix) syncthing username userHome; 
in
  lib.mkIf syncthing {
    services = {
      syncthing = {
        enable = true;
        user = username;
        dataDir = "/home/${username}/Sync";    # Default folder for new synced folders
        configDir = "/home/${username}/.config/syncthing";   # Folder for Syncthing's settings and keys
        settings = {
          gui = {
            user = "wacka";
            password = "$2y$10$rrvvjmGw.wKm6LfcuhWIpe7h74836p0NU.hNJQe5N.PxDgVcYbXre";
          };
        };
      };
    };
  }
