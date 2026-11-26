if vim.loader then
	vim.loader.enable()
end

-- _G.dd = function(...)
--     require("util.debug").dump(...)
-- end
-- vim.print = _G.dd

_G.Flavius = require("flavius.utils")
require("flavius.config.options")
require("flavius.config.keymaps")
require("flavius.config.autocmds")
require("flavius.config.commands")
require("flavius.config.workarounds")
require("flavius.plugins")
