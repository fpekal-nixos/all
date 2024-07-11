{
  description = "All my flakes added together";

  inputs = {
		nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-24.05";

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

		launchpad = {
			url = "github:fpekal-nixos/launchpad";

			inputs = {
				nixpkgs.follows = "nixpkgs";
			};
		};
  };

  outputs = { self, devShells, autogit, launchpad, ... }: {
		devShells = devShells.devShells;

		overlays = {
			default = autogit.overlays.default;
		};

		nixosModules = {
			default =
			{ ... }:
			{
				imports = [
					autogit.nixosModules.default
					launchpad.nixosModules.default
				];
			};
		};
  };
}
