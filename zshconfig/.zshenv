# These are the first files read by Zsh for setting environment variables.
# The /etc/zsh/zshenv is used for all users, and $ZDOTDIR/.zshenv
# (or ~/.zshenv if ZDOTDIR is not set) is for the individual user.
# These files are always read, regardless of the type of shell session.
# it's a good place for PATH and other critical environment variables
# that programs rely on.

# Golang
export GOROOT=/usr/local/go
export GOPATH="/Users/${USER}/code"

# PATH
export PATH="${PATH}:${GOROOT}/bin"
