-- Petrol Noir
-- is it 3am already?

local M = {}

-- -----------------------------------------------------------------------------
-- Palette
-- -----------------------------------------------------------------------------
local c = {
	-- Core surfaces (bg="NONE" for terminal transparency)
	bg = "NONE",
	bg0 = "#0b0d10",
	bg1 = "#10141a",
	bg2 = "#141a21",
	bg3 = "#1a212b",
	bg4 = "#202836",
	border = "#2a3340",
	divider = "#1d2430",

	-- Text
	fg = "#c9d1d9",
	fg_dim = "#aeb6bf",
	fg_subtle = "#919aa6",
	fg_faint = "#6f7885",

	-- Core accents (controlled saturation)
	blood = "#b24b4b",
	blood_dim = "#8d3a3a",
	copper = "#c07a5a",
	copper_dim = "#9b644d",

	-- “Good/add” states
	gold = "#b7aa93",
	ash_gold = "#8b7758",

	-- Syntax separation
	steel = "#9aa7b5",
	sky = "#7f9fbf",
	slate = "#8592a3",

	-- Oil Indigo family
	oil = "#4b5e82",
	oil_dim = "#3a4a68",
	chrome = "#8ea0ad",

	-- Strings
	rose = "#9a5a5a",
	rose_dim = "#7f4747",

	-- Emphasis
	ember = "#a77a4f",
	sand = "#b7aa93",

	-- UI states
	cursor = "#d6d9de",
	selection = "#1a2430",
	cursorline = "#0f141b",
	gutter = "#2a313c",
	gutter_dim = "#222935",

	-- Diff
	diff_add_bg = "#141510",
	diff_change_bg = "#111a22",
	diff_delete_bg = "#1a1012",
	diff_text_bg = "#172235",

	-- Diagnostics
	err = "#d16969",
	warn = "#d6b06b",
	info = "#8fb3d9",
	hint = "#76b5aa",

	-- Git
	git_add = "#b8a46a",
	git_change = "#c7a06a",
	git_delete = "#d16969",

	-- Inline hint / subtle UI
	inlay = "#556070",
}

-- -----------------------------------------------------------------------------
-- Helpers
-- -----------------------------------------------------------------------------
local function hi(group, opts)
	vim.api.nvim_set_hl(0, group, opts)
end

local function link(group, target)
	hi(group, { link = target })
end

local function clear()
	vim.cmd("highlight clear")
	if vim.fn.exists("syntax_on") == 1 then
		vim.cmd("syntax reset")
	end
	vim.o.termguicolors = true
	vim.o.background = "dark"
	vim.g.colors_name = "petrolnoir"
end

