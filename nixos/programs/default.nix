{ pkgs, ... }: {
  imports = [
    ./misc.nix
    ./web.nix
    ./passwords.nix
  ];
}
