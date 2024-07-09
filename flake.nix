{
  description = "All my flakes added together";

  inputs = {
		devShells.url = "github:fpekal-nixos/devShells";
  };

  outputs = { self, devShells }: {
		devShells = devShells.devShells;
  };
}
