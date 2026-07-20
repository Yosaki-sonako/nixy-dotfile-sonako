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

  outputs = { self, nixpkgs, home-manager, nixvim, ... }@inputs: {
    nixosConfigurations.yosaki-nixos = nixpkgs.lib.nixosSystem {
	  system = "x86_64-linux";
	  modules = [ ./hosts ];
};

    homeConfigurations.sonako = home-manager.lib.homeManagerConfiguration {
	pkgs = nixpkgs.legacyPackages.x86_64-linux;
	modules = [
	  ./hosts/home.nix
	  nixvim.homeManagerModules.nixvim
	  ];
	extraSpecialArgs = { inherit inputs; };
  	};
  };
}

