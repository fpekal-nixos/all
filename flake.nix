{
  description = "All my flakes added together";

  inputs = {
		nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";

		devShells = {
			url = "github:fpekal-nixos/devShells";

			inputs = {
				nixpkgs.follows = "nixpkgs";
			};
		};

		autogit = {
			url = "github:fpekal-nixos/autogit";

			inputs = {
				nixpkgs.follows = "nixpkgs";
			};
		};
  };

  outputs = { self, devShells, autogit, ... }: {
		devShells = devShells.devShells;

		overlays = {
			default = autogit.overlays.default;
		};

		nixosModules = {
			default = autogit.nixosModules.default;
		};
  };
}
