"   _________                  .___
"  /   _____/ ____ _____     __| _/___________     ____   ____   ____
"  \_____  \_/ __ \\__  \   / __ |\_  __ \__  \   / ___\ /  _ \ /    \
"  /        \  ___/ / __ \_/ /_/ | |  | \// __ \_/ /_/  >  <_> )   |  \
" /_______  /\___  >____  /\____ | |__|  (____  /\___  / \____/|___|  /
"         \/     \/     \/      \/            \//_____/             \/

" A Terminal && Vim colorscheme
" Author:       Michael Reinhardt
" Script URL:   https://github.com/mreinhardt/Seadragon
" License:      MIT

" Copyright (c) 2017 Michael Reinhardt
"
" Permission is hereby granted, free of charge, to any person obtaining a copy
" of this software and associated documentation files (the "Software"), to deal
" in the Software without restriction, including without limitation the rights
" to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
" copies of the Software, and to permit persons to whom the Software is
" furnished to do so, subject to the following conditions:
"
" The above copyright notice and this permission notice shall be included in
" all copies or substantial portions of the Software.
"
" THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
" IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
" FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
" AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
" LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
" OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
" THE SOFTWARE.

"=================================================================================
" SEADRAGON TERMINAL:
"=================================================================================
"     Foreground    #afd7ff             |      Selection     #d7ff00             |
"     Background    #1c1c1c             |      Selected Text #1c1c1c             |
"     Bold          #d7ffff             |                                        |
"     Links         #5f87ff             |                                        |
"     CursorColor   #00ff87             |                                        |
"     CursorText    #1c1c1c             |                                        |
"=================================================================================
" ANSI COLORS:                                                                   |
"=================================================================================
"---------------------------------------|-----------------------------------------
"   NORMAL     Hex       xterm   cterm  |   BRIGHT      Hex       xterm   cterm  |
"---------------------------------------|-----------------------------------------
"   Black      #1c1c1c   0       234    |   brBlack     #5f5f87   8       60     |
"   Red        #af0087   1       126    |   brRed       #ff00d7   9       200    |
"   Green      #00af5f   2       35     |   brGreen     #00ff87   10      48     |
"   Yellow     #afd700   3       148    |   brYellow    #d7ff00   11      190    |
"   Blue       #005faf   4       25     |   brBlue      #5f87ff   12      69     |
"   Magenta    #8700d7   5       92     |   brMagenta   #875fff   13      99     |
"   Cyan       #5fafd7   6       74     |   brCyan      #5fd7ff   14      81     |
"   White      #afd7ff   7       153    |   brWhite     #d7ffff   15      195    |
"---------------------------------------|-----------------------------------------
"=================================================================================

"=================================================================================
" SETUP:
"=================================================================================

set background=dark

highlight clear
if exists("syntax_on")
    syntax reset
endif

let g:colors_name="seadragon"

let s:colors = {
  \ "black": {"gui": "#1c1c1c", "cterm": "234"},
  \ "red": {"gui": "#af0087", "cterm": "126"},
  \ "green": {"gui": "#00af5f", "cterm": "35"},
  \ "yellow": {"gui": "#afd700", "cterm": "148"},
  \ "blue": {"gui": "#005faf", "cterm": "25"},
  \ "magenta": {"gui": "#8700d7", "cterm": "92"},
  \ "cyan": {"gui": "#5fafd7", "cterm": "74"},
  \ "white": {"gui": "#afd7ff", "cterm": "153"},
  \ "br_black": {"gui": "#5f5f87", "cterm": "60"},
  \ "br_red": {"gui": "#ff00d7", "cterm": "200"},
  \ "br_green": {"gui": "#00ff87", "cterm": "48"},
  \ "br_yellow": {"gui": "#d7ff00", "cterm": "190"},
  \ "br_blue": {"gui": "#5f87ff", "cterm": "69"},
  \ "br_magenta": {"gui": "#875fff", "cterm": "99"},
  \ "br_cyan": {"gui": "#5fd7ff", "cterm": "81"},
  \ "br_white": {"gui": "#d7ffff", "cterm": "195"},
  \}

