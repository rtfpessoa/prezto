#
# Loads the Nodenv.
#

# Load manually installed nodenv into the shell session.
if [[ -s "$HOME/.nodenv/bin/nodenv" ]]; then
  path=("$HOME/.nodenv/bin" $path)
  eval "$(nodenv init - --no-rehash zsh)"

# Load package manager installed nodenv into the shell session.
elif (( $+commands[brew] )) && [[ -d "/usr/local/opt/nodenv" ]] || [[ -d "$(brew --prefix nodenv 2>/dev/null)" ]]; then
  eval "$(nodenv init - --no-rehash zsh)"

# Return if requirements are not found.
elif (( ! $+commands[node] )); then
  return 1
fi
