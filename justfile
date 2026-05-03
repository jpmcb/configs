save:
    git add -A
    git commit -sS -m "Config save: $(date)"
    git push

westgate:
    sudo nix \
        --extra-experimental-features 'nix-command flakes' \
        run nix-darwin -- switch --flake .#westgate --impure