if has("nvim")
  let g:terminal_color_0 = s:colors.black.gui
  let g:terminal_color_1 = s:colors.red.gui
  let g:terminal_color_2 = s:colors.green.gui
  let g:terminal_color_3 = s:colors.yellow.gui
  let g:terminal_color_4 = s:colors.blue.gui
  let g:terminal_color_5 = s:colors.magenta.gui
  let g:terminal_color_6 = s:colors.cyan.gui
  let g:terminal_color_7 = s:colors.white.gui
  let g:terminal_color_8 = s:colors.br_black.gui
  let g:terminal_color_9 = s:colors.br_red.gui
  let g:terminal_color_10 = s:colors.br_green.gui
  let g:terminal_color_11 = s:colors.br_yellow.gui
  let g:terminal_color_12 = s:colors.br_blue.gui
  let g:terminal_color_13 = s:colors.br_magenta.gui
  let g:terminal_color_14 = s:colors.br_cyan.gui
  let g:terminal_color_15 = s:colors.br_white.gui
  " let g:terminal_color_background = g:terminal_color_0
  let g:terminal_color_foreground = g:terminal_color_7
endif

function! s:highlight(group, style)
  execute "highlight" a:group
    \ "guifg=" (has_key(a:style, "fg") ? a:style.fg.gui : "NONE")
    \ "guibg=" (has_key(a:style, "bg") ? a:style.bg.gui : "NONE")
    \ "guisp=" (has_key(a:style, "sp") ? a:style.sp.gui : "NONE")
    \ "gui=" (has_key(a:style, "gui") ? a:style.gui : "NONE")
    \ "ctermfg=" (has_key(a:style, "fg") ? a:style.fg.cterm : "NONE")
    \ "ctermbg=" (has_key(a:style, "bg") ? a:style.bg.cterm : "NONE")
    \ "cterm=" (has_key(a:style, "cterm") ? a:style.cterm : "NONE")
endfunction

"================================================================================
" SEADRAGON HIGHLIGHTING:
"================================================================================

call s:highlight("Comment", {"fg": s:colors.br_black}) " any comment
call s:highlight("Constant", {"fg": s:colors.br_green}) " any constant
call s:highlight("String", {"fg": s:colors.br_green}) " a string constant: "this is a string"
call s:highlight("Character", {"fg": s:colors.br_green}) " a character constant: 'c', '\n'
call s:highlight("Number", {"fg": s:colors.yellow}) " a number constant: 234, 0xff
call s:highlight("Boolean", {"fg": s:colors.yellow}) " a boolean constant: TRUE, false
call s:highlight("Float", {"fg": s:colors.yellow}) " a floating point constant: 2.3e10
call s:highlight("Identifier", {"fg": s:colors.br_cyan}) " any variable name
call s:highlight("Function", {"fg": s:colors.br_cyan}) " function name (also: methods for classes)
call s:highlight("Statement", {"fg": s:colors.br_red}) " any statement
call s:highlight("Conditional", {"fg": s:colors.br_magenta}) " if, then, else, endif, switch, etc.
call s:highlight("Repeat", {"fg": s:colors.br_magenta}) " for, do, while, etc.
call s:highlight("Label", {"fg": s:colors.br_magenta}) " case, default, etc.
call s:highlight("Operator", {"fg": s:colors.br_yellow}) " sizeof", "+", "*", etc.
call s:highlight("Quote", {"fg": s:colors.br_yellow})
call s:highlight("Keyword", {"fg": s:colors.br_red}) " any other keyword
call s:highlight("Exception", {"fg": s:colors.br_red}) " try, catch, throw
call s:highlight("PreProc", {"fg": s:colors.br_blue}) " generic Preprocessor
call s:highlight("Include", {"fg": s:colors.br_blue}) " preprocessor #include
call s:highlight("Define", {"fg": s:colors.br_magenta}) " preprocessor #define
call s:highlight("Macro", {"fg": s:colors.br_magenta}) " same as Define
call s:highlight("PreCondit", {"fg": s:colors.br_yellow}) " preprocessor #if, #else, #endif, etc.
call s:highlight("Type", {"fg": s:colors.br_yellow}) " int, long, char, etc.
call s:highlight("StorageClass", {"fg": s:colors.br_yellow}) " static, register, volatile, etc.
call s:highlight("Structure", {"fg": s:colors.br_yellow}) " struct, union, enum, etc.
call s:highlight("Typedef", {"fg": s:colors.br_yellow}) " A typedef
call s:highlight("Special", {"fg": s:colors.br_blue}) " any special symbol
call s:highlight("SpecialChar", {"fg": s:colors.green}) " special character in a constant
call s:highlight("Tag", {}) " you can use CTRL-] on this
call s:highlight("Delimiter", {}) " character that needs attention
call s:highlight("SpecialComment", {"fg": s:colors.br_yellow, "bg": s:colors.black}) " special things inside a comment
call s:highlight("Debug", {}) " debugging statements
call s:highlight("Underlined", {"gui": "underline", "cterm": "underline"}) " text that stands out, HTML links
call s:highlight("Ignore", {}) " left blank, hidden
call s:highlight("Error", {"fg": s:colors.br_red}) " any erroneous construct
call s:highlight("Todo", {"fg": s:colors.br_magenta}) " anything that needs extra attention; mostly the keywords TODO FIXME and XXX

