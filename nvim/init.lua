----- dmyTRUEk's NeoVim config file -----


function print_table(table)
	print(vim.inspect(table))
end


vim_globals = {
	python3_host_prog = '/usr/bin/python3',

	-- Set `mapleader` before `lazy` so that mappings are correct.
	mapleader = ' ',
}

for name, value in pairs(vim_globals) do
	-- TODO?: wrap in "try/catch"
	vim.g[name] = value
end


options_enable = {
	'number', 'relativenumber', -- line number + relative
	'cursorline', -- highlight cursor line
	--'termguicolors', -- ?
	--'showmatch', -- shows matching brackets
	'autochdir', -- change current dir to file's dir (folder directory)
	--'showcmd', -- ? show last command (if you pressed 'j' then 'j' will be showed)

	--'incsearch',
	--'hlsearch',
	'ignorecase', -- /word will find 'word' or 'Word' or 'WORD'
	'smartcase', -- when 'ignorecase' & 'smartcase' are both on, if a pattern contains an uppercase letter, it is case sensitive, otherwise, it is not; for example, '/The' would find only 'The', while '/the' would find both 'the' & 'The'

	'linebreak', -- wrap on words (wrap on chars in `breakat`)

	--'langremap', -- ?
}
-- TODO: move all "executers" (options etc setters) to the bottom/other file?
for _, name in pairs(options_enable) do
	-- TODO: wrap in "try/catch"
	vim.opt[name] = true
end



