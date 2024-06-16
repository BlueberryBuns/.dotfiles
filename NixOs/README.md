# Setup
The follwing setup is to reproduce my profile, to adjust your config please follow the setps mentioned in #CreateNewSetup

In order to create your own system please run the following commands:
```bash
ssh-keygen -t ed25519 -C "your_email@email.com"
git clone git@github.com:BlueberryBuns/.dotfiles.git
```

```bash
cp /etc/nixos/hardware-configuration.nix ~/.dotfiles/NixOs/hosts/hulewicz-pc/hardware-configuraiton.nix
chmod 777 ~/.dotfiles/NixOs/hosts/hulewicz-pc/hardware-configuration.nix
```

```bash
nix-shell -p git neovim
sudo nixos-rebuild switch --flake ~/.dotfiles/NixOs#hulewicz-pc
```
