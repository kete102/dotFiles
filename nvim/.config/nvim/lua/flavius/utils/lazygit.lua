local M = {}

--- Window from which lazygit was launched. Files opened from inside lazygit
--- (`e`) are edited here, so they reuse the focused pane instead of landing in
--- a new tab or the first window. Paired with the `os.edit` override in
--- flavius/plugins/ui.lua.
local origin_win = nil

--- Opens lazygit, remembering the currently focused window as the target for
--- files opened from within it.
function M.open()
	origin_win = vim.api.nvim_get_current_win()
	Snacks.lazygit()
end

--- Focuses the window lazygit was launched from so the following
--- `nvim --remote <file>` edits there. Called from the `os.edit` command built
--- below. No-op when the origin window is gone (e.g. closed while lazygit was
--- open), letting `--remote` fall back to the current window.
function M.focus_origin()
	if origin_win and vim.api.nvim_win_is_valid(origin_win) then
		pcall(vim.api.nvim_set_current_win, origin_win)
	end
end

local script = vim.fn.stdpath("config") .. "/scripts/lazygit-edit.sh"

--- Builds a lazygit `os.edit` / `os.editAtLine` command that opens the selected
--- file in the pane lazygit was launched from rather than a new tab. Delegates
--- to a POSIX sh script, because lazygit runs the command through `$SHELL`
--- (zsh, bash, fish...) and shell-specific syntax would break on other setups.
--- lazygit fills in `{{filename}}` (shell-quoted) and `{{line}}`.
--- @param opts? { at_line?: boolean } also jump to `{{line}}` after opening
--- @return string
function M.edit_command(opts)
	local at_line = opts and opts.at_line
	return ("sh %s {{filename}}%s"):format(vim.fn.shellescape(script), at_line and " {{line}}" or "")
end

return M
