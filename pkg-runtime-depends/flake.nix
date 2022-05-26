{
	description = "test";

	inputs.nixpkgs.url = "github:NixOS/nixpkgs";

	outputs = { self, nixpkgs }:
	{
		defaultPackage.x86_64-linux = 
			with import nixpkgs { system = "x86_64-linux"; };
			stdenv.mkDerivation {
				src = self;
				name = "testing";
				buildInputs = [ sl neovim ];
				installPhase = "mkdir -p $out/bin; for p in $buildInputs; do ln -sf $p/bin/* $out/bin; done";
			};
	};
}