call s:highlight("ColorColumn", {"bg": s:colors.black}) " used for the columns set with 'colorcolumn'
call s:highlight("Conceal", {}) " placeholder characters substituted for concealed text (see 'conceallevel')
call s:highlight("Cursor", {"fg": s:colors.black, "bg": s:colors.br_green}) " the character under the cursor
call s:highlight("CursorIM", {"bg": s:colors.black}) " like Cursor, but used when in IME mode
call s:highlight("CursorColumn", {"bg": s:colors.black}) " the screen column that the cursor is in when 'cursorcolumn' is set
call s:highlight("CursorLine", {"bg": s:colors.black}) " the screen line that the cursor is in when 'cursorline' is set
call s:highlight("Directory", {"fg": s:colors.br_blue}) " directory names (and other special names in listings)
call s:highlight("DiffAdd", {"bg": s:colors.green, "fg": s:colors.br_black}) " diff mode: Added line
call s:highlight("DiffChange", {"bg": s:colors.cyan, "fg": s:colors.br_black}) " diff mode: Changed line
call s:highlight("DiffDelete", {"bg": s:colors.red, "fg": s:colors.br_black}) " diff mode: Deleted line
call s:highlight("DiffText", {"bg": s:colors.br_black, "fg": s:colors.cyan}) " diff mode: Changed text within a changed line
call s:highlight("ErrorMsg", {"fg": s:colors.br_red}) " error messages on the command line
call s:highlight("VertSplit", {"fg": s:colors.br_black}) " the column separating vertically split windows
call s:highlight("Folded", {"fg": s:colors.br_black}) " line used for closed folds
call s:highlight("FoldColumn", {"fg": s:colors.cyan}) " 'foldcolumn'
call s:highlight("SignColumn", {"fg": s:colors.cyan}) " column where signs are displayed
call s:highlight("IncSearch", {"fg": s:colors.br_cyan, "bg": s:colors.br_black}) " 'incsearch' highlighting; also used for the text replaced with ":s///c"
call s:highlight("LineNr", {"fg": s:colors.br_black}) " Line number for ":number" and ":#" commands, and when 'number' or 'relativenumber' option is set.
call s:highlight("CursorLineNr", {"bg": s:colors.br_black}) " Like LineNr when 'cursorline' or 'relativenumber' is set for the cursor line.
call s:highlight("MatchParen", {"fg": s:colors.br_black, "bg": s:colors.br_cyan}) " The character under the cursor or just before it, if it is a paired bracket, and its match.
call s:highlight("ModeMsg", {"fg": s:colors.blue}) " 'showmode' message (e.g., "-- INSERT --")
call s:highlight("MoreMsg", {"fg": s:colors.green}) " more-prompt
call s:highlight("Noise", {"fg": s:colors.magenta}) " unimportant syntax elements
call s:highlight("NonText", {"fg": s:colors.br_black}) " '~' and '@' at the end of the window, characters from 'showbreak' and other characters that do not really exist in the text (e.g., ">" displayed when a double-wide character doesn't fit at the end of the line).
call s:highlight("Normal", {"fg": s:colors.white}) " normal text
call s:highlight("Pmenu", {"bg": s:colors.br_black}) " Popup menu: normal item.
call s:highlight("PmenuSel", {"fg": s:colors.br_black, "bg": s:colors.br_cyan}) " Popup menu: selected item.
call s:highlight("PmenuSbar", {"fg": s:colors.br_black, "bg": s:colors.black}) " Popup menu: scrollbar.
call s:highlight("PmenuThumb", {"bg": s:colors.white}) " Popup menu: Thumb of the scrollbar.
call s:highlight("Question", {"fg": s:colors.br_magenta}) " hit-enter prompt and yes/no questions
call s:highlight("Search", {"fg": s:colors.black, "bg": s:colors.br_cyan}) " Last search pattern highlighting (see 'hlsearch'). Also used for highlighting the current line in the quickfix window and similar items that need to stand out.
call s:highlight("SpecialKey", {"fg": s:colors.br_black, "bg": s:colors.cyan}) " Meta and special keys listed with ":map", also for text used to show unprintable characters in the text, 'listchars'. Generally: text that is displayed differently from what it really is.
call s:highlight("SpellBad", {"fg": s:colors.br_red, "gui": "undercurl", "cterm": "undercurl"}) " Word that is not recognized by the spellchecker. This will be combined with the highlighting used otherwise.
call s:highlight("SpellCap", {"fg": s:colors.cyan, "gui": "undercurl", "cterm": "undercurl"}) " Word that should start with a capital. This will be combined with the highlighting used otherwise.
call s:highlight("SpellLocal", {"fg": s:colors.green, "gui": "undercurl", "cterm": "undercurl"}) " Word that is recognized by the spellchecker as one that is used in another region. This will be combined with the highlighting used otherwise.
call s:highlight("SpellRare", {"fg": s:colors.yellow, "gui": "undercurl", "cterm": "undercurl"}) " Word that is recognized by the spellchecker as one that is hardly ever used. spell This will be combined with the highlighting used otherwise.
call s:highlight("StatusLine", {"fg": s:colors.br_white, "bg": s:colors.br_green}) " status line of current window
call s:highlight("StatusLineNC", {"fg": s:colors.br_black}) " status lines of not-current windows Note: if this is equal to "StatusLine" Vim will use "^^^" in the status line of the current window.
call s:highlight("Symbol", {"fg": s:colors.br_yellow})
call s:highlight("TabLine", {"fg": s:colors.br_black, "bg": s:colors.black}) " tab pages line, not active tab page label
call s:highlight("TabLineFill", {"bg": s:colors.black}) " tab pages line, where there are no labels
call s:highlight("TabLineSel", {"fg": s:colors.br_white, "bg": s:colors.black}) " tab pages line, active tab page label
call s:highlight("Title", {"fg": s:colors.br_blue}) " titles for output from ":set all", ":autocmd" etc.
call s:highlight("VimCommentTitle", {"fg": s:colors.br_white, "bg": s:colors.black}) " Title elements within comments
call s:highlight("Visual", {"fg": s:colors.black, "bg": s:colors.br_cyan}) " Visual mode selection
call s:highlight("VisualNOS", {"bg": s:colors.br_black}) " Visual mode selection when vim is "Not Owning the Selection". Only X11 Gui's gui-x11 and xterm-clipboard supports this.
call s:highlight("WarningMsg", {"fg": s:colors.br_yellow}) " warning messages
call s:highlight("WildMenu", {"fg": s:colors.black, "bg": s:colors.br_cyan}) " current match in 'wildmenu' completion

