-- GRUVBOX

require('gruvbox').setup {
	overrides = {
		Operator = { link = 'GruvboxOrange' }, -- undo italic
		-- change diagnostic colors:
		DiagnosticHint = { link = 'GruvboxYellow' },
		DiagnosticSignHint = { link = 'GruvboxYellowSign' },
		DiagnosticUnderlineHint = { link = 'GruvboxYellowUnderline' },
		DiagnosticFloatingHint = { link = 'GruvboxYellow' },
		DiagnosticVirtualTextHint = { link = 'GruvboxYellow' },
		-- rust btw
		--['@lsp.type.comment.rust'] = { link = 'GruvboxYellow' },
		['@lsp.type.struct.rust'] = { link = 'GruvboxYellow' },
		-- TODO: special color for traits (interfaces).
		--['@lsp.type.interface.rust'] = { link = 'GruvboxOrange' },
		['@lsp.typemod.comment.documentation.rust'] = { link = 'GruvboxOrange' },
	}
}

