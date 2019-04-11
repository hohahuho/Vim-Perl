let skip_defaults_vim=1

for s:path in split(glob($VIM.'/plugins/*'), '\n')
  if isdirectory(s:path)
    let &runtimepath = &runtimepath.','.s:path
  end
endfor
unlet s:path

for s:path in split(glob($VIM.'/plugins/*/after'), '\n')
  if isdirectory(s:path)
    let &runtimepath = &runtimepath.','.s:path
  end
endfor
unlet s:path

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

set nocompatible
colorscheme CL

set guifont     =Consolas:h11
set guifontwide =MingLiU:h11
set encoding    =utf-8
set t_Co        =256

set laststatus  =2
set statusline  =%<\ %F\ %r%m\ %=\ %y\ [%{&ff}]\ \ "

language messages en
source $VIMRUNTIME/delmenu.vim
source $VIMRUNTIME/menu.vim

set guioptions-=m " hide menu bar
set guioptions-=T " hide toolbar
set guioptions-=e " don't use gui tab apperance
set guioptions-=r " don't show scrollbars
set guioptions-=l " don't show scrollbars
set guioptions-=b " don't show scrollbars
set guioptions-=R " don't show scrollbars
set guioptions-=L " don't show scrollbars
au GUIEnter * simalt ~x

" Toggling the display of a widget
nnoremap <F5> :if &go=~#'m'<Bar>set go-=m<Bar>else<Bar>set go+=m<Bar>endif<CR>
nnoremap <F6> :if &go=~#'T'<Bar>set go-=T<Bar>else<Bar>set go+=T<Bar>endif<CR>
nnoremap <F7> :if &go=~#'r'<Bar>set go-=r<Bar>else<Bar>set go+=r<Bar>endif<CR>
nnoremap <F8> :if &go=~#'b'<Bar>set go-=b<Bar>else<Bar>set go+=b<Bar>endif<CR>
inoremap <F5> <C-C>:if &go=~#'m'<Bar>set go-=m<Bar>else<Bar>set go+=m<Bar>endif<CR>
inoremap <F6> <C-C>:if &go=~#'T'<Bar>set go-=T<Bar>else<Bar>set go+=T<Bar>endif<CR>
inoremap <F7> <C-C>:if &go=~#'r'<Bar>set go-=r<Bar>else<Bar>set go+=r<Bar>endif<CR>
inoremap <F8> <C-C>:if &go=~#'b'<Bar>set go-=b<Bar>else<Bar>set go+=b<Bar>endif<CR>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

set nobackup
set nowritebackup
set noswapfile
set noundofile
set hidden

set nu
set ruler
set showcmd

set hlsearch
set incsearch

set path+=**
set tags=./tags,tags;
set autochdir
set wildmenu
set wildmode=list:longest,full

set history   =10000
set undolevels=10000

"set undofile            " save undo's after file closes
"set undodir=$HOME/undo  " where to save undo histories

syntax on
filetype plugin indent on

