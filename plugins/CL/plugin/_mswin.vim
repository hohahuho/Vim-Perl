" NOTE: Set options and add mapping such that Vim behaves a lot like MS-Windows

if exists('g:CL_mswin')
  finish
endif
let g:CL_mswin = 1

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Set 'selection', 'selectmode', 'mousemodel' and 'keymodel' for MS-Windows
behave mswin

" Backspace and cursor keys wrap to previous/next line
set backspace=indent,eol,start whichwrap+=<,>,[,]

" Backspace in Visual mode deletes selection
vnoremap <BS>   d

" CTRL-Y is Redo
nnoremap <C-Y>  <C-R>
inoremap <C-Y>  <C-O><C-R>

" CTRL-Z is Undo
cnoremap <C-Z>  <C-U>
nnoremap <C-Z>  u
inoremap <C-Z>  <C-O>u

" CTRL-X is Cut
vnoremap <C-X>  "+x

" CTRL-C is Copy
cnoremap <C-C>  <C-Y>
snoremap <C-C>  <C-O>"+y
xnoremap <C-C>  "+y

" CTRL-V is Paste
cnoremap <C-V>  <C-R>+
nnoremap <C-V>  "+gP
inoremap <C-V>  <C-R><C-O>+
snoremap <C-V>  <C-O>s<C-R><C-O>+
xnoremap <C-V>  s<C-R><C-O>+

" CTRL-A is Select all
nnoremap <C-A>  gggH<C-O>G
inoremap <C-A>  <C-O>gg<C-O>gH<C-O>G
snoremap <C-A>  <C-C>gggH<C-O>G
xnoremap <C-A>  <C-C>ggVG

" CTRL-S is Saving
nnoremap <C-S>  :update<CR>
inoremap <C-S>  <C-O>:update<CR>

" Use CTRL-Q to do what CTRL-V used to do
 noremap <C-Q>  <C-V>

" Remap 'Insert' key in Visual mode
vnoremap <Insert>   <S-I>
vnoremap <C-Insert> <S-A>

" SHIFT-Insert (ctrl-v)
cnoremap <S-Insert>     <C-R>+
nnoremap <S-Insert>     "+gP
inoremap <S-Insert>     <C-R><C-O>+
snoremap <S-Insert>     <C-O>s<C-R><C-O>+
xnoremap <S-Insert>     s<C-R><C-O>+

" CTRL-SHIFT-Insert (middle mouse button)
cnoremap <C-S-Insert>   <C-R>*
nnoremap <C-S-Insert>   "*gP
inoremap <C-S-Insert>   <C-R><C-O>*
snoremap <C-S-Insert>   <C-O>s<C-R><C-O>*
xnoremap <C-S-Insert>   s<C-R><C-O>*

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Enable mouse use in all modes
set mouse=a

" Easy block selection with mouse (in Visual mode)
 noremap <M-LeftMouse>  <4-LeftMouse><C-O>
inoremap <M-LeftMouse>  <4-LeftMouse><C-O>
 noremap <M-LeftDrag>   <LeftDrag>
inoremap <M-LeftDrag>   <LeftDrag>

" Press right mouse button to switch back Visual mode
snoremap <RightMouse>   <C-G>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" NOTE: https://github.com/derekmcloughlin/gvimfullscreen_win32

" Switch fullscreen / normal size
nnoremap <C-F11> :call libcallnr("gvimfullscreen.dll","ToggleFullScreen",0)<CR>

