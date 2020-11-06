
Dotfiles for OSX and Ubuntu!

## Install
```
./bootstrap.sh
```

## Additional Configurations

- Enable Access to disk for MAC OS 10.14 and later by following this ["link"](https://osxdaily.com/2018/10/09/fix-operation-not-permitted-terminal-error-macos/)

### Change git config name/email based on directories

When git is installed from this dotfiles, an additional file in placed in your home folder `~/.git_multi_user_config`

At first is empty. But you can add something like

```
[new_user:new_emai@x.z]
/my_code_folder/special_repo_to_use_the_config_in_square_brackets_above/*
[new_user2:new_emai2@x.z]
/my_code_folder/special_repo_to_use_the_config_in_square_brackets_above/*
```

every time you `cd` into a folder with `.git` folder present, the `~/.git_multi_user_config` file will be iterated and if a path is matched, then the git config user and email will be set to the new ones. If not, then the global config will be used instead.

## Develop with:

### Python

The proper way to work with python is to create a `.pyvenv` with `python3 -m vevn .pyvenv` in each project. These dotfiles handle the activation and deactivation of the python environment each time you `cd` to the project.



## Troubleshooting

- if `shims/python3: line 21: /usr/local/Cellar/pyenv/1.2.20/libexec/pyenv: No such file or directory` appears then do `pyenv rehash`
- if the backtick doesn't work as prefix for tmux then open .tmux.conf, delete the "`" char and type it again.
- if tmux doesn't work when restarting iterm, then `killall tmux`

