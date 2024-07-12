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
		};

		gate = {
			url = "github:fpekal-nixos/gate";

			inputs = {
				nixpkgs.follows = "nixpkgs";
			};
		};

		super-cowsay = {
			url = "github:fpekal-nixos/super-cowsay";

			inputs = {
				nixpkgs.follows = "nixpkgs";
			};
		};
  };

  outputs = { self, ... }@inputs: {
		devShells = inputs.devShells.devShells;

		overlays = {
			default = final: prev: (
				(inputs.autogit.overlays.default final prev) //
				(inputs.gate.overlays.default final prev) //
				(inputs.super-cowsay.overlays.default final prev)
			);
		};

		nixosModules = {
			default =
			{ ... }:
			{
				imports = [
					inputs.autogit.nixosModules.default
					inputs.launchpad.nixosModules.default
					inputs.gate.nixosModules.default
				];
			};
		};
  };
}
