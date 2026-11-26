---@type vim.lsp.Config
return {
	settings = {
		basedpyright = {
			disableOrganizeImports = true, -- Ruff handles import sorting
			analysis = {
				typeCheckingMode = "standard",
				autoImportCompletions = true,
			},
		},
	},
}
