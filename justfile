# List available recipes
default:
    @just --list

# Automatic git commit/push
save:
    git add -A
    git commit -sS -m "Config save: $(date)"
    git push

# Builds the .#westgate nix-darwin target
westgate:
    sudo nix \
        --extra-experimental-features 'nix-command flakes' \
        run nix-darwin -- switch --flake .#westgate --impure
