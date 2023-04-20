{
  outputs = { self, nixpkgs, flake-utils }:
    flake-utils.lib.eachDefaultSystem (system:
      let pkgs = nixpkgs.legacyPackages.${system};
      in
      {
        packages.default = pkgs.stdenvNoCC.mkDerivation rec {
          name = "algol-cs";
          src = builtins.path { inherit name; path = ./.; };

          buildInputs = with pkgs; [
            (texlive.combine {
              inherit (texlive) scheme-small titlesec cm-super fancyhdr enumitem;
            })
          ];

          makeFlags = [ "PREFIX=$(out)" ];
        };
      }
    );
}
