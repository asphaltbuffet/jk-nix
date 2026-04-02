{
  description = "My programs and configurations";

  inputs = {
    # Specify the source of Home Manager and Nixpkgs.
    nixpkgs.url = "github:nixos/nixpkgs/nixpkgs-unstable";
    nixpkgs-stable.url = "github:nixos/nixpkgs/nixos-25.05";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    stylix = {
      url = "github:danth/stylix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs =
    {
      self,
      nixpkgs,
      home-manager,
      stylix,
      systems,
      ...
    }@inputs:
    let
      inherit (self) outputs;
      perSystem = callback: nixpkgs.lib.genAttrs (import systems) (system: callback (pkgs system));
      flakePath = config: "${config.home.homeDirectory}/code/github.com/jack-kelly/nix-config";
      pkgs =
        system:
        import nixpkgs {
          inherit system;
        };
      pkgs-stable =
        system:
        import inputs.nixpkgs-stable {
          inherit system;
          config.allowUnfree = true;
        };
      mkHost =
        hostname:
        nixpkgs.lib.nixosSystem {
          specialArgs = { inherit inputs outputs; };
          modules = [
            ./host/${hostname}/configuration.nix
            stylix.nixosModules.stylix
            home-manager.nixosModules.home-manager
            ({ config, ... }: {
              home-manager = {
                extraSpecialArgs = {
                  inherit flakePath inputs outputs;
                  pkgs-stable = pkgs-stable config.nixpkgs.hostPlatform.system;
                };
                useGlobalPkgs = true;
                users.jack = import ./home/${hostname}.nix;
                sharedModules = [ stylix.homeModules.stylix ];
              };
            })
          ];
        };
    in
    {
      # Devshell for bootstrapping
      # Acessible through 'nix develop' or 'nix-shell' (legacy)
      devShells = perSystem (pkgs: import ./shell.nix { inherit pkgs; });

      nixosConfigurations = nixpkgs.lib.genAttrs [ "wungus" "ues-safe-travels" "hopoo" "bungus" ] mkHost;
    };

}
