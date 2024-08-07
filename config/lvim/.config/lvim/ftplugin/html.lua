lvim.lang.html.formatters = {
	{
		exe = "prettier",
		args = { "--stdin-filepath" },
	},
}

local lspconfig = require("lspconfig")
local configs = require("lspconfig/configs")

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true

if not lspconfig.emmet_ls then
	configs.emmet_ls = {
		default_config = {
			cmd = { "emmet-ls", "--stdio" },
			filetypes = { "html", "css" },
			root_dir = function(fname)
				return vim.loop.cwd()
			end,
			settings = {},
		},
	}
end
lspconfig.emmet_ls.setup({ capabilities = capabilities })
