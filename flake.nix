{
  description = "dirtree Flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
  };

  outputs = inputs: {
    packages = builtins.mapAttrs
      (system: _:
        let pkgs = inputs.nixpkgs.legacyPackages.${system};
        in
        {
          default = pkgs.buildRubyGem {
            gemName = "dirtree";
            name = "drtree-1.0.0";
            version = "1.0.0";
            type = "gem";
            source = {
              remotes = [ "https://rubygems.org" ];
              sha256 = "sha256-MQRFHfQ9ur6WnH3oar/cMzABt5GG7HKkZ4/d5bcy2HU=";
            };
            propagatedBuildInputs = with pkgs.ruby.gems; [
            ];
          };
        }
      )
      inputs.nixpkgs.legacyPackages;
  };
}
