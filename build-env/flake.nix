{
	description = "testing";

	inputs.nixpkgs.url = "github:NixOS/nixpkgs";

	outputs = { self, nixpkgs }:
	{
		defaultPackage.x86_64-linux = 
			nixpkgs.legacyPackages.x86_64-linux.buildEnv {
				name = "my-teststuff";
				paths = with nixpkgs.legacyPackages.x86_64-linux; [
					cowsay
					neovim
				];
			};
	};
}