-- -----------------------------------------------------------------------------
-- Apply highlights
-- -----------------------------------------------------------------------------
local function apply_highlights()
	-- ===========================================================================
	-- Core editor UI
	-- ===========================================================================
	hi("Normal", { fg = c.fg, bg = c.bg })
	hi("NormalNC", { fg = c.fg_dim, bg = c.bg })
	hi("EndOfBuffer", { fg = c.bg0, bg = c.bg })
	hi("Whitespace", { fg = c.divider })
	hi("NonText", { fg = c.divider })
	hi("SpecialKey", { fg = c.divider })

	hi("Cursor", { fg = c.bg0, bg = c.cursor })
	hi("lCursor", { fg = c.bg0, bg = c.cursor })
	hi("CursorIM", { fg = c.bg0, bg = c.cursor })

	hi("CursorLine", { bg = c.cursorline })
	hi("CursorLineSign", { bg = c.cursorline })
	hi("CursorLineFold", { bg = c.cursorline })
	hi("CursorColumn", { bg = c.cursorline })
	hi("ColorColumn", { bg = c.bg1 })

	hi("LineNr", { fg = c.gutter })
	hi("CursorLineNr", { fg = c.sand, bold = true })
	hi("SignColumn", { fg = c.fg_dim, bg = c.bg })
	hi("FoldColumn", { fg = c.gutter, bg = c.bg })
	hi("Folded", { fg = c.fg_subtle, bg = c.bg1 })

	hi("VertSplit", { fg = c.divider, bg = c.bg })
	hi("WinSeparator", { fg = c.divider, bg = c.bg })

	hi("Visual", { bg = "#14202c" })
	hi("VisualNOS", { bg = c.selection })

	-- Search (bone highlight)
	hi("Search", { fg = c.bg0, bg = c.sand })
	hi("IncSearch", { fg = c.bg0, bg = c.sand, bold = true })
	hi("CurSearch", { fg = c.bg0, bg = c.sand, bold = true })

	hi("MatchParen", { fg = c.fg, bg = c.bg2, bold = true })

	-- ===========================================================================
	-- Floating windows & popups
	-- ===========================================================================
	hi("NormalFloat", { fg = c.fg, bg = c.bg2 })
	hi("FloatBorder", { fg = c.border, bg = c.bg2 })
	hi("FloatTitle", { fg = c.fg, bg = c.bg2, bold = true })

	-- ===========================================================================
	-- Menus
	-- ===========================================================================
	hi("Pmenu", { fg = c.fg, bg = c.bg3 })
	hi("PmenuSel", { fg = c.sand, bg = c.selection, bold = true })
	hi("PmenuSbar", { bg = c.bg3 })
	hi("PmenuThumb", { bg = c.border })
	hi("WildMenu", { fg = c.fg, bg = c.selection, bold = true })

	-- ===========================================================================
	-- Statusline / tabs
	-- ===========================================================================
	hi("StatusLine", { fg = c.fg, bg = c.bg1 })
	hi("StatusLineNC", { fg = c.fg_subtle, bg = c.bg1 })
	hi("TabLine", { fg = c.fg_subtle, bg = c.bg1 })
	hi("TabLineSel", { fg = c.fg, bg = c.bg, bold = true })
	hi("TabLineFill", { bg = c.bg1 })

	-- ===========================================================================
	-- Messages
	-- ===========================================================================
	hi("ErrorMsg", { fg = c.err, bold = true })
	hi("WarningMsg", { fg = c.warn, bold = true })
	hi("MoreMsg", { fg = c.info })
	hi("ModeMsg", { fg = c.fg_dim })
	hi("Question", { fg = c.hint, bold = true })

	-- ===========================================================================
	-- Basic syntax (Vim highlight groups)
	-- ===========================================================================
	hi("Comment", { fg = c.fg_faint, italic = true })

	-- Strings
	hi("String", { fg = c.rose })
	hi("Character", { fg = c.rose })

	-- Specials / escapes (oil)
	hi("SpecialChar", { fg = c.oil, bold = true })
	hi("Special", { fg = c.oil, bold = true })
	hi("Debug", { fg = c.blood })

	-- Numbers/constants
	hi("Number", { fg = c.sky })
	hi("Float", { fg = c.sky })
	hi("Constant", { fg = c.sky })
	hi("Boolean", { fg = c.blood, bold = true })

	-- Identifiers/functions
	hi("Identifier", { fg = c.fg })
	hi("Function", { fg = c.copper, bold = true })

	-- Keywords/statements
	hi("Keyword", { fg = c.blood, bold = true })
	hi("Statement", { fg = c.blood, bold = true })
	hi("Conditional", { fg = c.blood, bold = true })
	hi("Repeat", { fg = c.blood, bold = true })
	hi("Exception", { fg = c.blood, bold = true })
	hi("Label", { fg = c.blood_dim })

	-- Types/preproc
	hi("Type", { fg = c.chrome })
	hi("StorageClass", { fg = c.chrome })
	hi("Structure", { fg = c.chrome })
	hi("Typedef", { fg = c.chrome })

	hi("PreProc", { fg = c.oil })
	hi("Include", { fg = c.oil, bold = true })
	hi("Define", { fg = c.oil_dim })
	hi("Macro", { fg = c.oil_dim })
	hi("PreCondit", { fg = c.oil_dim })

	-- Operators/punctuation
	hi("Operator", { fg = c.oil_dim })
	hi("Delimiter", { fg = c.fg_subtle })

	hi("Underlined", { underline = true })
	hi("Bold", { bold = true })
	hi("Italic", { italic = true })

	hi("Todo", { fg = c.bg0, bg = c.sand, bold = true })

	-- ===========================================================================
	-- Diff
	-- ===========================================================================
	hi("DiffAdd", { fg = c.ash_gold, bg = c.diff_add_bg })
	hi("DiffChange", { fg = c.oil, bg = c.diff_change_bg })
	hi("DiffDelete", { fg = c.git_delete, bg = c.diff_delete_bg })
	hi("DiffText", { fg = c.fg, bg = c.diff_text_bg, bold = true })

	-- ===========================================================================
	-- Diagnostics (LSP)
	-- ===========================================================================
	hi("DiagnosticError", { fg = c.err })
	hi("DiagnosticWarn", { fg = c.ember })
	hi("DiagnosticInfo", { fg = c.info })
	hi("DiagnosticHint", { fg = c.chrome })

	hi("DiagnosticUnderlineError", { undercurl = true, sp = c.err })
	hi("DiagnosticUnderlineWarn", { undercurl = true, sp = c.ember })
	hi("DiagnosticUnderlineInfo", { undercurl = true, sp = c.info })
	hi("DiagnosticUnderlineHint", { undercurl = true, sp = c.chrome })

	hi("DiagnosticVirtualTextError", { fg = c.err, bg = c.bg1 })
	hi("DiagnosticVirtualTextWarn", { fg = c.warn, bg = c.bg1 })
	hi("DiagnosticVirtualTextInfo", { fg = c.info, bg = c.bg1 })
	hi("DiagnosticVirtualTextHint", { fg = c.hint, bg = c.bg1 })

	hi("LspInlayHint", { fg = c.inlay, bg = c.bg })

	-- ===========================================================================
	-- Treesitter
	-- ===========================================================================
	link("@comment", "Comment")
	hi("@comment.todo", { fg = c.bg0, bg = c.sand, bold = true })
	hi("@comment.note", { fg = c.hint, italic = true })
	hi("@comment.warning", { fg = c.warn, italic = true })
	hi("@comment.error", { fg = c.err, italic = true })
	hi("@comment.documentation", { fg = c.steel, italic = true })
	hi("@comment.note", { fg = c.oil, italic = true })

	-- Literals
	link("@string", "String")
	hi("@string.escape", { fg = c.oil, bold = true })
	hi("@string.regex", { fg = c.oil, bold = true })
	hi("@string.special", { fg = c.copper_dim })

	link("@character", "Character")
	link("@number", "Number")
	link("@boolean", "Boolean")
	link("@float", "Float")

	hi("@constant", { fg = c.sky })
	hi("@constant.builtin", { fg = c.sky, italic = true })
	hi("@constant.macro", { fg = c.oil_dim, italic = true })

	-- Variables
	hi("@variable", { fg = c.fg })
	hi("@variable.builtin", { fg = c.slate, italic = true })
	hi("@variable.parameter", { fg = c.fg_dim })
	hi("@variable.member", { fg = c.steel, bold = true })

	-- Properties/fields
	hi("@property", { fg = c.steel })
	hi("@field", { fg = c.steel })

	-- Attributes/annotations
	hi("@attribute", { fg = c.chrome })
	hi("@annotation", { fg = c.chrome })

	-- Functions/methods
	hi("@function", { fg = c.copper, bold = true })
	hi("@function.builtin", { fg = c.copper, bold = true })
	hi("@function.call", { fg = c.copper_dim, bold = true })
	hi("@method", { fg = c.copper, bold = true })
	hi("@method.call", { fg = c.copper_dim, bold = true })

	-- Types/constructors
	hi("@type", { fg = c.chrome })
	hi("@type.builtin", { fg = c.chrome })
	hi("@constructor", { fg = c.chrome, bold = true })

	-- Keywords (keep blood spine)
	hi("@keyword", { fg = c.blood, bold = true })
	hi("@keyword.return", { fg = c.blood, bold = true })
	hi("@keyword.function", { fg = c.blood, bold = true })
	hi("@keyword.conditional", { fg = c.blood, bold = true })
	hi("@keyword.repeat", { fg = c.blood, bold = true })
	hi("@keyword.exception", { fg = c.blood, bold = true })

	-- Imports/modules (CHANGED: oil)
	hi("@keyword.import", { fg = c.oil, bold = true })
	hi("@namespace", { fg = c.oil })
	hi("@module", { fg = c.oil })

	-- Operators/punctuation
	hi("@keyword.operator", { fg = c.fg_subtle, bold = true })
	hi("@operator", { fg = c.oil_dim })
	hi("@punctuation.delimiter", { fg = c.fg_subtle })
	hi("@punctuation.bracket", { fg = c.fg_subtle })
	hi("@punctuation.special", { fg = c.oil_dim })

	-- Markup
	hi("@markup.heading", { fg = c.fg, bold = true })
	hi("@markup.strong", { bold = true })
	hi("@markup.italic", { italic = true })
	hi("@markup.link", { fg = c.sky, underline = true })
	hi("@markup.raw", { fg = c.copper_dim })
	hi("@markup.list", { fg = c.blood_dim })
	hi("@markup.quote", { fg = c.fg_dim, italic = true })

	-- HTML/JSX tags
	hi("@tag", { fg = c.fg, bold = true })
	hi("@tag.attribute", { fg = c.steel })
	hi("@tag.delimiter", { fg = c.fg_subtle })

	-- ===========================================================================
	-- LSP Semantic Tokens
	-- ===========================================================================
	hi("@lsp.type.class", { fg = c.chrome })
	hi("@lsp.type.enum", { fg = c.chrome })
	hi("@lsp.type.interface", { fg = c.chrome })
	hi("@lsp.type.type", { fg = c.chrome })
	hi("@lsp.type.typeParameter", { fg = c.fg_dim })

	hi("@lsp.type.function", { fg = c.copper, bold = true })
	hi("@lsp.type.method", { fg = c.copper, bold = true })

	hi("@lsp.type.property", { fg = c.steel }) -- CHANGED
	hi("@lsp.type.parameter", { fg = c.fg_dim })
	hi("@lsp.type.variable", { fg = c.fg })

	hi("@lsp.mod.unused", { fg = c.fg_faint })
	hi("@lsp.mod.readonly", { fg = c.slate, italic = true })
	hi("@lsp.mod.deprecated", { fg = c.fg_subtle, strikethrough = true })

	-- ===========================================================================
	-- UI essentials
	-- ===========================================================================
	hi("Title", { fg = c.fg, bold = true })
	hi("Directory", { fg = c.chrome, bold = true })

	hi("Conceal", { fg = c.fg_subtle })
	hi("qfLineNr", { fg = c.gutter })
	hi("qfFileName", { fg = c.chrome })

	hi("SpellBad", { underline = true, sp = c.err })
	hi("SpellCap", { underline = true, sp = c.warn })
	hi("SpellRare", { underline = true, sp = c.info })
	hi("SpellLocal", { underline = true, sp = c.hint })

	-- ===========================================================================
	-- Explorer / sidebar overrides
	-- ===========================================================================
	-- nvim-tree
	hi("NvimTreeNormal", { fg = c.fg, bg = c.bg })
	hi("NvimTreeNormalNC", { fg = c.fg_dim, bg = c.bg })
	hi("NvimTreeFolderName", { fg = c.chrome })
	hi("NvimTreeOpenedFolderName", { fg = c.chrome, bold = true })
	hi("NvimTreeRootFolder", { fg = c.fg_subtle, italic = true })
	hi("NvimTreeIndentMarker", { fg = c.divider })
	hi("NvimTreeExecFile", { fg = c.fg, bold = true })
	hi("NvimTreeSpecialFile", { fg = c.steel, bold = true })

	hi("NvimTreeGitDirty", { fg = c.git_change })
	hi("NvimTreeGitNew", { fg = c.ash_gold })
	hi("NvimTreeGitDeleted", { fg = c.git_delete })
	hi("NvimTreeModifiedFile", { fg = c.blood, bold = true })
	hi("NvimTreeModifiedIcon", { fg = c.blood, bold = true })

	-- neo-tree
	hi("NeoTreeNormal", { fg = c.fg, bg = c.bg })
	hi("NeoTreeNormalNC", { fg = c.fg_dim, bg = c.bg })
	hi("NeoTreeDirectoryName", { fg = c.chrome })
	hi("NeoTreeDirectoryIcon", { fg = c.fg_subtle })
	hi("NeoTreeFileName", { fg = c.fg })
	hi("NeoTreeRootName", { fg = c.fg_subtle, italic = true })
	hi("NeoTreeIndentMarker", { fg = c.divider })

	hi("NeoTreeGitUntracked", { fg = c.fg_subtle })
	hi("NeoTreeGitModified", { fg = c.git_change })
	hi("NeoTreeGitAdded", { fg = c.ash_gold })
	hi("NeoTreeGitDeleted", { fg = c.git_delete })
	hi("NeoTreeModified", { fg = c.blood, bold = true })
	hi("NeoTreeModifiedIndicator", { fg = c.blood, bold = true })

	hi("NeoTreeFileIcon", { fg = c.fg_subtle })
	hi("NeoTreeDotfile", { fg = c.fg_faint })

	-- ===========================================================================
	-- Common plugin polish
	-- ===========================================================================
	-- Telescope (KEEP bg = "NONE" per request)
	hi("TelescopeNormal", { fg = c.fg, bg = "NONE" })
	hi("TelescopeBorder", { fg = c.border, bg = "NONE" })
	hi("TelescopePromptNormal", { fg = c.fg, bg = "NONE" })
	hi("TelescopePromptBorder", { fg = c.border, bg = "NONE" })
	hi("TelescopeSelection", { bg = c.selection })
	hi("TelescopeSelectionCaret", { fg = c.blood, bold = true })
	hi("TelescopeMatching", { fg = c.copper, bold = true })
	hi("TelescopeTitle", { fg = c.fg, bg = c.bg2, bold = true })

	-- nvim-cmp
	hi("CmpItemAbbr", { fg = c.fg })
	hi("CmpItemAbbrDeprecated", { fg = c.fg_subtle, strikethrough = true })
	hi("CmpItemAbbrMatch", { fg = c.copper, bold = true })
	hi("CmpItemAbbrMatchFuzzy", { fg = c.copper, bold = true })
	hi("CmpItemMenu", { fg = c.fg_subtle })
	hi("CmpItemKind", { fg = c.chrome })

	-- GitSigns
	hi("GitSignsAdd", { fg = c.ash_gold })
	hi("GitSignsChange", { fg = c.oil })
	hi("GitSignsDelete", { fg = c.git_delete })

	-- WhichKey
	hi("WhichKey", { fg = c.fg, bold = true })
	hi("WhichKeyGroup", { fg = c.chrome })
	hi("WhichKeyDesc", { fg = c.fg })
	hi("WhichKeySeparator", { fg = c.divider })
	hi("WhichKeyFloat", { fg = c.fg, bg = c.bg2 })
	hi("WhichKeyBorder", { fg = c.border, bg = c.bg2 })

	-- ===========================================================================
	-- Optional: Lualine-like groups
	-- ===========================================================================
	hi("WaidmannsstahlAccent", { fg = c.bg0, bg = c.copper, bold = true })
	hi("WaidmannsstahlDanger", { fg = c.bg0, bg = c.blood, bold = true })
	hi("WaidmannsstahlHint", { fg = c.bg0, bg = c.hint, bold = true })
end

M._opts = {
	transparent = true,
}

function M.setup(opts)
	M._opts = vim.tbl_deep_extend("force", M._opts, opts or {})
end

function M.load()
	clear()

	if not M._opts.transparent then
		c.bg = c.bg0
	else
		c.bg = "NONE"
	end

	apply_highlights()
end

return M
