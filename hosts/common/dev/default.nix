{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    wget
    git
    python310
    python311
    python312
    erlang_27
    elixir
    slack
    gofumpt
    go
  ];
}
