{
  description = "Skia Env";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-25.05";
  };

  nixConfig = {
    bash-prompt = "(*) \\033[0;34m\\w\\033[0m \\033[1m$\\033[0m ";
  };

  outputs = { self , nixpkgs ,... }: let
    shellDerivation = system: let
      pkgs = import nixpkgs { inherit system; };
    in pkgs.mkShell {
      packages = with pkgs; [
        bazelisk
        python3
      ];
      shellHook = ''
        export PATH="$PATH:$PWD/depot_tools"
        '';
    };
  in {
    devShells.x86_64-linux.default = shellDerivation "x86_64-linux";
    devShells.x86_64-darwin.default = shellDerivation "x86_64-darwin";
    devShells.aarch64-darwin.default = shellDerivation "aarch64-darwin";
  };
}