options = {
	--syntax = 'enable', -- ?
	clipboard = 'unnamedplus', -- use OS's clipboard
	encoding = 'utf-8',
	filetype = 'on',

	-- TODO: remove?
	laststatus = 2, -- when/how to display status-bar: 0=never, 1={if > than 2 windows}, 2=always
	virtualedit = 'block',
	scrolloff = 10, -- TODO: use relative

	tabstop = 4, -- size of tab used for "rendering"
	shiftwidth = 4, -- size of tab used for << >> etc

	--timeoutlen = 1000,
	--ttimeoutlen = 0,

	redrawtime = 10000, -- for giant files

	--cmdheight = 0, -- TODO: enable

	-- use ukr in normal mode
	--langmap = [[ʼ~,аf,б\,,вd,гu,дl,еt,є',ж\;,зp,иb,іs,ї],йq,кr,лk,мv,нy,оj,пg,рh,сc,тn,уe,фa,х[,цw,чx,шi,щo,ьm,ю.,яz,АF,Б<,ВD,ГU,ДL,ЕT,Є",Ж:,ЗP,ИB,ІS,Ї},ЙQ,КR,ЛK,МV,НY,ОJ,ПG,РH,СC,ТN,УE,ФA,Х{,ЦW,ЧX,ШI,ЩO,ЬM,Ю>,ЯZ]],
	langmap = [[йq,цw,уe,кr,еt,нy,гu,шi,щo,зp,х[,ї],фa,іs,вd,аf,пg,рh,оj,лk,дl,ж\;,є',яz,чx,сc,мv,иb,тn,ьm,б\,,ю.,ЙQ,ЦW,УE,КR,ЕT,НY,ГU,ШI,ЩO,ЗP,Х{,Ї},ФA,ІS,ВD,АF,ПG,РH,ОJ,ЛK,ДL,Ж:,Є",ЯZ,ЧX,СC,МV,ИB,ТN,ЬM,Б<,Ю>]],
}
for name, value in pairs(options) do
	-- TODO: wrap in "try/catch"
	vim.opt[name] = value
end


-- TODO(refactor): append to vim globals?
vim.g.relative_scrolloff_percentage = 30
function set_relative_scrolloff(fraction)
	-- TODO
end



-- TODO: test if `x` or `v` is needed
keybinds_swap_nv = {
	['0'] = '^',
	["'"] = '`',
} -- end of `keybinds_swap_nv`

keybinds_nv = {
	['-'] = '$', -- better $
}

keybinds_n = {
	Q = '', -- unmap ex mode
	U = '<c-r>', -- better redo
	Y = 'y$', -- better copy till end of line

	['<c-j>'] = '<c-d>zz', -- better move half-page down
	['<c-k>'] = '<c-u>zz', -- better move half-page up

	['<c-p>'] = '$p', -- paste at end of line
	['<a-p>'] = '^P', -- paste at begin of line

	-- "fix" `h` & `l` motions:
	ch = 'lc2h',
	cl = 'c2l',
	dh = 'ld2h',
	dl = 'd2l',
	yh = 'ly2h',
	yl = 'y2l',

	-- `f` & `t` from end of line
	gf = '$F',
	gt = '$T',

	-- work with function names:
	cn = 'ct(',
	dn = 'dt(',
	yn = 'yt(',
	cu = 'ct_',
	du = 'df_',
	yu = 'yt_',

	['c;'] = 'ct;',
	['d;'] = 'dt;',
	['y;'] = 'yt;',

	--['<leader>e'] = 'm`$x``',
	--<leader>; m`A;<esc>``
	--<leader>: m`A:<esc>``
	--<leader>, m`A,<esc>``
	--<leader>. m`A.<esc>``

	-- TODO: make one more plugin?)
	-- my Change Current word with another (aka `viwy`):

	-- `cc` is duplication of `S`, so we can use it for our purposes, so firstly we clearing it
	cc = '',

	-- map `cc<move>` to Change Current word with MOVE word
	-- this solution is better than `df<space>f<space>p` because it might not work if
	-- there is no space after second word (eg `,` `)` `\n` etc)

	-- TODO?: figure out better way to do this, so it works at least for `f<symbol>` or even any move

	-- TODO: fix it for ukr

	-- here `|` means cursor position
	-- a|aa bbb -> bbb| aaa
	ccw = 'yiwwviwp2bviwp',
	-- aaa.a|aa bbb.bbb -> bbb.bbb| aaa.aaa
	ccW = 'yiWWviWp2BviWp',

	-- aaa b|bb -> bbb aaa|
	ccb = 'yiwbviwpwviwp',
	-- aaa.aaa bbb.b|bb -> bbb.bbb aaa.aaa|
	ccB = 'yiWBviWpWviWp',

	cc2w = 'yiw2wviwp3bviwp',
	cc2W = 'yiW2WviWp3BviWp',
	cc2b = 'yiw2bviwp2wviwp',
	cc2B = 'yiW2BviWp2WviWp',

	cc3w = 'yiw3wviwp4bviwp',
	cc3b = 'yiw3bviwp3wviwp',
	cc3W = 'yiW3WviWp4BviWp',
	cc3B = 'yiW3BviWp3WviWp',
} -- end of `keybinds_n`

keybinds_i = {
	['<c-;>'] = '',
	['<c-h>'] = '<left>',
	['<c-j>'] = '<down>',
	['<c-k>'] = '<up>',
	['<c-l>'] = '<right>',
} -- end of `keybinds_i`

keybinds_n_c = {
	['<leader>o'] = 'nohlsearch',

	['<leader>q'] = 'q',
	['<leader>Q'] = 'qa',
	['<leader>w'] = 'w',
	['<leader>W'] = 'wa',
	['<leader>a'] = 'wq',
	['<leader>A'] = 'wqa',

	['<leader>h'] = 'wincmd h',
	['<leader>j'] = 'wincmd j',
	['<leader>k'] = 'wincmd k',
	['<leader>l'] = 'wincmd l',

	['<leader><leader>h'] = 'wincmd H',
	['<leader><leader>j'] = 'wincmd J',
	['<leader><leader>k'] = 'wincmd K',
	['<leader><leader>l'] = 'wincmd L',

	['<leader>S'] = 'setlocal spell!',

	--<leader>v :call ToggleHorizontalVerticalSplit() <cr>
} -- end of `keybinds_n_c`

-- TODO: test if `x` or `v` is needed
keybinds_v = {
	S = ':sort<cr>',
} -- end of `keybinds_v`




autocmds = {
	{'FileType', {
		pattern = {'gitcommit', 'markdown', '*.tex'},
		command = 'setlocal spell',
	}},
	{{'BufEnter', 'BufLeave', 'BufWinEnter', 'BufWinLeave', 'WinNew', 'WinEnter', 'WinLeave', 'VimResized'}, {
		callback = function()
			--TODO:
			--set_relative_scrolloff()
		end,
	}},
}
for _, autocmd in pairs(autocmds) do
	local events, opts = unpack(autocmd)
	--local events = autocmd[1]
	--local opts = autocmd[2]
	--print_table(events)
	--print_table(opts)
	vim.api.nvim_create_autocmd(events, opts)
end




-- Load `lazy.nvim`:
local lazypath = vim.fn.stdpath('data') .. '/lazy/lazy.nvim'
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system {
		'git',
		'clone',
		'--filter=blob:none',
		'https://github.com/folke/lazy.nvim.git',
		'--branch=stable', -- latest stable release
		lazypath,
	}
end
vim.opt.rtp:prepend(lazypath)

-- PLUGINS:
require('lazy').setup {
	-- Colorschemes:
	--'ErichDonGubler/vim-sublime-monokai',
	--'nlknguyen/papercolor-theme',
	--'kjssad/quantum.vim',
	{'ellisonleao/gruvbox.nvim',
		init = function ()
			require 'dmytruek.colorschemes.gruvbox'
		end
	},
	'rebelot/kanagawa.nvim',
	'catppuccin/nvim',
	--'projekt0n/github-nvim-theme',
	--'navarasu/onedark.nvim',
	'folke/tokyonight.nvim',

	-- Core:
	{'windwp/nvim-autopairs', opts = { -- close brackets automatically
		-- TODO
	}},
	'tpope/vim-surround', -- surround manager
	'tommcdo/vim-exchange', -- exchange selections
	'tpope/vim-repeat', -- enable repeat for plugins
	{'unblevable/quick-scope', -- better find in line
		init = function()
			-- TODO(refactor): append to vim globals?
			vim.g.qs_highlight_on_keys = {'f', 'F', 't', 'T'}
		end
	},

	-- General:
	'tpope/vim-commentary', -- comments manager
	{'L3MON4D3/LuaSnip', -- snippets
		version = 'v2.*',
		opts = {
			-- TODO
		},
	},
	--'dmytruek/find-and-replace', -- find and replace

	-- UI:
	-- LUALINE:
	{'nvim-lualine/lualine.nvim', opts = { -- status line
		options = {
			theme = 'powerline_dark', -- gruvbox, kanagawa
			component_separators = { left = '', right = ''},
			section_separators   = { left = '', right = ''},
			always_divide_middle = false,
		},
		sections = {
			lualine_a = { 'mode' },
			lualine_b = { 'filename' },
			lualine_c = { 'branch', 'diff' },
			lualine_x = {
				{'encoding',
					fmt = function(str) if str == 'utf-8' then return '' else return str end end,
				},
				{'fileformat',
					symbols = {
						unix = '',  -- e712 - 
						dos  = '', -- e70f
						mac  = '', -- e711
					},
				},
				--'filetype',
			},
			lualine_y = {
				{'diagnostics',
					--sources = { 'nvim_diagnostic' },
					sections = { 'error', 'warn', 'info', 'hint' },
					diagnostics_color = {
						error = 'DiagnosticError',
						warn  = 'DiagnosticWarn',
						info  = 'DiagnosticInfo',
						hint  = 'DiagnosticHint',
					},
					symbols = {
						error = '󰅚 ', -- 󰅙
						warn  = ' ', -- 
						info  = ' ', -- 
						hint  = ' ', --  
					},
					update_in_insert = true,
					always_visible = false,   -- Show diagnostics even if there are none.
					colored = true,
				},
				{'selectioncount',
					format = {
						single_line_no_multibyte = '%c',
						single_line_multibyte = '%c-%b',
						multi_line_no_multibyte = '%c / %l',
						multi_line_multibyte = '%c-%b / %l',
						visual_block_mode = '%cx%l',
					},
				},
				{'searchcount',
					maxcount = 99999,
				},
			},
			lualine_z = {
				function()
					local line = vim.fn.line('.')
					local lines_total = vim.fn.line('$')
					local col = vim.fn.virtcol('.') -- TODO: change to normal col: to correctly count tabs?
					return string.format('Line: %d/%d, Col: %d', line, lines_total, col)
				end
			},
		},
	}},
	--'preservim/nerdtree', -- file manager
	--'Xuyuanp/scrollbar.nvim', -- scrollbar

	-- TREESITTER:
	{'nvim-treesitter/nvim-treesitter',
		build = ':TSUpdate',
		dependencies = {
			'nvim-treesitter/nvim-treesitter-textobjects',
			'nvim-treesitter/playground',
		},
		init = function()
			require('nvim-treesitter.configs').setup {
				ensure_installed = {
					'c', 'lua', 'vim', 'vimdoc', 'query', -- these are reqired
					--'cpp',
					--'kotlin',
					'latex',
					'python',
					'rust',
					--'yaml',
					--'yuck',
				},
				highlight = {
					enable = true,
					disable = function(lang, bufnr)
						--return vim.api.nvim_buf_line_count(bufnr) > 99999
						return vim.fn.getfsize(vim.api.nvim_buf_get_name(bufnr)) > 999999
					end,
				},
				--indent = { enable = false, disable = { 'python', 'css' } },
				incremental_selection = {
					enable = true,
					keymaps = {
						init_selection = '<c-space>',
						node_incremental = '<c-space>',
						scope_incremental = '<c-s>',
						node_decremental = '<c-backspace>',
					},
				},
				textobjects = { -- `nvim-treesitter-textobjects` required for this
					select = {
						enable = true,
						lookahead = true, -- Automatically jump forward to textobj, similar to targets.vim
						keymaps = {
							['aa'] = '@assignment.outer',
							['ia'] = '@assignment.rhs',
							-- You can use the capture groups defined in textobjects.scm
							--['ab'] = '@block.outer',
							--['ib'] = '@block.inner',
							['ac'] = '@class.outer',
							['ic'] = '@class.inner',
							['af'] = '@function.outer',
							['if'] = '@function.inner',
							['ap'] = '@parameter.outer',
							['ip'] = '@parameter.inner',
							['ar'] = '@return.outer',
							['ir'] = '@return.inner',
							['as'] = '@assignment.outer',
							['is'] = '@assignment.rhs',
						},
					},
					move = {
						enable = true,
						set_jumps = true, -- set jumps in jumplist
						goto_next_start = {
							[']]'] = '@block.inner',
							[']a'] = '@assignment.rhs',
							[']b'] = '@block.inner',
							[']c'] = '@class.outer',
							[']f'] = '@function.outer',
							[']m'] = '@scopename.inner',
							[']p'] = '@parameter.inner',
							[']r'] = '@return.inner',
							[']s'] = '@assignment.rhs', -- TODO: resolve conflict/overlap with next spelling
						},
						goto_previous_start = {
							['[['] = '@block.inner',
							['[a'] = '@assignment.rhs',
							['[b'] = '@block.inner',
							['[c'] = '@class.outer',
							['[f'] = '@function.outer',
							['[m'] = '@scopename.inner',
							['[p'] = '@parameter.inner',
							['[r'] = '@return.inner',
							['[s'] = '@assignment.rhs', -- TODO: resolve conflict/overlap with next spelling
						},
						goto_next_end = {
							[']A'] = '@assignment.rhs',
							[']B'] = '@block.inner',
							[']C'] = '@class.outer',
							[']F'] = '@function.outer',
							[']M'] = '@scopename.inner',
							[']P'] = '@parameter.inner',
							[']R'] = '@return.inner',
							[']S'] = '@assignment.rhs',
							[']['] = '@block.inner',
						},
						goto_previous_end = {
							['[A'] = '@assignment.rhs',
							['[B'] = '@block.inner',
							['[C'] = '@class.outer',
							['[F'] = '@function.outer',
							['[M'] = '@scopename.inner',
							['[P'] = '@parameter.inner',
							['[R'] = '@return.inner',
							['[S'] = '@assignment.rhs',
							['[]'] = '@block.inner',
						},
					},
					swap = {
						enable = true,
						swap_next = {
							['>p'] = '@parameter.inner',
						},
						swap_previous = {
							['<p'] = '@parameter.inner',
						},
					},
				},
				playground = {
					enable = true,
					disable = {},
					updatetime = 25, -- Debounced time for highlighting nodes in the playground from source code
					persist_queries = false, -- Whether the query persists across vim sessions
					keybindings = {
						toggle_query_editor = 'o',
						toggle_hl_groups = 'i',
						toggle_injected_languages = 't',
						toggle_anonymous_nodes = 'a',
						toggle_language_display = 'I',
						focus_language = 'f',
						unfocus_language = 'F',
						update = 'R',
						goto_node = '<cr>',
						show_help = '?',
					},
				},
			}
		end,
	},

	-- TELESCOPE:
	{'nvim-telescope/telescope.nvim',
		dependencies = {
			'nvim-lua/plenary.nvim',
			'nvim-telescope/telescope-fzf-native.nvim',
		},
		init = function()
			local keybinds_n_c_telescope = {
				['<leader>b'] = 'buffers',
				['<leader>f'] = 'find_files',
				['<leader>g'] = 'live_grep',
				['<leader>p'] = 'colorscheme',
				['<leader>s'] = 'spell_suggest',
				['<leader>u'] = 'jumplist',
				--gd = 'lsp_definitions',
				--gD = 'lsp_type_definitions',
				gi = 'lsp_implementations',
				gr = 'lsp_references',
			}
			for keybind, telescope_command in pairs(keybinds_n_c_telescope) do
				-- TODO: wrap in "try/catch"
				keybinds_n_c[keybind] = 'Telescope ' .. telescope_command
			end

			local actions = require('telescope.actions')
			require('telescope').setup {
				defaults = {
					mappings = {
						i = {
							['<esc>'] = actions.close,
						},
					},
				},
			}
		end,
	},

	-- LSP:
	{'neovim/nvim-lspconfig',
		dependencies = {
			'hrsh7th/nvim-cmp',
			'hrsh7th/cmp-nvim-lsp',
			'hrsh7th/cmp-buffer',
			'hrsh7th/cmp-path',
			'hrsh7th/cmp-cmdline',
			'saadparwaiz1/cmp_luasnip', -- for lua-snips
			--'hrsh7th/cmp-nvim-lua', -- #e1a547
		},
		-- opts = {
		-- 	inlay_hint = { enabled = true },
		-- },
		init = function()
			local lsp_server_names = {
				'rust_analyzer', -- TODO: enable `clippy`
				'pyright',
				'lua_ls',
				'clangd',
			}
			local capabilities = require('cmp_nvim_lsp').default_capabilities(vim.lsp.protocol.make_client_capabilities())
			for _, lsp_server_name in pairs(lsp_server_names) do
				-- print('LSP: setting up', lsp_server_name)
				require('lspconfig')[lsp_server_name].setup {
					capabilities = capabilities,
					on_attach = function (client, bufnr)
						-- TODO: try when nvim 0.10
						-- print('Inlay hints: trying to attach')
						if client.server_capabilities.inlayHintProvider then
							--inlay_hints.on_attach(client, bufnr)
							vim.lsp.inlay_hint.enable(bufnr, true)
							-- print('Inlay hints attached')
						else
							-- print('Inlay hints NOT attached')
						end
						-- print('Inlay hints: end')
					end
				}
			end

			keybinds_n['gd'] = vim.lsp.buf.definition
			keybinds_n['gD'] = vim.lsp.buf.declaration
			--keybinds_n['gi'] = vim.lsp.buf.implementations
			--keybinds_n['gr'] = vim.lsp.buf.references
			keybinds_n['<leader>r'] = vim.lsp.buf.rename
			keybinds_n['<leader>d'] = vim.diagnostic.open_float

			keybinds_n['g['] = vim.diagnostic.goto_prev
			--keybinds_n['<c-]>'] = vim.diagnostic.goto_prev
			keybinds_n['g]'] = vim.diagnostic.goto_next
			keybinds_n['<c-]>'] = vim.diagnostic.goto_next

			keybinds_n['ga'] = vim.lsp.buf.code_action
			keybinds_n['K'] = vim.lsp.buf.hover

			-- TODO:
			-- vim.lsp.buf.type_definition
			-- vim.lsp.buf.rename
			-- ? function() vim.lsp.buf.format { async = true } end

			-- enable this to print debug info to ~/.cache/nvim/lsp.log
			--vim.lsp.set_log_level('debug')

			local cmp = require('cmp')
			cmp.setup {
				snippet = {
					-- REQUIRED - you MUST specify a snippet engine
					expand = function(args)
						--vim.fn['UltiSnips#Anon'](args.body)         -- for `ultisnips` users
						--vim.fn['vsnip#anonymous'](args.body)        -- for `vsnip` users
						--require('snippy').expand_snippet(args.body)   -- for `snippy` users
						require('luasnip').lsp_expand(args.body)        -- for `luasnip` users
					end,
				},
				window = {
					--completion = cmp.config.window.bordered(),
					--documentation = cmp.config.window.bordered(),
				},
				indent = { -- indentation based on treesitter for the `=` operator.
					enable = true,
				},
				-- experimental = {
				-- 	ghost_text = true,
				-- },
				sources = {
					{ name = 'nvim_lsp' },
					--{ name = 'nvim_lsp_signature_help' }, -- TODO: try it (from https://github.com/hrsh7th/nvim-cmp/wiki/Language-Server-Specific-Samples)
					-- TODO: dont ignore `\` & `'` in latex
					{ name = 'buffer', option = { keyword_pattern = [[\Z\k\+]] }},
					-- \Z\k\+
					-- м'ясо пом'якшити
					-- telescope
					-- test test test tmp123
					{ name = 'path' },
					--{ name = 'ultisnips' }, -- for ultisnips users
					--{ name = 'vsnip' },     -- for vsnip users
					--{ name = 'snippy' },    -- for snippy users
					{ name = 'luasnip' },     -- for luasnip users
					--{ name = 'nvim_lua', option = { include_deprecated = true } }, -- #e1a547
				},
				mapping = {
					['<cr>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
					['<tab>'] = function(fallback)
						if cmp.visible() then
							cmp.select_next_item()
						else
							fallback()
						end
					end,
					['<s-tab>'] = function(fallback)
						if cmp.visible() then
							cmp.select_prev_item()
						else
							fallback()
						end
					end,
					['<A-space>'] = cmp.mapping.complete(),
					['<C-space>'] = cmp.mapping.complete(),
					--['<C-d>'] = cmp.mapping(cmp.mapping.scroll_docs(-4), { 'i', 'c' }),
					--['<C-f>'] = cmp.mapping(cmp.mapping.scroll_docs(4), { 'i', 'c' }),
					--['<C-y>'] = cmp.config.disable, -- specify `cmp.config.disable` if you want to remove default `<C-y>` mapping
					--['<C-e>'] = cmp.mapping.abort(),
				},
			}

			-- Set configuration for specific filetype.
			cmp.setup.filetype('gitcommit', {
				sources = cmp.config.sources({
					{ name = 'git' }, -- You can specify the `git` source if [you were installed it](https://github.com/petertriho/cmp-git).
				}, {
					{ name = 'buffer' },
				}),
			})

			-- Use buffer source for `/` & `?` (if you enabled `native_menu`, this won't work anymore).
			cmp.setup.cmdline({ '/', '?' }, {
				mapping = cmp.mapping.preset.cmdline(),
				sources = {
					{ name = 'buffer' },
				},
			})

			-- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
			cmp.setup.cmdline(':', {
				mapping = cmp.mapping.preset.cmdline(),
				sources = cmp.config.sources({
					{ name = 'path' },
				}, {
					{ name = 'cmdline' },
				}),
			})
		end
	}

	-- {'nvim-tree/nvim-web-devicons', -- ?
	-- 	lazy = true,
	-- },
}





-- TODO(refactor): move to `colorschemes`?
vim.cmd.colorscheme('gruvbox')





-- TODO(refactor): unite/simplify?
keybind_set_n = function(keybind, action) vim.keymap.set('n', keybind, action) end
keybind_set_n_c = function(keybind, action) vim.keymap.set('n', keybind, ':' .. action .. '<cr>') end
keybind_set_i = function(keybind, action) vim.keymap.set('i', keybind, action) end
keybind_set_v = function(keybind, action) vim.keymap.set('v', keybind, action) end

keybind_swap_n = function(kb1, kb2) keybind_set_n(kb1, kb2); keybind_set_n(kb2, kb1) end
keybind_swap_v = function(kb1, kb2) keybind_set_v(kb1, kb2); keybind_set_v(kb2, kb1) end
keybind_swap_nv = function(kb1, kb2) keybind_swap_n(kb1, kb2); keybind_swap_v(kb1, kb2) end

-- TODO: test if `x` or `v` is needed
for kb1, kb2 in pairs(keybinds_swap_nv) do
	-- TODO: wrap in "try/catch"
	keybind_swap_nv(kb1, kb2)
end

for keybind, action in pairs(keybinds_nv) do
	-- TODO: wrap in "try/catch"
	vim.keymap.set('n', keybind, action)
	vim.keymap.set('v', keybind, action)
end

for keybind, action in pairs(keybinds_n) do
	-- TODO: wrap in "try/catch"
	vim.keymap.set('n', keybind, action)
end

for keybind, action in pairs(keybinds_i) do
	-- TODO: wrap in "try/catch"
	vim.keymap.set('i', keybind, action)
end

for keybind, command in pairs(keybinds_n_c) do
	-- TODO: wrap in "try/catch"
	--vim.keymap.set('n', keybind, ':' .. command .. '<cr>')
	vim.keymap.set('n', keybind, '<cmd>' .. command .. '<cr>')
end

for keybind, action in pairs(keybinds_v) do
	-- TODO: wrap in "try/catch"
	vim.keymap.set('v', keybind, action)
end

-- TODO: automatically support ukr layout





-- require 'dmytruek.blockmark'
local api = vim.api

local queries = {
	lua = {
		comment = '-- ',
		queries = {
			[[
				(function_declaration
					name: (identifier) @name
				) @body
			]],
			[[
				(assignment_statement
					(variable_list name: (_) @name)
					(expression_list value: (_) @body)
				)
			]],
			[[
				(for_statement
					clause: (for_generic_clause) @name
				) @body
			]],
			[[
				(field
					name: (identifier) @name
				) @body
			]],
			-- [[
			-- 	(field
					
			-- 	)
			-- ]]
		},
	},
	-- rust = {
	-- 	comment = '// ',
	-- 	queries = {
	-- 		[[
	--			
	-- 		]],
	-- 	},
	-- },
	-- cpp = {
	-- 	comment = "// ",
	-- 	queries = {
	-- 		[[
	-- 			(namespace_definition
	-- 				name: (_) @name
	-- 				body: (_) @body)
	-- 		]],
	-- 	},
	-- },
}

local parsed_queries = {}
for lang, qdef in pairs(queries) do
	for _, query_code in ipairs(qdef.queries) do
		local q = vim.treesitter.query.parse(lang, query_code)
		for id, name in pairs(q.captures) do
			q[name .. '_cap_id'] = id
		end
		q.comment = qdef.comment
		table.insert(parsed_queries, q)
	end
end

local ns = api.nvim_create_namespace('blockmark')

local function update_extmarks(bufnr)
	api.nvim_buf_clear_namespace(bufnr, ns, 0, -1)
	-- local lang = vim.treesitter.language.get_lang(vim.bo[bufnr].filetype)
	-- vim.print({ lang = lang })
	local node = vim.treesitter.get_node()
	if not node then
		return
	end
	local tree = node:tree()

	for _, query in ipairs(parsed_queries) do
		for pattern, match, metadata in query:iter_matches(tree:root(), bufnr) do
			local body_node = match[query.body_cap_id]
			local body_srow, body_scol = body_node:start()
			local body_erow, body_ecol = body_node:end_()
			if body_erow - body_srow >= 1 then
				local name_node = match[query.name_cap_id]
				local name_srow, name_scol = name_node:start()
				local name_erow, name_ecol = name_node:end_()
				local name_content = api.nvim_buf_get_text(
					bufnr,
					name_srow, name_scol,
					name_erow, name_ecol,
					{}
				)[1]
				local erow, ecol = match[query.body_cap_id]:end_()
				api.nvim_buf_set_extmark(bufnr, ns, erow, ecol, {
					virt_text = {
						{ query.comment .. 'end of ', 'Comment' },
						{ name_content, 'Constant' },
					},
				})
			end
		end
	end
end

vim.api.nvim_create_autocmd({
	"BufEnter",
	"BufWinEnter",
	"TextChanged",
	"TextChangedI",
}, {
	pattern = { "*.lua", "*.cpp" },
	callback = function(ev)
		local bufnr = ev.buf
		vim.schedule(function()
			update_extmarks(bufnr)
		end)
	end,
})

