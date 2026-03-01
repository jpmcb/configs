export SSH_AUTH_SOCK=~/Library/Group\ Containers/2BUA8C4S2C.com.1password/t/agent.sock
export PATH="$HOME/.npm-global/bin:$PATH"
export PATH="$HOME/.local/bin:$PATH"

# Go stuff
export GOBIN="$HOME/.local/bin"

# Set GitHub access token for Nix flake fetching (if gh is logged in)
if command -v gh &>/dev/null; and gh auth status &>/dev/null 2>&1
  set -gx NIX_CONFIG "access-tokens = github.com="(gh auth token)
end

jump shell fish | source

atuin init fish | source
