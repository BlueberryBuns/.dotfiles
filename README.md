# NixOS config

This setup will require backing up your private SSH key after generation (I will provide tutorial on how to start from scratch later)

## First System Setup
```shell
# Download all of the prerequisites
$ nix-shell -p git vim sops

# Generate your SSH key
$ ssh-keygen -t ed25519 -C "your_email@example.com"

# Save your ~/.ssh/id_ed25519 (private and public key) in password database

# Create directories for your sops config
$ mkdir ~/.config/sops/age

# Generate your USER Private AGE KEY
$ nix --extra-experimental-features "nix-command" run nixpkgs#ssh-to-age -- -private-key -i ~/.ssh/id_ed25519 > ~/.config/sops/age/keys.txt

# Generate your USER Public AGE KEY (To be copied to the `.sops.yaml` config below)
$ nix --extra-experimental-features "nix-command" shell nixpkgs#age -c age-keygen -y ~/.config/sops/age/keys.txt

# Copy generated Public AGE KEY to your sops config (below) in the root directory of the repo (~/.dotfiles/.sops.yaml)
```

Example Sops config, feel free to extend or remove not needed entries
```yaml
keys:
  - &users:
    - &hulewicz {{YOUR AGE [USER] KEY HERE}}
creation_rules:
  - path_regex: secrets/secrets.yaml$
    key_groups:
    - age:
      - *hulewicz
```

Run command that will open sops decoded example file in default editor
```shell
sops secrets/secrets.yaml
```

replace the config content with the desired set of variables.
```yaml
variable_a: 123
user-email: zajonc123@gmail.com

# NOTE: is you want to save user password, it has to be encrypted, simply run: echo zajonc | mkpasswd -s
# Then copy the encrypted result to the sops file
user-password: $y$j9T$.HCVPObtCkCdLGpnkb4py.$jtfX5jMj0Bc/lkCN4O2SvzXOoVvVBZNvW1qBRCIhxk1
```

## Subsequent System Setups
This is the regular part if you have your config backed up
```shell
# Download all of the prerequisites
$ nix-shell -p git vim keepassxc 

# Copy your backed up private AGE KEY from Password Storage
$ mkdir ~/.config/sops/age
$ echo {{PRIVATE AGE KEY}} > ~/.config/sops/age/keys.txt

# Create directories for your sops config
$ mkdir ~/.config/sops/age

# Generate your Private AGE KEY
$ nix --extra-experimental-features "nix-command" run nixpkgs#ssh-to-age -- -private-key -i ~/.ssh/id_ed25519 > ~/.config/sops/age/keys.txt

# Generate your Public AGE KEY
$ nix --extra-experimental-features "nix-command" shell nixpkgs#age -c age-keygen -y ~/.config/sops/age/keys.txt

# This should be enough for the sops to work with the current setup
```
