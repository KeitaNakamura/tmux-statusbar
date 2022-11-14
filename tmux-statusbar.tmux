#!/usr/bin/env bash

# background color for statusb bar
tmux set -g status-bg '#172329'

# set statusbar to the top
tmux set-option -g status-position top

# set left statusbar
tmux set-option -g status-left '#[fg=black,bg=white,bold]  #P  '

# set the left and right length of statusbar
tmux set-option -g status-left-length 90
tmux set-option -g status-right-length 90

# set refresh interval for statusbar
tmux set-option -g status-interval 1

# centralize statusbar
tmux set-option -g status-justify centre

# middle statusbar
tmux set-window-option -g window-status-format "#[fg=white] #I #W "
tmux set-window-option -g window-status-current-format "#[fg=black,bg=green,bold]  #I #W  "

CURRENT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

if sysctl hw.model | grep -e 'Book' -e 'Mac14' >/dev/null; then
  tmux set-option -g status-right "#($CURRENT_DIR/scripts/battery -t -r)   #[fg=colour11]#($CURRENT_DIR/scripts/wifi -r -s)    #[fg=black,bg=white,bold]  %a %d %h %H:%M  "
else
  tmux set-option -g status-right "#[fg=black,bg=white,bold]  %a %d %h %H:%M  "
fi