" CSS
call s:highlight("cssAttrComma", {"fg": s:colors.green})
call s:highlight("cssAttributeSelector", {"fg": s:colors.br_green})
call s:highlight("cssBraces", {"fg": s:colors.br_white})
call s:highlight("cssClassName", {"fg": s:colors.cyan})
call s:highlight("cssClassNameDot", {"fg": s:colors.br_cyan})
call s:highlight("cssDefinition", {"fg": s:colors.br_magenta})
call s:highlight("cssFontAttr", {"fg": s:colors.cyan})
call s:highlight("cssFontDescriptor", {"fg": s:colors.br_yellow})
call s:highlight("cssFunctionName", {"fg": s:colors.br_blue})
call s:highlight("cssIdentifier", {"fg": s:colors.br_blue})
call s:highlight("cssImportant", {"fg": s:colors.br_red})
call s:highlight("cssInclude", {"fg": s:colors.br_white})
call s:highlight("cssIncludeKeyword", {"fg": s:colors.br_yellow})
call s:highlight("cssMediaType", {"fg": s:colors.br_cyan})
call s:highlight("cssProp", {"fg": s:colors.br_white})
call s:highlight("cssPseudoClassId", {"fg": s:colors.br_cyan})
call s:highlight("cssSelectorOp", {"fg": s:colors.green})
call s:highlight("cssSelectorOp2", {"fg": s:colors.green})
call s:highlight("cssTagName", {"fg": s:colors.yellow})

