{
  description = "ZaneyOS";

  inputs = {
    # Nixpkgs
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    # Home Manager
    home-manager.url = "github:nix-community/home-manager/master";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";

    # Theme Settings
    nix-colors.url = "github:misterio77/nix-colors";

    # Hyprland
    hyprland.url = "github:hyprwm/Hyprland";
    hyprland-plugins = {
      url = "github:hyprwm/hyprland-plugins";
      inputs.hyprland.follows = "hyprland";
    };

    # Neovim
    nixvim = {
      url = "github:nix-community/nixvim";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # Impermanence
    impermanence.url = "github:nix-community/impermanence";

    # TODO: Add any other flake file that will be needed below
  };

  outputs = inputs@{ nixpkgs, home-manager, impermanence, ... }:

  let

  # supported system for this flake.nix file
  system = "x86_64-linux";
  inherit (import ./options.nix) username hostname;

  pkgs = import nixpkgs {
    inherit system;
    config = {
      allowUnfree = true;
    };
  };

  in {

    # Nixos Configuration Entry point
    # Available through 'nixos-rebuild flake .#hostname'
    nixosConfigurations = {
      "${hostname}" = nixpkgs.lib.nixosSystem {
        specialArgs = { 
          inherit system; inherit inputs; 
          inherit username; inherit hostname;
        };
        modules = [ 
          ./system.nix
          impermanence.nixosModules.impermanence
          home-manager.nixosModules.home-manager {
            home-manager.extraSpecialArgs = {
              inherit username; inherit inputs;
              inherit (inputs.nix-colors.lib-contrib {inherit pkgs;}) gtkThemeFromScheme;
            };
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.backupFileExtension = "backup";
            home-manager.users.${username} = import ./home.nix;
          }
        ];
      };
    };
  };
}
