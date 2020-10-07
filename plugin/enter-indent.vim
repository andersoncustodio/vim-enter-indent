" Author:  andersoncustodio <https://github.com/andersoncustodio/vim-enter-indent>
" License: GPL

if exists('g:loaded_enter_indent') | finish | endif
let g:loaded_enter_indent = 1

let g:enter_indent_pairs = [
	\ ['[\{\[\(]','[\)\]\}]'],
	\ ['<[^>]*>', '</[^>]*>'],
	\ ['<?\(php\)\?','?>'],
	\ ['<%', '%>'],
	\ ['\[[^\]]*\]', '\[/[^\]]*\]'],
	\ ['<\!--\(\[[^\]]*\]>\)\?', '\(<\!\[[^\]]*\]\)\?-->'],
	\ ['\(#\)\?{[^\}]*\}', '\(#\)\?{[^\}]*\}'],
	\ ['{{[^}]*}}', '{{[^}]*}}'],
	\ ]

func! EnterIndent()
	let line = getline('.')
	let col = col('.') - 1

	let line_right = trim(line[col:])

	if line_right == "" | return "\<CR>" | endif

	for pair in g:enter_indent_pairs
		if matchstr(line_right, '^' . pair[1]) != ""
			let found = 1 | break
		endif
	endfor

	if !exists('found') | return "\<CR>" | endif

	let line_left = trim(line[0:col-1])

	if matchstr(line_left, pair[0] . '$') == ""
		return "\<CR>"
	endif

	if line[col] == " " || line[col-1] == " "
		return "\<Esc>bf\<Space>dwi\<CR>\<Esc>O"
	endif

    return "\<CR>\<Esc>O"
endf

if !exists('g:enter_indent_default_keymap') || g:enter_indent_default_keymap == 1
	inoremap <silent> <cr> <c-r>=EnterIndent()<cr>
endif

" vim:noet
