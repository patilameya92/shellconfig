# shellcheck disable=SC2148
# These files are read when starting as a login shell.
# They are used for executing commands at the start of a login session.
# This file is used for configurations that should be applied once at login.
# The /etc/zsh/zprofile is for all users, and $ZDOTDIR/.zprofile is for
# the individual user.

# macOS specific configuration
if is_macos; then
    # Set the macOS machine CPU type
    MACOS_CPU=$(sysctl -n machdep.cpu.brand_string)
    export MACOS_CPU

    # Set Homebrew path
    if [[ "${MACOS_CPU}" == Apple* ]]; then
        eval "$(/opt/homebrew/bin/brew shellenv)"
    else
        eval "$(/usr/local/bin/brew shellenv)"
    fi
fi

# Check if .zprofile_local exists and source it
if [[ -f "${ZDOTDIR}/extras/.zprofile_local" ]]; then
    # shellcheck disable=SC1091
    source "${ZDOTDIR}/extras/.zprofile_local"
fi
