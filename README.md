# Purpose

## Setup

### Zsh

#### For MacOS

To set up Zsh config on macOS, we need to install prerequisites and then set up an Automator application that sets the ZDOTDIR variable.

##### Install Prerequisites

Install Brew: [https://brew.sh/](https://brew.sh/)  
Install Antidote: `brew install antidote`

##### Set ZDOTDIR

- Open Automator on your macOS.
- Create a new document by selecting "File" > "New" from the menu bar, and choose the type of document you want to create i.e "Application". In the search bar located in the upper left corner of the Automator window, type "Run Shell Script" to find the action quickly. Drag the "Run Shell Script" action from the results on the left side of the window to the workflow area on the right side.
- In the "Run Shell Script" action that you've just added to the workflow, you'll see a text area where you can enter shell commands. Here, you should enter the command to set the ZDOTDIR environment variable. Assuming the path to your zshconfig directory is /Users/ameya.patil/code/src/github.com/patilameya92/shellconfig/zshconfig, the command would be: `launchctl setenv ZDOTDIR /Users/ameya.patil/code/src/github.com/patilameya92/shellconfig/zshconfig`
- Save the Automator Application to your Applications folder or another convenient location. You can name it something like "SetZDOTDIRApp".
- Go to System Preferences > General > Login Items.
- Click the "+" button to add a new login item, navigate to where you saved your Automator Application ("SetZDOTDIRApp"), select it, and add it to the list.

## Explanation

### Zsh Plugins

zsh-users/zsh-autosuggestions: [https://github.com/zsh-users/zsh-autosuggestions](https://github.com/zsh-users/zsh-autosuggestions)  
zsh-users/zsh-completions: [https://github.com/zsh-users/zsh-completions](https://github.com/zsh-users/zsh-completions)  
zsh-users/zsh-history-substring-search: [https://github.com/zsh-users/zsh-history-substring-search](https://github.com/zsh-users/zsh-history-substring-search)  
zsh-users/zsh-syntax-highlighting: [https://github.com/zsh-users/zsh-syntax-highlighting](https://github.com/zsh-users/zsh-syntax-highlighting)  
