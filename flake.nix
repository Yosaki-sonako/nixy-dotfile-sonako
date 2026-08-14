{
  description = "Sonako's Modular NixOS Flake Configuration";

  inputs = {
    nixpkgs.url = "git+https://github.com/nixos/nixpkgs.git?ref=nixos-unstable";
    home-manager = {
      url = "git+https://github.com/nix-community/home-manager.git";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nixvim = {
      url = "git+https://github.com/nix-community/nixvim.git";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs =
    {
      self,
      nixpkgs,
      home-manager,
      nixvim,
      ...
    }@inputs:
    let
      system = "x86_64-linux";
      pkgs = nixpkgs.legacyPackages.${system};
      username = "sonako";
    in
    {
      formatter.${system} = pkgs.nixfmt;

      nixosConfigurations.yosaki-nixos = nixpkgs.lib.nixosSystem {
        inherit system;
        specialArgs = { inherit inputs username; };
        modules = [
          ./hosts
        ];
      };

      homeConfigurations.${username} = home-manager.lib.homeManagerConfiguration {
        inherit pkgs;
        extraSpecialArgs = { inherit inputs username; };
        modules = [
          ./hosts/home.nix
          nixvim.homeManagerModules.nixvim
        ];
      };
    };
}
