" BufPos:  Activate a buffer by its position number in the buffers
"          list
" Author:  Michele Campeotto <michele@campeotto.net>
" Date:    2007-04-25
" Version: 1.0
"
" This script provides a function to activate a vim buffer by passing it the
" position in the buffers list and maps it to <M-number> to easily switch
" between open buffers.
"
" This is best used togheter with the buftabs plugin:
"   http://www.vim.org/scripts/script.php?script_id=1664

if exists('g:bufpos_loaded')
    finish
endif
let g:bufpos_loaded = 1

function! BufPos_ActivateBuffer(num)
    if getbufvar( bufnr('%'), "&modifiable" ) == 0
        return
    endif

    let l:count = 1
    "for i in range(1, bufnr("$"))
    for i in g:BufList
        if buflisted(i) && getbufvar(i, "&modifiable")
            if l:count == a:num
                exe "buffer " . i
                return
            endif
            let l:count = l:count + 1
        endif
    endfor
    echo "No buffer!"
endfunction

function! BufPos_Initialize()
    for i in range(1, 9)
        exe "map <M-" . i . "> :call BufPos_ActivateBuffer(" . i . ")<CR>"
    endfor
    exe "map <M-0> :call BufPos_ActivateBuffer(10)<CR>"
endfunction

autocmd VimEnter * call BufPos_Initialize()


" Mappings and Commands
if ! hasmapto('1') || !hasmapto('<M-1>')
      "gui bindings containing META key, are different from terminal bindings
      if has('gui_running')
            "NORMAL mode bindings for gvim
            noremap <unique> <script> <M-1> :call BufPos_ActivateBuffer( 1)<CR>:<BS>
            noremap <unique> <script> <M-2> :call BufPos_ActivateBuffer( 2)<CR>:<BS>
            noremap <unique> <script> <M-3> :call BufPos_ActivateBuffer( 3)<CR>:<BS>
            noremap <unique> <script> <M-4> :call BufPos_ActivateBuffer( 4)<CR>:<BS>
            noremap <unique> <script> <M-5> :call BufPos_ActivateBuffer( 5)<CR>:<BS>
            noremap <unique> <script> <M-6> :call BufPos_ActivateBuffer( 6)<CR>:<BS>
            noremap <unique> <script> <M-7> :call BufPos_ActivateBuffer( 7)<CR>:<BS>
            noremap <unique> <script> <M-8> :call BufPos_ActivateBuffer( 8)<CR>:<BS>
            noremap <unique> <script> <M-9> :call BufPos_ActivateBuffer( 9)<CR>:<BS>
            noremap <unique> <script> <M-0> :call BufPos_ActivateBuffer( 10)<CR>:<BS>
            "INSERT mode bindings for gvim
            inoremap <unique> <script> <M-1> <esc>:call BufPos_ActivateBuffer( 1)<CR>:<BS>a
            inoremap <unique> <script> <M-2> <esc>:call BufPos_ActivateBuffer( 2)<CR>:<BS>a
            inoremap <unique> <script> <M-3> <esc>:call BufPos_ActivateBuffer( 3)<CR>:<BS>a
            inoremap <unique> <script> <M-4> <esc>:call BufPos_ActivateBuffer( 4)<CR>:<BS>a
            inoremap <unique> <script> <M-5> <esc>:call BufPos_ActivateBuffer( 5)<CR>:<BS>a
            inoremap <unique> <script> <M-6> <esc>:call BufPos_ActivateBuffer( 6)<CR>:<BS>a
            inoremap <unique> <script> <M-7> <esc>:call BufPos_ActivateBuffer( 7)<CR>:<BS>a
            inoremap <unique> <script> <M-8> <esc>:call BufPos_ActivateBuffer( 8)<CR>:<BS>a
            inoremap <unique> <script> <M-9> <esc>:call BufPos_ActivateBuffer( 9)<CR>:<BS>a
            inoremap <unique> <script> <M-0> <esc>:call BufPos_ActivateBuffer( 10)<CR>:<BS>a
      else
            "NORMAL mode bindings for vim( dos32 )
            noremap <unique> <script> ± :call BufPos_ActivateBuffer( 1)<CR>:<BS>
            noremap <unique> <script> ² :call BufPos_ActivateBuffer( 2)<CR>:<BS>
            noremap <unique> <script> ³ :call BufPos_ActivateBuffer( 3)<CR>:<BS>
            noremap <unique> <script> ´ :call BufPos_ActivateBuffer( 4)<CR>:<BS>
            noremap <unique> <script> µ :call BufPos_ActivateBuffer( 5)<CR>:<BS>
            noremap <unique> <script> ¶ :call BufPos_ActivateBuffer( 6)<CR>:<BS>
            noremap <unique> <script> · :call BufPos_ActivateBuffer( 7)<CR>:<BS>
            noremap <unique> <script> ¸ :call BufPos_ActivateBuffer( 8)<CR>:<BS>
            noremap <unique> <script> ¹ :call BufPos_ActivateBuffer( 9)<CR>:<BS>
            noremap <unique> <script> ° :call BufPos_ActivateBuffer( 10)<CR>:<BS>
      "else
            "NORMAL mode bindings for vim( terminal)
            noremap <unique> <script> 1 :call BufPos_ActivateBuffer( 1)<CR>:<BS>
            noremap <unique> <script> 2 :call BufPos_ActivateBuffer( 2)<CR>:<BS>
            noremap <unique> <script> 3 :call BufPos_ActivateBuffer( 3)<CR>:<BS>
            noremap <unique> <script> 4 :call BufPos_ActivateBuffer( 4)<CR>:<BS>
            noremap <unique> <script> 5 :call BufPos_ActivateBuffer( 5)<CR>:<BS>
            noremap <unique> <script> 6 :call BufPos_ActivateBuffer( 6)<CR>:<BS>
            noremap <unique> <script> 7 :call BufPos_ActivateBuffer( 7)<CR>:<BS>
            noremap <unique> <script> 8 :call BufPos_ActivateBuffer( 8)<CR>:<BS>
            noremap <unique> <script> 9 :call BufPos_ActivateBuffer( 9)<CR>:<BS>
            noremap <unique> <script> 0 :call BufPos_ActivateBuffer( 10)<CR>:<BS>
            "INSERT mode bindings for vim( terminal)
            inoremap <unique> <script> 1 <esc>:call BufPos_ActivateBuffer( 1)<CR>:<BS>a
            inoremap <unique> <script> 2 <esc>:call BufPos_ActivateBuffer( 2)<CR>:<BS>a
            inoremap <unique> <script> 3 <esc>:call BufPos_ActivateBuffer( 3)<CR>:<BS>a
            inoremap <unique> <script> 4 <esc>:call BufPos_ActivateBuffer( 4)<CR>:<BS>a
            inoremap <unique> <script> 5 <esc>:call BufPos_ActivateBuffer( 5)<CR>:<BS>a
            inoremap <unique> <script> 6 <esc>:call BufPos_ActivateBuffer( 6)<CR>:<BS>a
            inoremap <unique> <script> 7 <esc>:call BufPos_ActivateBuffer( 7)<CR>:<BS>a
            inoremap <unique> <script> 8 <esc>:call BufPos_ActivateBuffer( 8)<CR>:<BS>a
            inoremap <unique> <script> 9 <esc>:call BufPos_ActivateBuffer( 9)<CR>:<BS>a
            inoremap <unique> <script> 0 <esc>:call BufPos_ActivateBuffer( 10)<CR>:<BS>a
      endif
endif " %%

