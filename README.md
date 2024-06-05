# Purpose

## Setup

### Zsh

#### For MacOS

To set up Zsh config on macOS, install prerequisites and then set the ZDOTDIR variable.

##### Install macOS Prerequisites

- [Xcode command line tools](https://mac.install.guide/commandlinetools/4)  
- Brew: [https://brew.sh/](https://brew.sh)  
- Antidote: `brew install antidote`

#### For Rocky Linux 9

To set up Zsh config on Rocky Linux 9, install prerequisites and then set the ZDOTDIR variable.

##### Install Rocky Linux 9 Prerequisites

- Download the [git-prompt.sh](https://raw.githubusercontent.com/zsh-users/zsh/master/Functions/Misc/colors) script. In `${ZDOTDIR}/extras/.zshenv_local` set `LINUX_GITPROMPT_SCRIPT_PATH` as the location of the downloaded git-prompt.sh file. 
- Install [anitode](https://github.com/mattmc3/antidote) using git: <https://getantidote.github.io/install>. In `${ZDOTDIR}/extras/.zshenv_local` set `LINUX_ANTIDOTE_PATH` as the location of the `antidote.zsh` file from the downloaded antidote git repo.

#### Set ZDOTDIR in `/etc/zshenv`

Add the following to `/etc/zshenv`, if the file does not exist create it. The file creation will require root access.  

```zsh
# Set ZDOTDIR environment variable for the admin user

if [ "${USER}" = "admin" ]; then
    export ZDOTDIR="/Users/admin/code/src/github.com/patilameya92/shellconfig/zshconfig"
fi
```

Replace `admin` with your username. Set ZDOTDIR to the path of your zshconfig directory.

For macOS if root access is **not** available:

- Open Automator.
- Create a new document by selecting "File" > "New" from the menu bar, and choose the type of document you want to create i.e "Application". In the search bar located in the upper left corner of the Automator window, type "Run Shell Script" to find the action quickly. Drag the "Run Shell Script" action from the results on the left side of the window to the workflow area on the right side.
- In the "Run Shell Script" action that you've just added to the workflow, you'll see a text area where you can enter shell commands. Here, you should enter the command to set the ZDOTDIR environment variable. Assuming the path to your zshconfig directory is /Users/admin/code/src/github.com/patilameya92/shellconfig/zshconfig, the command would be: `launchctl setenv ZDOTDIR /Users/admin/code/src/github.com/patilameya92/shellconfig/zshconfig`
- Save the Automator Application to your Applications folder or another convenient location. You can name it something like "SetZDOTDIRApp".
- Go to System Preferences > General > Login Items.
- Click the "+" button to add a new login item, navigate to where you saved your Automator Application ("SetZDOTDIRApp"), select it, and add it to the list.

## Explanation

### Zsh Plugins

zsh-users/zsh-autosuggestions: [https://github.com/zsh-users/zsh-autosuggestions](https://github.com/zsh-users/zsh-autosuggestions)  
zsh-users/zsh-completions: [https://github.com/zsh-users/zsh-completions](https://github.com/zsh-users/zsh-completions)  
zsh-users/zsh-history-substring-search: [https://github.com/zsh-users/zsh-history-substring-search](https://github.com/zsh-users/zsh-history-substring-search)  
zsh-users/zsh-syntax-highlighting: [https://github.com/zsh-users/zsh-syntax-highlighting](https://github.com/zsh-users/zsh-syntax-highlighting)  
