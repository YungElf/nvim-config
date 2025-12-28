return {
	{
		"nvim-lualine/lualine.nvim",
		dependencies = { "catppuccin/nvim" },
		event = "VeryLazy",
		config = function()
		local palette = require("catppuccin.palettes").get_palette("mocha")

		require("lualine").setup({
			options = {
				theme = "catppuccin",
				globalstatus = true,

				-- terminal-clean look
				component_separators = "",
				section_separators = "",

				icons_enabled = true,
				disabled_filetypes = { statusline = { "alpha", "dashboard" } },
			},

			sections = {
				lualine_a = {
					{
						"mode",
						fmt = function(s) return " " .. s .. " " end,
					},
				},

				lualine_b = {
					{ "branch", icon = "" },
				},

				lualine_c = {
					{
						"filename",
						path = 1, -- relative path
					},
				},

				lualine_x = {
					{
						"diagnostics",
						symbols = {
							error = "E ",
						   warn  = "W ",
						   info  = "I ",
						   hint  = "H ",
						},
					},
				},

				lualine_y = {
					"progress",
				},

				lualine_z = {
					"location",
				},
			},

			inactive_sections = {
				lualine_a = {},
				lualine_b = {},
				lualine_c = {
					{ "filename", path = 1 },
				},
				lualine_x = { "location" },
				lualine_y = {},
				lualine_z = {},
			},
		})

		------------------------------------------------------------------
		-- Retro hacker overrides (matches catppuccin.lua)
		------------------------------------------------------------------
		local base    = "#0e1113"
		local mantle = "#111518"
		local crust  = "#0b0d0f"

		local function hl(group, opts)
		vim.api.nvim_set_hl(0, group, opts)
		end

		-- Active mode block = green terminal glow
		hl("lualine_a_normal",  { fg = base, bg = palette.green, bold = true })
		hl("lualine_a_insert",  { fg = base, bg = palette.green, bold = true })
		hl("lualine_a_visual",  { fg = base, bg = palette.green, bold = true })
		hl("lualine_a_replace", { fg = base, bg = palette.green, bold = true })
		hl("lualine_a_command", { fg = base, bg = palette.green, bold = true })

		-- Rest of bar: dark, terminal-like
		hl("lualine_b_normal", { fg = palette.text, bg = mantle })
		hl("lualine_c_normal", { fg = palette.subtext1, bg = mantle })
		hl("lualine_x_normal", { fg = palette.subtext1, bg = mantle })
		hl("lualine_y_normal", { fg = palette.subtext1, bg = mantle })
		hl("lualine_z_normal", { fg = palette.subtext1, bg = mantle })

		-- Inactive windows: dim and unobtrusive
		hl("lualine_a_inactive", { fg = palette.overlay0, bg = crust })
		hl("lualine_b_inactive", { fg = palette.overlay0, bg = crust })
		hl("lualine_c_inactive", { fg = palette.overlay0, bg = crust })

		-- Re-apply after colorscheme reloads
		vim.api.nvim_create_autocmd("ColorScheme", {
			pattern = "*",
			callback = function()
			hl("lualine_a_normal", { fg = base, bg = palette.green, bold = true })
			end,
		})
		end,
	},
}
