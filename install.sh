#!/usr/bin/env bash
# Symlink this repo into place. Existing symlinks are replaced; real files are moved to <path>.bak.<timestamp>.
set -euo pipefail
here=$(cd "$(dirname "$0")" && pwd)

link() {  # link <path in repo, empty = repo root> <dest>
  local src=$here${1:+/$1} dest=$2
  [ "$src" -ef "$dest" ] && return
  mkdir -p "$(dirname "$dest")"
  if [ -e "$dest" ] && [ ! -L "$dest" ]; then mv "$dest" "$dest.bak.$(date +%Y%m%d%H%M%S)"; fi
  ln -sfn "$src" "$dest"
  echo "linked $dest -> $src"
}

# install.sh       the full config at ~/.config/tmux
# install.sh mini  no plugins or theme (e.g. a Linux server): ~/.tmux.conf -> tmux-mini.conf
if [ "${1:-}" = mini ]; then
  link tmux-mini.conf ~/.tmux.conf
else
  # tmux reads ~/.tmux.conf before ~/.config/tmux/tmux.conf; move it aside so ours wins.
  if [ -L ~/.tmux.conf ]; then rm ~/.tmux.conf; elif [ -e ~/.tmux.conf ]; then mv ~/.tmux.conf ~/.tmux.conf.bak.$(date +%Y%m%d%H%M%S); fi
  link "" ~/.config/tmux
fi
