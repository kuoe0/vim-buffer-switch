" --------------------------------
" Add our plugin to the path
" --------------------------------
python import sys
python import vim
python sys.path.append(vim.eval('expand("<sfile>:h")'))

" --------------------------------
"  Variable (s)
" --------------------------------
if !exists('g:buffer_switch_not_in_filetype')
	let g:buffer_switch_not_in_filetype = ['nerdtree', 'tagbar', 'qf']
endif

" --------------------------------
"  Function(s)
" --------------------------------
if has('python')
    function! BufferSwitchNext()
        python from buffer_switch import buffer_switch_next
        python buffer_switch_next()
    endfunc

    function! BufferSwitchPrevious()
        python from buffer_switch import buffer_switch_previous
        python buffer_switch_previous()
    endfunc

    function! BufferSwitchToIndex(idx)
        python from buffer_switch import buffer_switch_to_index

        redir => l:buffer_list
        silent ls
        redir END

        let l:target_index = a:idx
        python buffer_switch_to_index()
    endfunc
elseif has('python3')

endif

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
