{
  description = "My programs and configurations";

  inputs = {
    # Specify the source of Home Manager and Nixpkgs.
    nixpkgs.url = "github:nixos/nixpkgs/nixpkgs-unstable";
    # Pin displaylink to a known-working revision (broken in unstable)
    nixpkgs-displaylink.url = "github:nixos/nixpkgs/d1c15b7d5806069da59e819999d70e1cec0760bf";
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
      extraSpecialArgs = { inherit flakePath inputs outputs; };
      mkHost =
        hostname:
        nixpkgs.lib.nixosSystem {
          specialArgs = { inherit inputs outputs; };
          modules = [
            ./host/${hostname}/configuration.nix
            stylix.nixosModules.stylix
            home-manager.nixosModules.home-manager
            {
              # Pin displaylink package to a known-working nixpkgs revision
              nixpkgs.overlays = [
                (final: prev: {
                  displaylink = (import inputs.nixpkgs-displaylink {
                    system = prev.stdenv.hostPlatform.system;
                    config.allowUnfree = true;
                  }).displaylink;
                })
              ];
              # Register "displaylink" as a known driver name for the new
              # xserver validation (it uses modesetting, not a real X11 driver)
              services.xserver.drivers = [
                {
                  name = "displaylink";
                  modules = [ ];
                  driverName = "modesetting";
                  display = false;
                }
              ];
            }
            {
              home-manager = {
                inherit extraSpecialArgs;
                useGlobalPkgs = true;
                users.jack = import ./home/${hostname}.nix;
                sharedModules = [ stylix.homeModules.stylix ];
              };
            }
          ];
        };
    in
    {
      # Devshell for bootstrapping
      # Acessible through 'nix develop' or 'nix-shell' (legacy)
      devShells = perSystem (pkgs: import ./shell.nix { inherit pkgs; });

      nixosConfigurations = nixpkgs.lib.genAttrs [ "wungus" "ues-safe-travels" "hopoo" "bungus" ] mkHost;

      inherit (home-manager) packages;
    };

}
