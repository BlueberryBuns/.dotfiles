# Setup

in order to create your own system please run the followin command:
```bash
sudo nixos-rebuild switch --flake /home/hulewicz/.dotfiles/NixOs#default

# In general the configuration command follows pattern
sudo nixos-rebuild switch --flake /path/to/nixos/dir#hostname
```