" Go
call s:highlight("goDeclaration", {"fg": s:colors.br_magenta})

" netrw
call s:highlight("netrwExe", {"fg": s:colors.br_blue})
call s:highlight("netrwList", {"fg": s:colors.br_magenta})

" HTML
call s:highlight("htmlTitle", {"fg": s:colors.br_white})
call s:highlight("htmlArg", {"fg": s:colors.br_red})
call s:highlight("htmlItalic", {"fg": s:colors.br_magenta})
call s:highlight("htmlEndTag", {"fg": s:colors.br_white})
call s:highlight("htmlH1", {"fg": s:colors.br_white})
call s:highlight("htmlLink", {"fg": s:colors.br_cyan, "gui": "underline", "cterm": "underline"})
call s:highlight("htmlSpecialChar", {"fg": s:colors.red})
call s:highlight("htmlSpecialTagName", {"fg": s:colors.br_yellow})
call s:highlight("htmlTag", {"fg": s:colors.br_white})
call s:highlight("htmlTagName", {"fg": s:colors.yellow})

" JavaScript
call s:highlight("javaScriptBraces", {"fg": s:colors.br_white})
call s:highlight("javaScriptFunction", {"fg": s:colors.br_red})
call s:highlight("javaScriptIdentifier", {"fg": s:colors.br_red})
call s:highlight("javaScriptNull", {"fg": s:colors.yellow})
call s:highlight("javaScriptNumber", {"fg": s:colors.yellow})
call s:highlight("javaScriptRequire", {"fg": s:colors.br_cyan})
call s:highlight("javaScriptReserved", {"fg": s:colors.br_red})
" https://github.com/pangloss/vim-javascript
call s:highlight("jsArrowFunction", {"fg": s:colors.br_cyan})
call s:highlight("jsClassKeyword", {"fg": s:colors.br_cyan})
call s:highlight("jsClassMethodType", {"fg": s:colors.br_yellow})
call s:highlight("jsDocParam", {"fg": s:colors.br_blue})
call s:highlight("jsDocTags", {"fg": s:colors.br_magenta})
call s:highlight("jsExport", {"fg": s:colors.br_yellow})
call s:highlight("jsExportDefault", {"fg": s:colors.br_green})
call s:highlight("jsExtendsKeyword", {"fg": s:colors.br_yellow})
call s:highlight("jsFrom", {"fg": s:colors.br_yellow})
call s:highlight("jsFuncCall", {"fg": s:colors.br_blue})
call s:highlight("jsFunction", {"fg": s:colors.br_cyan})
call s:highlight("jsGenerator", {"fg": s:colors.br_green})
call s:highlight("jsGlobalObjects", {"fg": s:colors.br_green})
call s:highlight("jsImport", {"fg": s:colors.br_yellow})
call s:highlight("jsModuleAs", {"fg": s:colors.br_yellow})
call s:highlight("jsModuleWords", {"fg": s:colors.br_yellow})
call s:highlight("jsModules", {"fg": s:colors.br_yellow})
call s:highlight("jsNull", {"fg": s:colors.br_magenta})
call s:highlight("jsOperator", {"fg": s:colors.br_yellow})
call s:highlight("jsStorageClass", {"fg": s:colors.br_yellow})
call s:highlight("jsSuper", {"fg": s:colors.br_red})
call s:highlight("jsTemplateBraces", {"fg": s:colors.red})
call s:highlight("jsTemplateVar", {"fg": s:colors.br_green})
call s:highlight("jsThis", {"fg": s:colors.br_cyan})
call s:highlight("jsUndefined", {"fg": s:colors.br_magenta})
" https://github.com/othree/yajs.vim
call s:highlight("javascriptArrowFunc", {"fg": s:colors.br_cyan})
call s:highlight("javascriptClassExtends", {"fg": s:colors.br_yellow})
call s:highlight("javascriptClassKeyword", {"fg": s:colors.br_cyan})
call s:highlight("javascriptDocNotation", {"fg": s:colors.br_magenta})
call s:highlight("javascriptDocParamName", {"fg": s:colors.br_blue})
call s:highlight("javascriptDocTags", {"fg": s:colors.br_magenta})
call s:highlight("javascriptEndColons", {"fg": s:colors.magenta})
call s:highlight("javascriptExport", {"fg": s:colors.br_yellow})
call s:highlight("javascriptFuncArg", {"fg": s:colors.br_cyan})
call s:highlight("javascriptFuncKeyword", {"fg": s:colors.br_blue})
call s:highlight("javascriptIdentifier", {"fg": s:colors.br_red})
call s:highlight("javascriptImport", {"fg": s:colors.br_yellow})
call s:highlight("javascriptMethodName", {"fg": s:colors.br_cyan})
call s:highlight("javascriptObjectLabel", {"fg": s:colors.br_cyan})
call s:highlight("javascriptOpSymbol", {"fg": s:colors.yellow})
call s:highlight("javascriptOpSymbols", {"fg": s:colors.yellow})
call s:highlight("javascriptPropertyName", {"fg": s:colors.br_green})
call s:highlight("javascriptTemplateSB", {"fg": s:colors.red})
call s:highlight("javascriptVariable", {"fg": s:colors.br_green})

