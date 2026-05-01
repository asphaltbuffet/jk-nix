hostname := `hostname`

# Show available recipes
default:
    @just --list

# Build the current host configuration
build:
    nh os build . --hostname {{hostname}}

# Build and switch to the current host configuration
switch:
    nh os switch . --hostname {{hostname}}

# Build and test (activate without adding boot entry)
test:
    nh os test . --hostname {{hostname}}

# Update flake inputs and switch
update-switch:
    nix flake update
    nh os switch . --hostname {{hostname}}

# Update flake inputs
update:
    nix flake update

# Garbage collect old generations (preserves direnv gcroots)
clean:
    nh clean all --keep 3 --no-gcroots

# Garbage collect everything, including direnv gcroots
clean-all:
    nh clean all --keep 3

# Format nix files
fmt:
    treefmt .

# Run flake checks
check:
    nix flake check

# Show flake inputs
inputs:
    nix flake metadata

# List available hosts
hosts:
    @ls -1 host/*/configuration.nix | sed 's|host/||;s|/configuration.nix||'

# Build a recovery ISO for a host
iso host:
    nix build .#iso-{{host}} -L

# Show current NixOS generation
generation:
    nixos-rebuild list-generations | head -5
