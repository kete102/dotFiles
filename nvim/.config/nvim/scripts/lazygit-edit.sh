#!/bin/sh
# Opens a file chosen in lazygit. Usage: lazygit-edit.sh FILE [LINE]
# Plain POSIX sh so it works no matter which shell lazygit runs ($SHELL).
file=$1
line=$2

# Launched outside neovim: just edit directly.
if [ -z "$NVIM" ]; then
	if [ -n "$line" ]; then
		exec nvim "+$line" -- "$file"
	fi
	exec nvim -- "$file"
fi

# Inside neovim: quit lazygit, return to the launch pane, open the file there.
nvim --server "$NVIM" --remote-send 'q'
nvim --server "$NVIM" --remote-send '<Cmd>lua require("flavius.utils.lazygit").focus_origin()<CR>'
nvim --server "$NVIM" --remote "$file"
if [ -n "$line" ]; then
	nvim --server "$NVIM" --remote-send ":$line<CR>"
fi