" JSON
call s:highlight("jsonCommentError", {"fg": s:colors.br_yellow})
call s:highlight("jsonKeyword", {"fg": s:colors.br_red})
call s:highlight("jsonBoolean", {"fg": s:colors.cyan})
call s:highlight("jsonNumber", {"fg": s:colors.cyan})
call s:highlight("jsonQuote", {"fg": s:colors.br_yellow})
call s:highlight("jsonMissingCommaError", {"fg": s:colors.br_red, "gui": "reverse", "cterm": "reverse"})
call s:highlight("jsonNoQuotesError", {"fg": s:colors.br_red, "gui": "reverse", "cterm": "reverse"})
call s:highlight("jsonNumError", {"fg": s:colors.br_red, "gui": "reverse", "cterm": "reverse"})
call s:highlight("jsonString", {"fg": s:colors.br_green})
call s:highlight("jsonStringSQError", {"fg": s:colors.br_red, "gui": "reverse", "cterm": "reverse"})
call s:highlight("jsonSemicolonError", {"fg": s:colors.br_red, "gui": "reverse", "cterm": "reverse"})

" LESS
call s:highlight("lessVariable", {"fg": s:colors.br_yellow})
call s:highlight("lessAmpersandChar", {"fg": s:colors.br_red})
call s:highlight("lessClass", {"fg": s:colors.cyan})

" Markdown
call s:highlight("markdownCode", {"fg": s:colors.br_green})
call s:highlight("markdownCodeBlock", {"fg": s:colors.br_green})
call s:highlight("markdownCodeDelimiter", {"fg": s:colors.br_green})
call s:highlight("markdownHeadingDelimiter", {"fg": s:colors.br_red})
call s:highlight("markdownRule", {"fg": s:colors.br_black})
call s:highlight("markdownHeadingRule", {"fg": s:colors.br_black})
call s:highlight("markdownH1", {"fg": s:colors.br_yellow})
call s:highlight("markdownH2", {"fg": s:colors.br_yellow})
call s:highlight("markdownH3", {"fg": s:colors.br_yellow})
call s:highlight("markdownH4", {"fg": s:colors.br_yellow})
call s:highlight("markdownH5", {"fg": s:colors.br_yellow})
call s:highlight("markdownH6", {"fg": s:colors.br_yellow})
call s:highlight("markdownIdDelimiter", {"fg": s:colors.br_magenta})
call s:highlight("markdownId", {"fg": s:colors.br_magenta})
call s:highlight("markdownBlockquote", {"fg": s:colors.br_black})
call s:highlight("markdownItalic", {"fg": s:colors.br_cyan, "gui": "italic", "cterm": "italic"})
call s:highlight("markdownBold", {"fg": s:colors.yellow, "gui": "bold", "cterm": "bold"})
call s:highlight("markdownListMarker", {"fg": s:colors.br_red})
call s:highlight("markdownOrderedListMarker", {"fg": s:colors.br_red})
call s:highlight("markdownIdDeclaration", {"fg": s:colors.br_blue})
call s:highlight("markdownLinkText", {"fg": s:colors.br_cyan, "gui": "underline", "cterm": "underline"})
call s:highlight("markdownLinkDelimiter", {"fg": s:colors.br_white})
call s:highlight("markdownUrl", {"fg": s:colors.br_cyan, "gui": "underline", "cterm": "underline"})

