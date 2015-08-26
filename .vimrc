" < EXTENSIONS >
    filetype plugin indent on
    set runtimepath^=~/.vim/bundle/ctrlp.vim
" </ EXTENSIONS >


" < VIM >
    " Don't try to please old vi settings.
    set nocompatible

    " Disable modelines for security reasons.
    set modelines=0

    " Smoother vim when editing locally or in fast connections.
    set ttyfast

    " Hide buffers instead of unloading them when you change the window.
    set hidden

    " Don't flicker my screen or beep my ears, please.
    set visualbell t_vb=

    " "Stop that stupid window from opping up."
    map q: :q
" </ VIM >


" < FILE ENCODING >
    " I would like my accents to remain intact, thank you.
    set encoding=utf-8

    " When possible, prefer Unix linebreaks, but accept DOS too.
    set ffs=unix,dos
" </ FILE ENCODING >


" < LEADER MAPS >
    " "ç" is under the right pinky in Brazilian keyboards. Change to your
    " liking.
    let mapleader = "ç"

    " Easier mode escaping.
    nnoremap <Leader><Leader> <Esc>
    vnoremap <Leader><Leader> <Esc>gV
    onoremap <Leader><Leader> <Esc>
    inoremap <Leader><Leader> <Esc>`^

    " Replace word pattern under cursor.
    nnoremap <Leader>* :%s/\<<C-r><C-w>\>//<Left>

    " Load and save sessions globally.
    nnoremap <Leader>l :source ~/session.vim<CR>
    nnoremap <Leader>s :mksession! ~/session.vim<CR>

    " Save session, save files and quit.
    nnoremap <Leader>z :mksession! ~/.vim_session<CR>:xa<CR>

    " Clear search highlights or errors.
    nnoremap <leader><space> :noh<cr>

    " Try to quit without saving. Displays error when there are unsaved
    " changes.
    nnoremap <Leader>q :qa<CR>

    " Save everything.
    nnoremap <Leader>w :wa<CR>

    " Leader + clipboard command = command using system clipboard.
    vmap <Leader>y "+y
    vmap <Leader>d "+d
    nmap <Leader>p "+p
    nmap <Leader>P "+P
    vmap <Leader>p "+p
    vmap <Leader>P "+P

    " Add an "s" object that means last search result.
    vnoremap <silent> s //e<C-r>=&selection=='exclusive'?'+1':''<CR><CR>
        \:<C-u>call histdel('search',-1)<Bar>let @/=histget('search',-1)<CR>gv
    omap s :normal vs<CR>

    " Quick access to make programs.
    nnoremap <Leader>m :make<CR>

    " Easier editting of .vimrc file.
    if has("win32") || has("win64")
        nnoremap <Leader>V :e ~/_vimrc<CR>
    else
        nnoremap <Leader>V :e ~/.vimrc<CR>
    end
" </ LEADER MAPS >


" < SAVING >
    " Save on focus lost.
    au FocusLost * silent! :wa

    " When opening a file, automatically navigate to its folder. Useful for
    " opening other files there or executing shell commands.
    set autochdir

    " This beauty remembers where you were the last time you edited the file,
    " and returns to the same position.
    au BufReadPost * if line("'\"") > 0|if line("'\"") <= line("$")|exe("norm '\"")|else|exe "norm $"|endif|endif
" </ SAVING >


" < SPLIT WINDOW MAPS>
    "use ctrl instead of Ctrl+w to navigate splits
    nnoremap <C-h> <C-w>h
    nnoremap <C-j> <C-w>j
    nnoremap <C-k> <C-w>k
    nnoremap <C-l> <C-w>l
" </ SPLIT WINDOW MAPS>


" < BRACKETS >
    " Highlights matching bracket.
    set showmatch

    " Autocomplete curly braces.
    inoremap {<CR>  {<CR>}<Esc>O
" </ BRACKETS >

" </ PASTING >
    " After pasting, navigate to end of pasted item.
    vnoremap <silent> y y`]
    vnoremap <silent> p p`]
    nnoremap <silent> p p`]

    " Make pasting not copy what was replaced.
    function! RestoreRegister()
      let @" = s:restore_reg
      return ''
    endfunction
    function! s:Repl()
      let s:restore_reg = @"
      return "p@=RestoreRegister()\<cr>"
    endfunction
    vmap <silent> <expr> p <sid>Repl()
" </ PASTING >

" < INDENTATION >
    " Number of spaces in a tab.
    set tabstop=4

    " Number of spaces in each indent increment.
    set shiftwidth=4

    " Number of spaces counted in editing operations.
    set softtabstop=4

    " Insert spaces instead of tabs.
    set expandtab

    " Use backspace to remove indentation, end or start of lines.
    set backspace=indent,eol,start
" </ INDENTATION >


" < STATUS LINE >
    " When in a different mode, display the mode's name in the last status line
    " as "-- MODE --"
    set showmode

    " Always show status line.
    set laststatus=2

    " Show commands in the last status line as you type them. In visual mode,
    " also shows number of lines, characters or columns selected.
    set showcmd

    " In status line, displays current line and column and how far down the file
    " you are.
    set ruler

    " Adds total line count to the end of the ruler.
    set rulerformat=%l,%c%V%=%P\ %L

    " Tab completion for command line commands.
    set wildmenu

    " When tab completing command line commands, completes up to the longest
    " common string.
    set wildmode=list:longest
" </ STATUS LINE >


" < SEARCH/REPLACE IMPROVEMENTS >
    " "Very magic" search. All special symbols get special meanings.
    nnoremap / /\v
    vnoremap / /\v

    " Together, this options ignore case if all terms are in lower case, or
    " match case if any of the characters in upper case.
    set ignorecase
    set smartcase

    " Select all matches in each line instead of only one.
    set gdefault

    " Shows partial matches as you type.
    set incsearch
    " Together, this options highlight search results.
    set hlsearch
" </ SEARCH/REPLACE IMPROVEMENTS >


" < TEXT SIZE >
    " When lines are too big, show as multiple ones.
    set wrap

    " Limit lines to 79 characters when in insert mode. Lines are automatically
    " broken on first whitespace.
    " set textwidth=79

    " Automatically format text and comments.
    set formatoptions=tc

    " Highlights the 81'th. Useful when the editor is much bigger than this.
    set colorcolumn=81

    " Visual line movements for intuitive behavior on line wraps.
    nnoremap j gj
    nnoremap k gk

    " Minimal number of screen lines to keep above and below the cursor.
    set scrolloff=3

    " Scrolls five lines instead of one when the cursor goes outside the screen.
    set scrolljump=5
" </ TEXT SIZE >


" < VISUAL >
    " Enables syntax highlighting without overriding color scheme.
    syntax enable

    " < GVIM ONLY >
        if has("gui_running")
            " Highlights current line. Only in gvim because vim's cursor line
            " is ugly.
            set cursorline

            " Enable spellcheck. On console it just changes the word
            " background, making it almost impossible to read.
            set spell spelllang=en_us

            " Maximize gvim.
            if has("win32") || has("win64")
                au GUIEnter * simalt ~x
            endif

            set guioptions-=M  " Remove menu bar.
            set guioptions-=m  " Remove menu bar.
            set guioptions-=T  " Remove toolbar.
            set guioptions-=l  " Remove scrollbar.
            set guioptions-=L  " Remove scrollbar.
            set guioptions-=r  " Remove scrollbar.
            set guioptions-=b  " Remove scrollbar.

            " Disable cursor blinking.
            set guicursor+=a:blinkon0

            set background=dark
            colorscheme solarized
        endif
    " </ GVIM ONLY >
 "</ VISUAL>
