runtime! ftplugin/m4.vim

let b:match_words+='«:»'
set matchpairs+=«:»

" NERDcommenter support
let s:delimiter = { 'm4rkup': { 'left': 'dnl ' } }
if !exists("g:NERDDelimiterMap")
	" we are being loaded before NERDcommenter -- g:NERDDelimiterMap is only built
	" later from g:NERDCustomDelimiters when loading NERDcommenter
	if !exists("g:NERDCustomDelimiters")
		let g:NERDCustomDelimiters = {}
	endif
	call extend(g:NERDCustomDelimiters, s:delimiter)
else
	" we are being loaded after NERDcommenter -- just hack into g:NERDDelimiterMap
	call extend(g:NERDDelimiterMap, s:delimiter)
endif
