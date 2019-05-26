" Author:  andersoncustodio <https://github.com/andersoncustodio/vim-enter-indent>
" License: GPL

if exists('g:loaded_enter_indent') | finish | endif
let g:loaded_enter_indent = 1

let s:pairs = [
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

	let getline = getline('.')
	let col = col('.') - 1

	let getline_right = substitute(
		\ strpart(getline, col, col('$')),
		\ '^[ ]*', '', ''
		\ )

	if getline_right == "" | call feedkeys("\<CR>", 'n') | return '' | endif

	for pair in s:pairs
		if matchstr(getline_right, '^' . pair[1]) != ""
			let found = 1 | break
		endif
	endfor

	if !exists('found') | call feedkeys("\<CR>", 'n') | return '' | endif

	let getline_left = substitute(
		\ strpart(getline, 0, col),
		\ '[ ]*$', '', ''
		\ )

	if matchstr(getline_left, pair[0] . '$') == ""
		silent call feedkeys("\<CR>", 'n') | return ''
	endif

	let line = line('.')
	let indent = substitute(getline_left, '^\([ |\t]*\).*$', '\1', '')

	silent call setline(line, getline_left)
	silent call append(line, indent . getline_right)
	silent call feedkeys("\<Esc>\<Down>\O", 'n')

	return ''
endf

if !exists('g:enter_indent_default_keymap') || g:enter_indent_default_keymap == 1
	inoremap <silent> <cr> <c-r>=EnterIndent()<cr>
endif

" vim:noet
