{
  description = "My programs and configurations";

  inputs = {
    # Specify the source of Home Manager and Nixpkgs.
    nixpkgs.url = "github:nixos/nixpkgs/nixpkgs-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs =
    { nixpkgs, home-manager, ... }:
    {
      # Standalone home-manager configuration entrypoint
      # Available through 'home-manager --flake .#hostname'
      homeConfigurations = {
        "wungus" = home-manager.lib.homeManagerConfiguration {
          pkgs = nixpkgs.legacyPackages.x86_64-linux;
          modules = [ ./home/wungus.nix ];
        };
        "hopoo" = home-manager.lib.homeManagerConfiguration {
          pkgs = nixpkgs.legacyPackages.x86_64-linux;
          modules = [ ./home/hopoo.nix ];
        };
      };

      nixosConfigurations = {
        "hopoo" = nixpkgs.lib.nixosSystem {
          system = "x86_64";
          modules = [
            ./host/hopoo/configuration.nix
            ./host/hopoo/hardware-configuration.nix
          ];
        };
         "wungus" = nixpkgs.lib.nixosSystem {
          system = "x86_64";
          modules = [
            ./host/wungus/configuration.nix
            ./host/wungus/hardware-configuration.nix
          ];
        };
      };

      inherit home-manager;
      inherit (home-manager) packages;
    };

}
