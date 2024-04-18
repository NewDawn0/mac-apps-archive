{
  description = "Useful mac apps";

  inputs = { nixpkgs.url = "github:nixos/nixpkgs"; };

  outputs = { self, nixpkgs, }:
    let eachSystem = nixpkgs.lib.genAttrs [ "x86_64-darwin" "aarch64-darwin" ];
    in {
      packages = eachSystem (system:
        let pkgs = nixpkgs.legacyPackages.${system};
        in {
          default = pkgs.stdenv.mkDerivation {
            name = "Mac util apps";
            src = ./.;
            installPhase = ''
              mkdir -p $out/Applications
              mv apps/* $out/Applications/
            '';
            meta = with pkgs.lib; {
              description = "Useful mac apps";
              platforms = platforms.darwin;
            };
          };
        });
    };
}
