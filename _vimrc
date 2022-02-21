g:let mapleader = ","
source $VIMRUNTIME/vimrc_example.vim

" Vim with all enhancements

## ignore list

set wildignore+=statics\\**,\node_modules\**,\dist\**,gulp-modules\\**,deployment\\**,build\\**,cdn\\**,codeguide\\**,out\\**,tomcat\\**,tools\\**,wallaby\\**,\\tmp\\
set wildignore+=*.zip,*.exe,*.swp,*.png,*.jpg,*.gif
set wildignore+=*.githooks*,*.gradle*,*.npm-scripts*,*.settings*,*.vscode*,*bin*,*build*,*codeguide*,*deployment*,*dist*,*gradle*,*gulp-modules*,*localdev*,*node_modules*,*npm-scripts*,*out*,*tomcat*,*tools*,*wallaby*,*statics*,*statics*

source $VIMRUNTIME/vimrc_example.vim

## General
set t_Co=256 # sets the number of colours
##set encoding = utf-8
set number	# Show line numbers
set relativenumber # Use relative line numbers
set linebreak	# Break lines at word (requires Wrap lines)
set showbreak=+++	# Wrap-broken line prefix
set textwidth=100	# Line wrap (number of cols)
set showmatch	# Highlight matching brace
set visualbell	# Use visual bell (no beeping)
 
set hlsearch	# Highlight all search results
set smartcase	# Enable smart-case search
set ignorecase	# Always case-insensitive
set incsearch	# Searches for strings incrementally
 
set autoindent	# Auto-indent new lines
set shiftwidth=2	# Number of auto-indent spaces
set smartindent	# Enable smart-indent
set smarttab	# Enable smart-tabs
set softtabstop=2	# Number of spaces per Tab
set nowrap

"set backupdir=c:\\vimTmp
"set directory=c:\\vimTmp
"set undodir=c:\\vimTmp

set foldmethod=indent
set foldnestmax=10
set nofoldenable
set foldlevel=2   

## Advanced
set ruler	# Show row and column ruler information
 
set undolevels=1000	# Number of undo levels
set backspace=indent,eol,start	# Backspace behaviour

"UI 
set autochdir
set tabstop=2 softtabstop=0 expandtab shiftwidth=2 smarttab

syntax on

set statusline+=%F
set statusline+=%#warningmsg#
"set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
set diffexpr=MyDiff()


"Search options
set ignorecase
set smartcase

"Performance
set lazyredraw

"Asthetics
"set colorscheme=pablo
"higlight DiffAdd ctermbg=darggreen ctermfg=lightgreen
"higlight DiffChange ctermbg=darkBlue ctermfg=white
"higlight DiffDelete ctermbg=darkred ctermfg=yellow

:hi Folded ctermbg=darkblue
:hi Folded ctermfg=grey

set packpath+=~\.vim\pack

set undodir=c:\\vimTmp
set backupdir=c:\\vimTmp
set directory=c:\\vimTmp

## netrw file browser plugin built-built in nerdtree replacement 
"let g:netrw_banner = 0
"let g:netrw_liststyle = 3
"let g:netrw_browse_split = 4
"let g:netrw_altv = 1
"let g:netrw_winsize = 25
"augroup ProjectDrawer
"  autocmd!
"  autocmd VimEnter * :Vexplore
"augroup END

## Plugins

## Indentline

let g:indentLine_fileTypeExclude = ["vimwiki","help","undotree","diff","md"]
let g:indentLine_bufTypeNameExclude = ["help","terminal"]
let g:indentLine_bufNameExclude = []

## Indentline conceal settings
let g:indentLine_setConceal = 1
let g:indentLine_concealcursor = 'inc'
let g:indentLine_conceallevel = 2

## colour and style

let g:indentLine_color_term = 6 
let g:indentLine_char = '¦'
## let g:indentLine_char_list = ['|', '¦']
let g:indentLine_first_char = '|'
let g:indentLine_leadingSpaceEnabled = 1
let g:indentLine_leadingSpaceChar = '·'

## fix hidden quotes in json
## let g:vim_json_syntax_conceal = 0 


## Syntastic
## Syntax highlighting
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

## Airline
## Improved status bar

let g:airline#extensions#tabline#formatter = 'unique_tail'

set tags=tags;/

"Shell
"set shell=C://WINDOWS//sysnative//WindowsPowerShell//v1.0//powershell.exe"

if has("win32") || has("gui_win32")
     if executable("PowerShell")
        " Set PowerShell as the shell for running external ! commands
        " http://stackoverflow.com/questions/7605917/system-with-powershell-in-vim
        set shell=powershell.exe\ -ExecutionPolicy\ Unrestricted
        set shellcmdflag=-Command
        set shellquote=\"
        " shellxquote must be a literal space character.
        set shellxquote=
   endif
