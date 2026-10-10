# tmuxedo

tmux config with a powerline theme and focus tracking, so window marks such as Claude's `(✻)` clear once you actually look at the window.

Links the repo to `~/.config/tmux` and moves an existing `~/.tmux.conf` aside, since tmux would read that file first.

## Install

```sh
git clone https://github.com/solomonxie/tmuxedo.git ~/myconf/tmuxedo
~/myconf/tmuxedo/install.sh
```

Anything already at a target path is moved to `<path>.bak.<timestamp>`.
