# shellcheck disable=SC2148
# These are the first files read by Zsh for setting environment variables.
# The /etc/zsh/zshenv is used for all users, and $ZDOTDIR/.zshenv
# (or ~/.zshenv if ZDOTDIR is not set) is for the individual user.
# These files are always read, regardless of the type of shell session.
# it's a good place for PATH and other critical environment variables
# that programs rely on.

OS_TYPE=$(uname -s)

# Function to check if the OS is MacOS
is_macos() {
    [[ "${OS_TYPE}" == "Darwin" ]]
}

# Function to check if the OS is Linux
is_linux() {
    [[ "${OS_TYPE}" == "Linux" ]]
}

if is_macos; then
    # Golang
    export GOROOT=/usr/local/go
    export GOPATH="/Users/${USER}/code"

    # PATH
    PATH="${PATH}:${GOROOT}/bin"
fi

export PATH

# Check if .zshenv_local exists and source it
if [[ -f "${ZDOTDIR}/extras/.zshenv_local" ]]; then
    # shellcheck disable=SC1091
    source "${ZDOTDIR}/extras/.zshenv_local"
fi
