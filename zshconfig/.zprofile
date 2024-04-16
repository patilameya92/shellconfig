# These files are read when starting as a login shell.
# They are used for executing commands at the start of a login session.
# The /etc/zsh/zprofile is for all users, and $ZDOTDIR/.zprofile is for
# the individual user.

OS_TYPE=$(uname -s)

# Function to check if the OS is MacOS
is_macos() {
    [[ "${OS_TYPE}" == "Darwin" ]]
}

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

    # Git prompt configuration for MacOS
    GITPROMPT_SCRIPT='/Library/Developer/CommandLineTools/usr/share/git-core/git-prompt.sh'
    # shellcheck disable=SC1090
    source "${GITPROMPT_SCRIPT}"
fi

# Check if .zprofile_local exists and source it
if [[ -f "${ZDOTDIR}/extras/.zprofile_local" ]]; then
    source "${ZDOTDIR}/extras/.zprofile_local"
fi
