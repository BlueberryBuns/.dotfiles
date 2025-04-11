{
  pkgs ? import <nixpkgs> { },
}:

pkgs.mkShell {

  packages = [
    pkgs.go
    pkgs.sqlc
    pkgs.just
  ];

  shellHook = ''
    echo "Entrting the shell created for go project"
  '';

  SOME_ENV_VARIABLE = "abc";
}
