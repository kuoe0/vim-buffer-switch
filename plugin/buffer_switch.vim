" --------------------------------
"  Variable (s)
" --------------------------------
if !exists('g:buffer_switch_not_in_filetype')
	let g:buffer_switch_not_in_filetype = ['nerdtree', 'tagbar', 'qf']
endif

" --------------------------------
" Init
" --------------------------------
" Add the python plugin to the path (both Python2 and Python3 supported)
let script_path = expand('<sfile>:p:h') . '/buffer_switch.py'
if !has('python') && !has('python3')
   finish
endif

execute (has('python3') ? 'py3file' : 'pyfile') script_path

" --------------------------------
"  Function(s)
" --------------------------------
function! BufferSwitchNext()
	execute (has('python3') ? 'python3' : 'python') "buffer_switch_next()"
endfunc

function! BufferSwitchPrevious()
	execute (has('python3') ? 'python3' : 'python') "buffer_switch_previous()"
endfunc

function! BufferSwitchToIndex(idx)
	redir => l:buffer_list
	silent ls
	redir END

	let l:target_index = a:idx
	execute (has('python3') ? 'python3' : 'python') "buffer_switch_to_index()"
endfunc

" --------------------------------
"  Expose commands
" --------------------------------
command! BufferSwitchNext             call BufferSwitchNext()
command! BufferSwitchPrevious         call BufferSwitchPrevious()
command! -nargs=1 BufferSwitchToIndex call BufferSwitchToIndex(<q-args>)

" --------------------------------
"  Key mapping
" --------------------------------
nnoremap <tab>   :BufferSwitchNext<CR>
nnoremap <s-tab> :BufferSwitchPrevious<CR>
