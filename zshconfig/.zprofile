# These files are read when starting as a login shell.
# They are used for executing commands at the start of a login session.
# The /etc/zsh/zprofile is for all users, and $ZDOTDIR/.zprofile is for
# the individual user.

OS_TYPE=$(uname -s)

# Function to check if the OS is MacOS
is_macos() {
    [[ "${OS_TYPE}" == "Darwin" ]]
  
    export MACOS_CPU=$(sysctl -n machdep.cpu.brand_string)
}

# Homebrew for MacOS
if is_macos; then
    if [[ "${MACOS_CPU}" == "Apple*" ]]; then
        eval "$(/opt/homebrew/bin/brew shellenv)"
    else
        eval "$(/usr/local/bin/brew shellenv)"
    fi
fi

# Git prompt configuration for MacOS
if is_macos; then
    GITPROMPT_SCRIPT='/Library/Developer/CommandLineTools/usr/share/git-core/git-prompt.sh'
    # shellcheck disable=SC1090
    source "${GITPROMPT_SCRIPT}"    
fi
