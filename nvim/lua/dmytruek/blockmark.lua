-- create blockmarks by @kraftwerk28

local api = vim.api

local queries = {
	lua = {
		comment = "-- ",
		queries = {
			[[
				(function_declaration name: (identifier) @name) @body
			]],
			[[
				(assignment_statement
					(variable_list name: (identifier) @name)
					(expression_list value: (function_definition) @body))
			]],
		},
	},
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
			q[name .. "_cap_id"] = id
		end
		q.comment = qdef.comment
		table.insert(parsed_queries, q)
	end
end

local ns = api.nvim_create_namespace("blockmark")

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
					{ query.comment, "Comment" },
					{ name_content, "Constant" },
				},
			})
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