endif

"Gitgutter 

let g:gitgutter_highlight_lines = 0


"Numbers

"let g:numbers_exclude = ['tagbar', 'gundo', 'minibufexpl', 'nerdtree']
let g:numbers_exclude = ['tagbar', 'gundo', 'minibufexpl']

"Syntastic

"let g:syntastic_always_populate_loc_list = 1
"let g:syntastic_auto_loc_list = 1
"let g:syntastic_check_on_open = 1
"let g:syntastic_check_on_wq = 0

"Misc

" activates filetype detection
filetype plugin indent on

" allows you to deal with multiple unsaved
" buffers simultaneously without resorting
" to misusing tabs
set hidden

" just hit backspace without this one and
" see for yourself
set backspace=indent,eol,start

"CtrlP


## CtrlP 

" Ignore some folders and files for CtrlP indexing
" let g:ctrlp_custom_ignore = {
"  \ 'dir':  '\node_modules\|\.git$\|\.yardoc\|public$|log\|tmp$',
"  \ 'file': '\.so$\|\.dat$|\.DS_Store$'
"  \ }
"let g:ctrlp_custom_ignore += 'node_modules'


let g:ctrlp_user_command = ['.git/', 'git --git-dir=%s/.git ls-files -oc --exclude-standard']
let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn)$'
let g:ctrlp_working_path_mode='ra'
let g:ctrlp_cmd = 'CtrlPMixed'
"let g:ctrlp_working_path_mode = 0
let g:ctrlp_match_window = 'bottom,order:btt,min:1,max:20,results:20'
"let g:ctrlp_cache_dir = $HOME.'/.vim/cache/ctrlp'
let g:ctrlp_switch_buffer = 'e'
let g:ctrlp_open_new_file = 'r'
let g:ctrlp_clear_cache_on_exit = 0
let g:ctrlp_max_files = 10000

"emmet stuff"
let g:user_emmet_leader_key=',,'

"tags
"let g:tagbar_ctags_bin=C://ProgramData//chocolatey//lib//universal-ctags//tools/ctags.exe
"set tags+=tags,.\\tags,C:\\_home\\elysium\\elysium\\elysium\\tags
set tags=./tags;

"Nerdtree
" enable line numbers
let NERDTreeShowLineNumbers=1
" make sure relative line numbers are used
autocmd FileType nerdtree setlocal relativenumber
"Nerdtree config for wildignore
let NERDTreeRespectWildIgnore=1

set showmatch


" Use the internal diff if available.
" Otherwise use the special 'diffexpr' for Windows.
if &diffopt !~# 'internal'
  set diffexpr=MyDiff()
endif

function MyDiff()
  let opt = '-a --binary '
  if &diffopt =~ 'icase' | let opt = opt . '-i ' | endif
  if &diffopt =~ 'iwhite' | let opt = opt . '-b ' | endif
  let arg1 = v:fname_in
  if arg1 =~ ' ' | let arg1 = '"' . arg1 . '"' | endif
  let arg1 = substitute(arg1, '!', '\!', 'g')
  let arg2 = v:fname_new
  if arg2 =~ ' ' | let arg2 = '"' . arg2 . '"' | endif
  let arg2 = substitute(arg2, '!', '\!', 'g')
  let arg3 = v:fname_out
  if arg3 =~ ' ' | let arg3 = '"' . arg3 . '"' | endif
  let arg3 = substitute(arg3, '!', '\!', 'g')
  if $VIMRUNTIME =~ ' '
    if &sh =~ '\<cmd'
      if empty(&shellxquote)
        let l:shxq_sav = ''
        set shellxquote&
      endif
      let cmd = '"' . $VIMRUNTIME . '\diff"'
    else
      let cmd = substitute($VIMRUNTIME, ' ', '" ', '') . '\diff"'
    endif
  else
    let cmd = $VIMRUNTIME . '\diff'
  endif
  let cmd = substitute(cmd, '!', '\!', 'g')
  silent execute '!' . cmd . ' ' . opt . arg1 . ' ' . arg2 . ' > ' . arg3
  if exists('l:shxq_sav')
    let &shellxquote=l:shxq_sav
  endif
endfunction

