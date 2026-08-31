export PATH="$HOME/.npm-global/bin:$PATH"
export PATH="$HOME/.local/bin:$PATH"
export PATH="$HOME/.cargo/bin:$PATH"

# Go stuff
export GOBIN="$HOME/.local/bin"

# Set GitHub access token for Nix flake fetching (if gh is logged in)
if command -v gh &>/dev/null; and gh auth status &>/dev/null 2>&1
  set -gx NIX_CONFIG "access-tokens = github.com="(gh auth token)
end

jump shell fish | source

atuin init fish | source

paperctl shell fish | source
