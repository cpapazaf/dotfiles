
# Dotfiles for OSX and Ubuntu!

These dotfiles set OSX and Ubuntu up and ready for development!

## Install/Update

Run the command below on your terminal and go through the configuration step by step. The same command is enough for any updates!

```bash
./bootstrap.sh
```

## Features

Outstanding packages:

* iterm2
* tmux with custom config (uses back-tick as prefix instead of `C-b`)
* zsh/oh-my-zsh (with zsh-autosuggestions, zsh-syntax-highlighting, z)
* vim with custom config and prepared for coding (with syntastic, vim-flake8, nerdtree, vim-nerdtree-tabs)
* git with helpful aliases
* python

Configs:

* OSX
  * Packages
    * coreutils
    * moreutils
    * findutils
    * gnu-sed
    * wget
    * gnupg
    * binutils
    * Caskroom/cask/iterm2
    * fzf
    * git
    * git-crypt
    * git-lfs
    * tree
    * jq
    * pyenv
    * rectangle
    * google-chrome
    * chromedriver
    * visual-studio-code
    * keepassxc
  * osxdefaults
    * Please check `osx/init.sh` for the OSX system configuration. This script can also run independently. 

## Additional Configurations

- Enable Access to disk for MAC OS 10.14 and later by following this ["link"](https://osxdaily.com/2018/10/09/fix-operation-not-permitted-terminal-error-macos/)
- Spotlight. To prevent spotlight indexing your code (especially when installing dependencies) it is advised to exclude the folder you keep all the repos in. This is the reason we ask for a folder path at the setup phase. These dotfiles will not configure spotlight. Please do it manually through System Preferences->Spotlight->Privacy.

### Change git config name/email based on directories

When git is installed from this dotfiles, an additional file in placed in your home folder `~/.git_multi_user_config`

At first is empty. But you can add something like

```bash
[new_user:new_emai@x.z:/Users/user/.ssh/my_id_rsa]
/my_code_folder/special_repo_to_use_the_config_in_square_brackets_above/*
[new_user2:new_emai2@x.z]
/my_code_folder/special_repo_to_use_the_config_in_square_brackets_above/*
```

every time you `cd` into a folder with `.git` folder present, the `~/.git_multi_user_config` file will be iterated and if a path is matched, then the local git config user and email will be set to the new ones. If not, then the global config will be used instead.

Notice that an ssh key can be attached to the GIT_SSH_COMMAND env var if passed as 3rd argument.

## Develop with:

### Python

The proper way to work with python is to create a `.pyvenv | venv | .venv` with `python3 -m vevn [.pyvenv | venv | .venv]` in each project. These dotfiles handle the activation and deactivation of the python environment each time you `cd` to the project. Git is globally configured to ignore the folders.


## Troubleshooting

- if `shims/python3: line 21: /usr/local/Cellar/pyenv/1.2.20/libexec/pyenv: No such file or directory` appears then do `pyenv rehash`
- if the backtick doesn't work as prefix for tmux then open .tmux.conf, delete the "`" char and type it again.
- if tmux doesn't work when restarting iterm, then `killall tmux`
