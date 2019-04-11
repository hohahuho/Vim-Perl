" darkZ 1.1 (Vim color file)
" Create by ☆andy☆
" NOTE: modified by Chih-Long  ... 2019-03-07

if version > 580
  hi clear
  if exists("syntax_on")
    syntax reset
  endif
endif

set background=dark
let g:colors_name="CL"

hi ColorColumn  gui=NONE    guibg=#111111
hi Comment      gui=NONE                        guifg=LIGHTSLATEGRAY
hi Constant     gui=NONE                        guifg=#FF77FF
hi Cursor       gui=NONE    guibg=YELLOW        guifg=BLACK
hi CursorColumn gui=NONE    guibg=NONE
hi CursorLine   gui=NONE    guibg=NONE
hi DiffAdd      gui=NONE    guibg=WHEAT1        guifg=BLACK
hi DiffChange   gui=NONE    guibg=SKYBLUE1      guifg=BLACK
hi DiffDelete   gui=NONE    guibg=GRAY45        guifg=BLACK
hi DiffText     gui=NONE    guibg=HOTPINK1      guifg=BLACK
hi ErrorMsg     gui=NONE    guibg=RED           guifg=WHITE
hi FoldColumn   gui=BOLD    guibg=GRAY16        guifg=DODGERBLUE
hi Folded       gui=BOLD    guibg=DODGERBLUE4   guifg=LIGHTCYAN
hi Function     gui=NONE                        guifg=#82EF2A
hi Identifier   gui=NONE                        guifg=#6FDEF8
hi Ignore       gui=NONE                        guifg=RED
hi IncSearch    gui=BOLD    guibg=MINTCREAM     guifg=RED
hi LineNr       gui=NONE    guibg=GRAY9         guifg=LIGHTSKYBLUE3
hi MatchParen   gui=BOLD    guibg=ORANGE2       guifg=BLACK
hi ModeMsg      gui=BOLD    guibg=BLACK         guifg=WHITE
hi MoreMsg      gui=NONE                        guifg=SEAGREEN
hi NonText      gui=NONE                        guifg=CYAN
hi Normal       gui=NONE    guibg=BLACK         guifg=GHOSTWHITE
hi Pmenu        gui=NONE    guibg=#445599       guifg=WHITE
hi PmenuSel     gui=NONE    guibg=GRAY          guifg=#445599
hi PreProc      gui=NONE                        guifg=#82EF2A
hi Question     gui=NONE                        guifg=SPRINGGREEN
hi Search       gui=BOLD    guibg=RED           guifg=MINTCREAM
hi SignColumn   gui=NONE    guibg=GRAY10
hi Special      gui=NONE                        guifg=ORANGE
hi SpecialKey   gui=NONE                        guifg=CYAN
hi Statement    gui=NONE                        guifg=#FCFC63
hi StatusLine   gui=BOLD    guibg=GRAY9         guifg=WHITE
hi StatusLineNC gui=NONE    guibg=GRAY9         guifg=WHITE
hi Title        gui=NONE                        guifg=#FF4400
hi Todo         gui=BOLD    guibg=YELLOW2       guifg=RED
hi Type         gui=NONE                        guifg=#33AFF3
hi VertSplit    gui=NONE    guibg=GRAY9         guifg=GRAY9
hi Visual       gui=BOLD    guibg=LIGHTGREEN    guifg=BLACK
hi WarningMsg   gui=NONE                        guifg=SALMON
hi WildMenu     gui=BOLD    guibg=YELLOW2       guifg=BLACK
