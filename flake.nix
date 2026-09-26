{
  description = "Home Manager configuration of ricomonster";

  inputs = {
    # Specify the source of Home Manager and Nixpkgs.
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    apple-fonts = {
      url = "github:Lyndeno/apple-fonts.nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

outputs = { nixpkgs, home-manager, apple-fonts, ... }:
  let
    mkHome = { system, theme, platformModule }:
      home-manager.lib.homeManagerConfiguration {
        pkgs = nixpkgs.legacyPackages.${system};
        extraSpecialArgs = { inherit theme apple-fonts; };
        modules = [ ./home.nix platformModule ];
      };
  in {
    homeConfigurations = {
      pewds = mkHome {
        system = "x86_64-linux"; theme = "pewds"; platformModule = ./linux.nix;
      };
      arch = mkHome {
        system = "x86_64-linux"; theme = "default"; platformModule = ./linux.nix;
      };
      silicon = mkHome {
        system = "aarch64-darwin"; theme = "default"; platformModule = ./darwin.nix;
      };
      intel = mkHome {
        system = "x86_64-darwin"; theme = "default"; platformModule = ./darwin.nix;
      };
    };
  };
}