" When editing a file, always jump to the last known cursor position.
"au BufReadPost *
"  \ if line("'\"") > 1 && line("'\"") <= line("$") |
"  \   exe "normal! g`\"" |
"  \ endif

" Disable beep and flash with an autocmd
set noerrorbells   visualbell t_vb=
au  GUIEnter * set visualbell t_vb=

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

set nowrap
set display=lastline
set sidescroll=1
set listchars=tab:\ \ ,extends:»,precedes:«
set list

set autoindent
set copyindent

set tabstop     =4
set softtabstop =4
set shiftwidth  =4  " tabs are 4 spaces wide (default = 8)
set expandtab       " Convert tabs to spaces

" Make tab ident code
noremap <tab>   >gv
noremap <s-tab> <gv

" Make cursor keys ignore wrapping
"inoremap <silent> <Down> <C-R>=pumvisible() ? "\<lt>Down>" : "\<lt>C-O>gj"<CR>
"inoremap <silent> <Up>   <C-R>=pumvisible() ? "\<lt>Up>"   : "\<lt>C-O>gk"<CR>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Moving cursor to other windows
nnoremap <C-Up>     :wincmd k<CR>
nnoremap <C-Down>   :wincmd j<CR>
nnoremap <C-Left>   :wincmd h<CR>
nnoremap <C-Right>  :wincmd l<CR>

" Moving windows around
nnoremap \<Up>      :wincmd K<CR>:wincmd =<CR>
nnoremap \<Down>    :wincmd J<CR>:wincmd =<CR>
nnoremap \<Left>    :wincmd H<CR>:wincmd =<CR>
nnoremap \<Right>   :wincmd L<CR>:wincmd =<CR>

" Window resizing
nnoremap <A-Up>     :res +1<CR>
nnoremap <A-Down>   :res -1<CR>
nnoremap <A-Left>   :vertical res -1<CR>
nnoremap <A-Right>  :vertical res +1<CR>

" Word motions (Remapping)
"  Original: { w=<S-Right> ; W=<C-Right> ; b=<S-Left> ; B=<C-Left> }
nnoremap w W
nnoremap b B
nnoremap e E
xnoremap w W
xnoremap b B
xnoremap B W
xnoremap W B
xnoremap e E

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

nnoremap <C-W>  :MBEbd!<CR>
nnoremap <S-W>  :qa!<CR>
nnoremap <C-N>  :enew<CR>

nnoremap <S-S>  :if &modifiable==1<BAR>sp<BAR>endif<CR>
nnoremap <S-V>  :if &modifiable==1<BAR>vs<BAR>endif<CR>
nnoremap <S-C>  :close<CR>

nnoremap <C-D>  :diffthis<CR>
nnoremap <S-D>  :diffoff<CR>

nnoremap <C-R>  :setl wrap<CR>
nnoremap <S-R>  :setl nowrap<CR>

nnoremap <S-M>  :noh<CR>
nnoremap <S-Y>  :reg *+:/<CR>
nnoremap <C-\>  :pop<CR>

" ColorColumn
nnoremap <C-H>  :let &colorcolumn=join(range(81 ,999),",")<C-LEFT><BS>
nnoremap <S-H>  :set  colorcolumn=<CR>

" Edit the file in visual selection
vnoremap <C-E>  gF

" View the file in different encodings
nnoremap <C-E>  :FencAutoDetect<CR>

" Search and replace in visual selection
xnoremap //     <ESC>/<C-R>=vis#VisBlockSearch()<CR>
xnoremap ??     <ESC>?<C-R>=vis#VisBlockSearch()<CR>
xnoremap <S-S>  :B s///<LEFT><LEFT>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

function! RelativenumberToggle()
  if(&relativenumber == 1)
    setl nornu
  else
    setl rnu
  endif
endfunc

" Relativenumber
nnoremap <C-Insert> :call RelativenumberToggle()<CR>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

augroup vimrc
  set foldlevelstart=20
  au BufReadPre  * setl foldmethod=indent
  au BufWinEnter * if &fdm == 'indent' | setl foldmethod=manual | endif
augroup END

" Folding
nnoremap <C-F> za
vnoremap <C-F> zf

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"set ssop=buffers,curdir,resize,winpos,winsize,tabpages
set ssop=buffers

" Autosave last session
nnoremap <C-Del> :mks! ./last.vim <CR>
nnoremap <S-Q>   :so   ./last.vim <CR>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" NOTE: bufgrep.vim
nnoremap <C-B>  :MBEOpen<CR>:execute 'vimgrep /'.expand(' ').'/j '.expand('%')<Bar>bel cw<C-LEFT><C-LEFT><C-LEFT><BS>
nnoremap <S-B>  :MBEOpen<CR>:Bgrep<space>
nnoremap gr     :MBEOpen<CR>:execute 'vimgrep /'.expand('<cword>').'/j **'          <Bar>bel cw<CR>
nnoremap gc     :MBEOpen<CR>:execute 'vimgrep /'.expand('<cword>').'/j '.expand('%')<Bar>bel cw<CR>
nnoremap gb     :MBEOpen<CR>:execute 'Bgrep '   .expand('<cword>')<CR>

" NOTE: showmarks.vim
let g:showmarks_include="abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ"
hi default ShowMarksHLl ctermfg=white ctermbg=black guifg=white guibg=black
hi default ShowMarksHLu ctermfg=white ctermbg=black guifg=white guibg=black
hi default ShowMarksHLo ctermfg=white ctermbg=black guifg=white guibg=black
hi default ShowMarksHLm ctermfg=black ctermbg=red   guifg=black guibg=red   cterm=bold  gui=bold
nnoremap <C-L>  :marks abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ<CR>
nnoremap <S-L>  :delmarks a-zA-Z<CR>
            \   :ShowMarksToggle<CR>
            \   :ShowMarksToggle<CR>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" NOTE: perl-support.vim
let g:Perl_Debugger = "ptkdb"
au FileType perl setlocal dictionary=$VIM/plugins/CL/perl.dict
au FileType perl  noremap <buffer> <silent> <S-F9>       :MBEOpen<CR>:call Perl_SyntaxCheck()<CR>
au FileType perl inoremap <buffer> <silent> <S-F9>  <C-C>:MBEOpen<CR>:call Perl_SyntaxCheck()<CR>
au FileType perl  noremap <buffer>          <S-F10>      :MBEOpen<CR>:PerlScriptArguments<Space>
au FileType perl inoremap <buffer>          <S-F10> <C-C>:MBEOpen<CR>:PerlScriptArguments<Space>
au FileType perl  noremap <buffer> <silent> <S-F11>      :MBEOpen<CR>:call Perl_Run()<CR>
au FileType perl inoremap <buffer> <silent> <S-F11> <C-C>:MBEOpen<CR>:call Perl_Run()<CR>
au FileType perl  noremap <buffer> <silent> <S-F12>      :MBEOpen<CR>:call Perl_Perlcritic()<CR>
au FileType perl inoremap <buffer> <silent> <S-F12> <C-C>:MBEOpen<CR>:call Perl_Perlcritic()<CR>
au FileType perl  noremap <buffer> <silent> <C-BS>       :call Perl_Debugger()<CR>
au FileType perl inoremap <buffer> <silent> <C-BS>  <C-C>:call Perl_Debugger()<CR>

" Perl Run - for Windows
let g:Perl_OutputGvim = "buffer"

" Include pod.vim syntax file with perl.vim
let perl_include_pod = 1

" Highlight complex expressions such as @{[$x, $y]}
let perl_extended_vars = 1

" Perl-Tidy
au FileType perl nnoremap <buffer> <F12>
\   :let line = line(".")<Bar>
\   :let cols = col (".")<Bar>
\   :execute '%!perl "'.$VIM.'/plugins/CL/PerlTidy.pl" -nolq -nolc -nokw -l=120'<CR>
\   :cal cursor ( line, cols )<CR>
au FileType perl inoremap <buffer> <F12>
\   <C-C>:let line = line(".")<Bar>
\   :let cols = col (".")<Bar>
\   :execute '%!perl "'.$VIM.'/plugins/CL/PerlTidy.pl" -nolq -nolc -nokw -l=120'<CR>
\   :cal cursor ( line, cols )<CR>
au FileType perl vnoremap <buffer> <F12>
\   :<C-U>execute '''<,''>!perl "'.$VIM.'/plugins/CL/PerlTidy.pl" -nolq -nolc -nokw -l=120'<CR>

" XXX: 'c:\Program Files\Vim\vim74\ftplugin\perl.vim'
"let perlpath="c:/Perl/site/lib,c:/Perl/lib,,"

" XXX: for 'perldo' command
au VimEnter * :perl $_=$^V

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" NOTE: NERD_tree.vim
let g:NERDTreeStatusline = ' '
let g:NERDTreeWinPos    = 'left'
let g:NERDTreeWinSize   = 30
let g:NERDTreeDirArrows = 1
let g:NERDTreeShowBookmarks = 1
nnoremap <F2> :UndotreeHide<CR>:TagbarClose<CR>:NERDTreeToggle<CR>
nnoremap <F9> :UndotreeHide<CR>:TagbarClose<CR>:NERDTreeToggle<CR>
inoremap <F2> <C-C>:UndotreeHide<CR>:TagbarClose<CR>:NERDTreeToggle<CR>
inoremap <F9> <C-C>:UndotreeHide<CR>:TagbarClose<CR>:NERDTreeToggle<CR>

" NOTE: tagbar.vim
let g:tagbar_left   = 1
let g:tagbar_width  = 30
let g:tagbar_sort   = 0
let g:tagbar_iconchars  = ['▸', '▾']
let g:tagbar_ctags_bin  = 'ctags.exe'
nnoremap <F4>  :UndotreeHide<CR>:NERDTreeClose<CR>:TagbarToggle<CR>
nnoremap <F11> :UndotreeHide<CR>:NERDTreeClose<CR>:TagbarToggle<CR>
inoremap <F4>  <C-C>:UndotreeHide<CR>:NERDTreeClose<CR>:TagbarToggle<CR>
inoremap <F11> <C-C>:UndotreeHide<CR>:NERDTreeClose<CR>:TagbarToggle<CR>
" Set tagbar_ignore -> for ctags
au BufReadPre,BufNewFile *  let b:tagbar_ignore = 1
au FileType perl,c,cpp,vim  let b:tagbar_ignore = 0

" NOTE: undotree.vim
let g:undotree_WindowLayout     = 1
let g:undotree_SplitWidth       = 30
let g:undotree_DiffpanelHeight  = 10
let g:undotree_HighlightChangedText     = 0
let g:undotree_HighlightChangedWithSign = 0
nnoremap <S-E> :TagbarClose<CR>:NERDTreeClose<CR>:UndotreeToggle<CR>

" NOTE: minibufexpl.vim
let g:miniBufExplStatusLineText = '\ '
let g:miniBufExplCycleArround   = 1
let g:miniBufExplUseSingleClick = 1
let g:miniBufExplShowBufNumbers = 1
let g:miniBufExplSplitToEdge    = 0
let g:miniBufExplTabWrap        = 1
let g:miniBufExplHideWhenDiff   = 1
nnoremap <F3>      :MBEToggle<CR>
nnoremap <F10>     :MBEToggle<CR>
inoremap <F3>      <C-C>:MBEToggle<CR>
inoremap <F10>     <C-C>:MBEToggle<CR>
nnoremap <C-TAB>   :MBEbn<CR>
nnoremap <C-S-TAB> :MBEbp<CR>
nnoremap <TAB>     :MBEbn<CR>
nnoremap <S-TAB>   :MBEbp<CR>
nnoremap <C-PageDown>   :MBEbn<CR>
nnoremap <C-PageUp>     :MBEbp<CR>

" NOTE: ctrlp.vim
au VimEnter * nnoremap <C-P> :CtrlPBuffer<CR>
let g:ctrlp_user_command = 'pt %s -l --nocolor -g "" ""'
let g:ctrlp_match_window = 'bottom,order:btt,min:1,max:30,results:30'
let g:ctrlp_use_caching  = 1
let g:ctrlp_clear_cache_on_exit = 0
let g:ctrlp_open_multiple_files = '1r'
let g:ctrlp_follow_symlinks = 1
let g:ctrlp_show_hidden     = 1
let g:ctrlp_regexp          = 0
let g:ctrlp_prompt_mappings = {
    \ 'PrtSelectMove("t")':   [],
    \ 'PrtSelectMove("b")':   [],
    \ 'AcceptSelection("t")': [],
    \ 'AcceptSelection("h")': [],
    \ 'AcceptSelection("v")': [],
    \ 'AcceptSelection("e")': ['<cr>', '<2-LeftMouse>'],
    \ 'PrtExit()':            ['<c-c>', '<esc>'],
\
    \ 'PrtCurStart()':        ['<Home>'],
    \ 'PrtCurEnd()':          ['<End>'],
    \ 'PrtDeleteWord()':      ['<c-z>'],
    \ 'PrtInsert("c")':       ['<c-v>', '<insert>', '<MiddleMouse>'],
    \ 'PrtInsert()':          ['<c-x>'],
\
    \ 'PrtHistory(1)':        ['<c-up>'],
    \ 'PrtHistory(-1)':       ['<c-down>'],
    \ 'ToggleType(1)':        ['<c-right>'],
    \ 'ToggleType(-1)':       ['<c-left>'],
\
    \ 'PrtClearCache()':      ['<F5>'],
    \ 'MarkToOpen()':         ['<c-a>'],
    \ 'OpenMulti()':          ['<c-g>', '<c-o>'],
\ }

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" NOTE: EasyMotion.vim
let g:EasyMotion_smartcase   = 1
let g:EasyMotion_startofline = 0
nmap , <Plug>(easymotion-sn)
nmap s <Plug>(easymotion-overwin-f2)
nmap f <Plug>(easymotion-fl)
nmap F <Plug>(easymotion-Fl)
nmap t <Plug>(easymotion-tl)
nmap T <Plug>(easymotion-Tl)

" NOTE: easy_align.vim
let g:easy_align_bypass_fold = 1
vmap <C-Z> <Plug>(EasyAlign)

" NOTE: vim-schlepp
set virtualedit=block
vmap <unique> <A-Up>    <Plug>SchleppUp
vmap <unique> <A-Down>  <Plug>SchleppDown
vmap <unique> <A-Left>  <Plug>SchleppLeft
vmap <unique> <A-Right> <Plug>SchleppRight
vmap <unique> \<Up>     <S-V><Plug>SchleppDupUp
vmap <unique> \<Down>   <S-V><Plug>SchleppDupDown
vmap <unique> \<Left>   <C-Q><Plug>SchleppDupLeft
vmap <unique> \<Right>  <C-Q><Plug>SchleppDupRight

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" NOTE: neocomplete.vim
let g:acp_enableAtStartup                       = 0 " Disable AutoComplPop.
let g:neocomplete#enable_auto_select            = 0 " Disable AutoComplPop like behavior.
let g:neocomplete#enable_at_startup             = 1 " Use neocomplete.
let g:neocomplete#enable_ignore_case            = 1 " Use ignorecase.
let g:neocomplete#enable_smart_case             = 1 " Use smartcase.
let g:neocomplete#auto_completion_start_length  = 2
let g:neocomplete#min_keyword_length            = 3
"let g:neocomplete#lock_buffer_name_pattern      = '\.lib\|\.sdc\|\.sdf\|\.gdt'
set completeopt-=preview
set omnifunc=syntaxcomplete#Complete

" Recommended key-mappings.
" <CR>: close popup and save indent.
inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
function! s:my_cr_function()
  " For no inserting <CR> key.
  return pumvisible() ? neocomplete#close_popup() : "\<CR>"
endfunction
" <TAB>: completion.
inoremap <expr><TAB>    pumvisible() ? "\<C-n>" : "\<TAB>"
inoremap <expr><S-TAB>  pumvisible() ? "\<C-p>" : "\<C-V>\<TAB>"

" Close neocomplete when handle large file.
let g:LargeFile = 1024*1024*10
au BufReadPre *
  \ let f=expand("<afile>") |
  \ if getfsize(f) > g:LargeFile |
  \   :NeoCompleteLock |
  \ endif

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" NOTE: ctrlsf.vim
"let g:ctrlsf_ackprg = 'ag'
let g:ctrlsf_ackprg = 'pt'
let g:ctrlsf_position = 'right'
let g:ctrlsf_winsize  = '40%'
let g:ctrlsf_case_sensitive = 'yes'
let g:ctrlsf_regex_pattern  = 1
let g:ctrlsf_auto_close   = 0
let g:ctrlsf_confirm_save = 0
nnoremap <S-Space> :MBEOpen<CR>:CtrlSF<space>

" NOTE: fzf.vim
autocmd! FileType fzf
autocmd  FileType fzf          set laststatus=0 noshowmode noruler
  \| autocmd BufLeave <buffer> set laststatus=2 showmode ruler
nnoremap <S-Enter> :MBEOpen<CR>:FZF<space>
nnoremap <C-Enter> :MBEOpen<CR>:FZF<CR>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

function! s:inform(name) abort
  echomsg printf(
        \ "%-12s %%: %s [%d], <afile>: %s [%d]",
        \ a:name,
        \ bufname('%'), bufnr('%'),
        \ bufname(expand('<afile>')), bufnr(expand('<afile>')),
        \)
endfunction

function! s:enable(names) abort
  augroup autocmd_order_test
    autocmd! *
    for name in a:names
      execute printf('autocmd %s * call s:inform(''%s'')', name, name)
    endfor
  augroup END
endfunction

function! s:disable() abort
  augroup autocmd_order_test
    autocmd! *
  augroup END
endfunction

command! AutocmdOrderTestDisable call s:disable()
command! AutocmdOrderTestEnable  call s:enable([
      \ 'BufAdd',
      \ 'BufDelete',
      \ 'BufEnter',
      \ 'BufHidden',
      \ 'BufLeave',
      \ 'BufNew',
      \ 'BufRead',
      \ 'BufReadPre',
      \ 'BufUnload',
      \ 'BufWinEnter',
      \ 'BufWinLeave',
      \ 'BufWipeout',
      \ 'BufWrite',
      \ 'BufWritePost',
      \ 'QuitPre',
      \ 'WinEnter',
      \ 'WinLeave',
      \])