" vim-airline template by chartoin (http://github.com/chartoin)
" Base 16 Eighties Scheme by Chris Kempson (http://chriskempson.com)
let g:airline#themes#base16_eighties#palette = {}
let s:gui00 = "#2d2d2d"
let s:gui01 = "#393939"
let s:gui02 = "#515151"
let s:gui03 = "#747369"
let s:gui04 = "#a09f93"
let s:gui05 = "#d3d0c8"
let s:gui06 = "#e8e6df"
let s:gui07 = "#f2f0ec"
let s:gui08 = "#f2777a"
let s:gui09 = "#f99157"
let s:gui0A = "#ffcc66"
let s:gui0B = "#99cc99"
let s:gui0C = "#66cccc"
let s:gui0D = "#6699cc"
let s:gui0E = "#cc99cc"
let s:gui0F = "#d27b53"

let s:cterm00 = 236
let s:cterm01 = 237
let s:cterm02 = 239
let s:cterm03 = 95
let s:cterm04 = 144
let s:cterm05 = 188
let s:cterm06 = 188
let s:cterm07 = 15
let s:cterm08 = 210
let s:cterm09 = 209
let s:cterm0A = 221
let s:cterm0B = 114
let s:cterm0C = 80
let s:cterm0D = 68
let s:cterm0E = 176
let s:cterm0F = 173

let s:N1   = [ s:gui01, s:gui0B, s:cterm01, s:cterm0B ]
let s:N2   = [ s:gui06, s:gui02, s:cterm06, s:cterm02 ]
let s:N3   = [ s:gui09, s:gui01, s:cterm09, s:cterm01 ]
let g:airline#themes#base16_eighties#palette.normal = airline#themes#generate_color_map(s:N1, s:N2, s:N3)

let s:I1   = [ s:gui01, s:gui0D, s:cterm01, s:cterm0D ]
let s:I2   = [ s:gui06, s:gui02, s:cterm06, s:cterm02 ]
let s:I3   = [ s:gui09, s:gui01, s:cterm09, s:cterm01 ]
let g:airline#themes#base16_eighties#palette.insert = airline#themes#generate_color_map(s:I1, s:I2, s:I3)

let s:R1   = [ s:gui01, s:gui08, s:cterm01, s:cterm08 ]
let s:R2   = [ s:gui06, s:gui02, s:cterm06, s:cterm02 ]
let s:R3   = [ s:gui09, s:gui01, s:cterm09, s:cterm01 ]
let g:airline#themes#base16_eighties#palette.replace = airline#themes#generate_color_map(s:R1, s:R2, s:R3)

let s:V1   = [ s:gui01, s:gui0E, s:cterm01, s:cterm0E ]
let s:V2   = [ s:gui06, s:gui02, s:cterm06, s:cterm02 ]
let s:V3   = [ s:gui09, s:gui01, s:cterm09, s:cterm01 ]
let g:airline#themes#base16_eighties#palette.visual = airline#themes#generate_color_map(s:V1, s:V2, s:V3)

let s:IA1   = [ s:gui05, s:gui01, s:cterm05, s:cterm01 ]
let s:IA2   = [ s:gui05, s:gui01, s:cterm05, s:cterm01 ]
let s:IA3   = [ s:gui05, s:gui01, s:cterm05, s:cterm01 ]
let g:airline#themes#base16_eighties#palette.inactive = airline#themes#generate_color_map(s:IA1, s:IA2, s:IA3)

" Here we define the color map for ctrlp.  We check for the g:loaded_ctrlp
" variable so that related functionality is loaded iff the user is using
" ctrlp. Note that this is optional, and if you do not define ctrlp colors
" they will be chosen automatically from the existing palette.
if !get(g:, 'loaded_ctrlp', 0)
  finish
endif
let g:airline#themes#base16_eighties#palette.ctrlp = airline#extensions#ctrlp#generate_color_map(
      \ [ s:gui07, s:gui02, s:cterm07, s:cterm02, '' ],
      \ [ s:gui07, s:gui04, s:cterm07, s:cterm04, '' ],
      \ [ s:gui05, s:gui01, s:cterm05, s:cterm01, 'bold' ])

## cursor
## gui for gui vim
highlight Cursor guifg=white guibg=black
highlight iCursor guifg=white guibg=steelblue
set guicursor=n-v-c:block-Cursor
set guicursor+=i:ver100-iCursor
set guicursor+=n-v-c:blinkon0
set guicursor+=i:blinkwait10

## for cli/terminal vim
let &t_SI.="\e[5 q" "SI = INSERT mode
let &t_SR.="\e[4 q" "SR = REPLACE mode
let &t_EI.="\e[1 q" "EI = NORMAL mode (ELSE)

"Cursor settings:

"  1 -> blinking block
"  2 -> solid block 
"  3 -> blinking underscore
"  4 -> solid underscore
"  5 -> blinking vertical bar
"  6 -> solid vertical bar
