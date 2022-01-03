#!/bin/bash

# add to bashrc
echo "if [ -f /usr/share/powerline/bindings/bash/powerline.sh ]; then
  powerline-daemon -q
  POWERLINE_BASH_CONTINUATION=1
  POWERLINE_BASH_SELECT=1
  source /usr/share/powerline/bindings/bash/powerline.sh
fi" >> ~/.bashrc

source ~/.bashrc

# Add to tmux.conf
echo "run-shell 'powerline-config tmux setup'" >> ~/.tmux.conf