" Perl
call s:highlight("perlFiledescRead", {"fg": s:colors.br_green})
call s:highlight("perlFunction", {"fg": s:colors.br_cyan})
call s:highlight("perlMatchStartEnd",{"fg": s:colors.br_blue})
call s:highlight("perlMethod", {"fg": s:colors.br_cyan})
call s:highlight("perlPOD", {"fg": s:colors.br_black})
call s:highlight("perlSharpBang", {"fg": s:colors.br_black})
call s:highlight("perlSpecialString",{"fg": s:colors.br_cyan})
call s:highlight("perlStatementFiledesc", {"fg": s:colors.br_red})
call s:highlight("perlStatementFlow",{"fg": s:colors.br_red})
call s:highlight("perlStatementInclude", {"fg": s:colors.br_yellow})
call s:highlight("perlStatementScalar",{"fg": s:colors.br_yellow})
call s:highlight("perlStatementStorage", {"fg": s:colors.br_yellow})
call s:highlight("perlSubName",{"fg": s:colors.br_cyan})
call s:highlight("perlVarPlain",{"fg": s:colors.br_blue})

" PHP
call s:highlight("phpVarSelector", {"fg": s:colors.br_red})
call s:highlight("phpOperator", {"fg": s:colors.br_white})
call s:highlight("phpParent", {"fg": s:colors.br_white})
call s:highlight("phpMemberSelector", {"fg": s:colors.br_white})
call s:highlight("phpType", {"fg": s:colors.br_magenta})
call s:highlight("phpKeyword", {"fg": s:colors.br_yellow})
call s:highlight("phpClass", {"fg": s:colors.br_yellow})
call s:highlight("phpUseClass", {"fg": s:colors.br_white})
call s:highlight("phpUseAlias", {"fg": s:colors.br_white})
call s:highlight("phpInclude", {"fg": s:colors.br_yellow})
call s:highlight("phpClassExtends", {"fg": s:colors.br_green})
call s:highlight("phpDocTags", {"fg": s:colors.br_white})
call s:highlight("phpFunction", {"fg": s:colors.br_blue})
call s:highlight("phpFunctions", {"fg": s:colors.br_cyan})
call s:highlight("phpMethodsVar", {"fg": s:colors.yellow})
call s:highlight("phpMagicConstants", {"fg": s:colors.yellow})
call s:highlight("phpSuperglobals", {"fg": s:colors.br_red})
call s:highlight("phpConstants", {"fg": s:colors.yellow})

" Ruby
call s:highlight("rubyBlockParameter", {"fg": s:colors.br_red})
call s:highlight("rubyBlockParameterList", {"fg": s:colors.br_red})
call s:highlight("rubyClass", {"fg": s:colors.br_cyan})
call s:highlight("rubyConstant", {"fg": s:colors.br_yellow})
call s:highlight("rubyControl", {"fg": s:colors.br_cyan})
call s:highlight("rubyEscape", {"fg": s:colors.br_red})
call s:highlight("rubyFunction", {"fg": s:colors.br_blue})
call s:highlight("rubyGlobalVariable", {"fg": s:colors.br_red})
call s:highlight("rubyInclude", {"fg": s:colors.br_blue})
call s:highlight("rubyIncluderubyGlobalVariable", {"fg": s:colors.br_red})
call s:highlight("rubyInstanceVariable", {"fg": s:colors.br_red})
call s:highlight("rubyInterpolation", {"fg": s:colors.br_cyan})
call s:highlight("rubyInterpolationDelimiter", {"fg": s:colors.br_red})
call s:highlight("rubyInterpolationDelimiter", {"fg": s:colors.br_red})
call s:highlight("rubyRegexp", {"fg": s:colors.br_cyan})
call s:highlight("rubyRegexpDelimiter", {"fg": s:colors.br_cyan})
call s:highlight("rubyStringDelimiter", {"fg": s:colors.br_green})
call s:highlight("rubySymbol", {"fg": s:colors.br_cyan})

