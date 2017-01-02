#!/bin/sh

if ! [ -f /bin/tmux -o -f /usr/local/bin/tmux ]; then
    brew install \
      tmux \
      reattach-to-user-namespace
fi
