# tmux-ing

tmux config with a powerline theme and focus tracking, so window marks such as Claude's `(✻)` clear once you actually look at the window.

Lives in `~/.config/tmux`; `install.sh` moves an existing `~/.tmux.conf` aside, since tmux would read that file first.

## Install

```sh
git clone https://github.com/solomonxie/tmux-ing.git ~/.config/tmux
~/.config/tmux/install.sh
```

Existing symlinks are replaced; real files at a target path are moved to `<path>.bak.<timestamp>`.

## Mini

`tmux-mini.conf` is a self-contained `~/.tmux.conf` without plugins or the theme, for servers and older tmux.

```sh
curl -fsSL https://raw.githubusercontent.com/solomonxie/tmux-ing/master/tmux-mini.conf -o ~/.tmux.conf
# or, with the repo cloned: ~/.config/tmux/install.sh mini
```