" Sass
" https://github.com/tpope/vim-haml
call s:highlight("sassAmpersand", {"fg": s:colors.br_red})
call s:highlight("sassClass", {"fg": s:colors.yellow})
call s:highlight("sassControl", {"fg": s:colors.br_cyan})
call s:highlight("sassExtend", {"fg": s:colors.br_yellow})
call s:highlight("sassFor", {"fg": s:colors.br_yellow})
call s:highlight("sassFunction", {"fg": s:colors.br_cyan})
call s:highlight("sassId", {"fg": s:colors.br_blue})
call s:highlight("sassInclude", {"fg": s:colors.br_yellow})
call s:highlight("sassMedia", {"fg": s:colors.br_yellow})
call s:highlight("sassMediaOperators", {"fg": s:colors.br_yellow})
call s:highlight("sassMixin", {"fg": s:colors.br_yellow})
call s:highlight("sassMixinName", {"fg": s:colors.br_blue})
call s:highlight("sassMixing", {"fg": s:colors.br_yellow})
call s:highlight("sassVariable", {"fg": s:colors.br_cyan})
" https://github.com/cakebaker/scss-syntax.vim
call s:highlight("scssExtend", {"fg": s:colors.br_yellow})
call s:highlight("scssImport", {"fg": s:colors.br_yellow})
call s:highlight("scssInclude", {"fg": s:colors.br_yellow})
call s:highlight("scssMixin", {"fg": s:colors.br_yellow})
call s:highlight("scssSelectorName", {"fg": s:colors.cyan})
call s:highlight("scssVariable", {"fg": s:colors.br_cyan})

" TypeScript
call s:highlight("typescriptReserved", {"fg": s:colors.br_red})
call s:highlight("typescriptEndColons", {"fg": s:colors.magenta})
call s:highlight("typescriptBraces", {"fg": s:colors.magenta})

" XML
call s:highlight("xmlAttrib", {"fg": s:colors.br_red})
call s:highlight("xmlEndTag", {"fg": s:colors.br_yellow})
call s:highlight("xmlTag", {"fg": s:colors.br_yellow})
call s:highlight("xmlTagName", {"fg": s:colors.br_yellow})

" airblade/vim-gitgutter
hi link GitGutterAdd    SignifySignAdd
hi link GitGutterChange SignifySignChange
hi link GitGutterDelete SignifySignDelete

" mhinz/vim-signify
call s:highlight("SignifySignAdd", {"fg": s:colors.br_green})
call s:highlight("SignifySignChange", {"fg": s:colors.br_yellow})
call s:highlight("SignifySignDelete", {"fg": s:colors.br_red})

" neomake/neomake
call s:highlight("NeomakeWarningSign", {"fg": s:colors.br_yellow})
call s:highlight("NeomakeErrorSign", {"fg": s:colors.br_red})
call s:highlight("NeomakeInfoSign", {"fg": s:colors.br_blue})

" tpope/vim-fugitive
call s:highlight("diffAdded", {"fg": s:colors.br_green})
call s:highlight("diffRemoved", {"fg": s:colors.br_red})

" git
call s:highlight("gitcommitComment", {"fg": s:colors.br_black})
call s:highlight("gitcommitUnmerged", {"fg": s:colors.br_green})
call s:highlight("gitcommitOnBranch", {})
call s:highlight("gitcommitBranch", {"fg": s:colors.br_cyan})
call s:highlight("gitcommitDiscardedType", {"fg": s:colors.br_red})
call s:highlight("gitcommitSelectedType", {"fg": s:colors.br_green})
call s:highlight("gitcommitHeader", {})
call s:highlight("gitcommitUntrackedFile", {"fg": s:colors.br_cyan})
call s:highlight("gitcommitDiscardedFile", {"fg": s:colors.br_red})
call s:highlight("gitcommitSelectedFile", {"fg": s:colors.br_green})
call s:highlight("gitcommitUnmergedFile", {"fg": s:colors.br_yellow})
call s:highlight("gitcommitFile", {})
call s:highlight("gitcommitSummary", {"fg": s:colors.br_white})
call s:highlight("gitcommitOverflow", {"fg": s:colors.br_red})
hi link gitcommitNoBranch gitcommitBranch
hi link gitcommitUntracked gitcommitComment
hi link gitcommitDiscarded gitcommitComment
hi link gitcommitSelected gitcommitComment
hi link gitcommitDiscardedArrow gitcommitDiscardedFile
hi link gitcommitSelectedArrow gitcommitSelectedFile
hi link gitcommitUnmergedArrow gitcommitUnmergedFile

" Transparent background
hi Normal guibg=NONE ctermbg=NONE
hi NonText guibg=NONE ctermbg=NONE
