call plug#begin('~/.vim/plugged')

let mapleader=" "

syntax on

if (has("win32"))
	set encoding=utf-8
	set fileencodings=utf-8
endif

if (has("gui"))
	set go-=m
	set go-=T
	set go-=r
	set go-=R
	set go-=l
	set go-=L
	set guifont=Consolas:h15
	set autoread
endif

set directory=/tmp

filetype plugin indent on

nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l
nnoremap tn :tabn<cr>
nnoremap tp :tabp<cr>
command! Tn :tabnew

nnoremap <leader>w :w<cr>
nnoremap <leader>q :q<cr>
nnoremap <leader>wq :wq<cr>
nnoremap <leader>m :on<cr>

colorscheme wombat

nnoremap gV `[v`]

set showmatch
set mat=2

set showcmd

set hidden

nnoremap <leader>evi :e $MYVIMRC<CR>
nnoremap <leader>svi :source $MYVIMRC<CR>
command! VimConfig :e $MYVIMRC
command! SourceVimConfig :source $MYVIMRC

set splitright

set backspace=indent,eol,start

inoremap <left> <nop>
inoremap <right> <nop>
inoremap <up> <nop>
inoremap <down> <nop>

set tabstop=4
set shiftwidth=4
set noexpandtab
augroup two_tab_indent
	au!
	autocmd FileType xml,html,json setlocal tabstop=2 | setlocal shiftwidth=2
augroup END

set incsearch
set hlsearch
set ignorecase
set nowrapscan
hi Search cterm=NONE ctermfg=black ctermbg=gray

set autowrite

set laststatus=2
set statusline=%f%m%r%w\ %{fugitive#statusline()}\ [%l,%v]\ [%{&ff}]\ [%{&ft}]

function! DeleteTrailingWS()
	execute 'normal! mz'
	execute '%s/\s\+$//e'
	execute "normal! `z"
endfunction

augroup clear_trail_white_space
	au!
	au BufWritePre * :call DeleteTrailingWS()
augroup END

""search hilight text in visual mode
vnoremap <silent> * :<C-U>
    \let old_reg=getreg('"')<Bar>let old_regtype=getregtype('"')<CR>
    \gvy/<C-R><C-R>=substitute(
    \escape(@", '/\.*$^~['), '\_s\+', '\\_s\\+', 'g')<CR><CR>
    \gV:call setreg('"', old_reg, old_regtype)<CR>

vnoremap <silent> # :<C-U>
    \let old_reg=getreg('"')<Bar>let old_regtype=getregtype('"')<CR>
    \gvy?<C-R><C-R>=substitute(
    \escape(@", '?\.*$^~['), '\_s\+', '\\_s\\+', 'g')<CR><CR>
    \gV:call setreg('"', old_reg, old_regtype)<CR>

packadd! matchit

" grep setting
set grepprg=ag\ --nogroup\ --nocolor
" bind K to grep word under cursor
" nnoremap K :grep! "\b<C-R><C-W>\b"<CR>:cw<CR>
augroup autoquickfix
		autocmd!
		autocmd QuickFixCmdPost [^l]* cwindow
		autocmd QuickFixCmdPost l*    lwindow
augroup END

Plug 'romainl/vim-cool'

Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
" let NERDTreeShowBookmarks=1
nnoremap <leader>fe :NERDTreeToggle<cr>
nnoremap <leader>ff :NERDTreeFind<cr>


Plug 'kien/ctrlp.vim'
set wildignore+=*/.git/*,*/.hg/*,*/.svn/*,*/target/*,*/node_modules/*
let g:ctrlp_clear_cache_on_exit = 0
let g:ctrlp_root_markers = ['.root']
let g:ctrlp_prompt_mappings = {
			\ 'PrtSelectMove("j")': ['<c-n>', '<down>'],
			\ 'PrtSelectMove("k")': ['<c-p>', '<up>'],
			\ 'PrtHistory(-1)': ['<c-j>'],
			\ 'PrtHistory(1)': ['<c-k>']}

Plug 'SirVer/ultisnips'
let g:UltiSnipsSnippetDirectories=["UltiSnips"]
let g:UltiSnipsEditSplit="vertical"

let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

Plug 'tpope/vim-fugitive'
nnoremap <leader>gs :Gstatus<cr>

Plug 'Xuyuanp/nerdtree-git-plugin'
let g:NERDTreeIndicatorMapCustom = {
    \ "Modified"  : "✹",
    \ "Staged"    : "✚",
    \ "Untracked" : "✭",
    \ "Renamed"   : "➜",
    \ "Unmerged"  : "═",
    \ "Deleted"   : "✖",
    \ "Dirty"     : "✗",
    \ "Clean"     : "✔︎",
    \ "Unknown"   : "?"
    \ }

" Plug 'hotoo/pangu.vim'

Plug 'tpope/vim-commentary'

Plug 'tpope/vim-surround'

Plug 'tpope/vim-repeat'

Plug 'tpope/vim-abolish'

Plug 'posva/vim-vue'
augroup two_spaces_indent
    au!
    autocmd FileType javascript,scss,yaml,css setlocal expandtab | setlocal tabstop=2 | setlocal shiftwidth=2

augroup END

Plug 'mattn/emmet-vim' , { 'for': ['xml', 'html', 'jsp', 'js', 'vue'] }

Plug 'christoomey/vim-tmux-navigator'

Plug 'terryma/vim-multiple-cursors'
let g:multi_cursor_quit_key='<C-c>'
nnoremap <C-c> :call multiple_cursors#quit()<CR>

Plug 'easymotion/vim-easymotion'
map <Plug>(easymotion-prefix)w <Plug>(easymotion-bd-w)
map <Plug>(easymotion-prefix)e <Plug>(easymotion-bd-e)
map <Plug>(easymotion-prefix)l <Plug>(easymotion-lineforward)
map <Plug>(easymotion-prefix)h <Plug>(easymotion-linebackward)

" fcitx
" Plug 'vim-scripts/fcitx.vim'
Plug 'CodeFalling/fcitx-vim-osx'
set ttimeoutlen=100

Plug 'junegunn/vim-easy-align'
vmap ga <Plug>(EasyAlign)
nmap ga <Plug>(EasyAlign)

Plug 'gcmt/taboo.vim'

Plug 'jiangmiao/auto-pairs'

function! SetConnectUrlVar()
	let bottom = getline(line('$'))
	if bottom =~ 'connectUrl'
		let connectUrl = split(bottom)[2]
		if !exists('w:db')
			echom ''
			let w:db = connectUrl
		endif
	endif
endfunction

" mysql
Plug 'tpope/vim-dadbod'
augroup db
	au!
	au filetype sql vnoremap <cr> :DB<cr>
	au BufEnter *.sql :call SetConnectUrlVar()
augroup END

let g:mysql_local="mysql://root@127.0.0.1:3306/dip_zygl"

" vimwiki
Plug 'vimwiki/vimwiki'
nmap <Leader>wK <Plug>VimwikiIndex
nmap <Leader>wHH <Plug>Vimwiki2HTMLBrowse
nmap <Leader>wT <Plug>VimwikiTabIndex
let wiki = {}
let wiki.path = '~/vimwiki/'
let wiki.auto_toc=1
let wiki.nested_syntaxes = {
			\ 'python': 'python',
			\ 'vimL': 'vim',
			\ 'bash': 'bash',
			\ 'java': 'java',
			\ 'json': 'json',
			\ 'xml': 'xml',
			\ 'plantuml': 'plantuml',
			\ 'perl': 'perl'}
let g:vimwiki_list = [wiki]
let g:vimwiki_html_header_numbering = 1
au Filetype vimwiki setlocal textwidth=80

nnoremap <leader>td :VimwikiToggleListItem<cr>

" file:xxx::lineNum to unnamed register
function! VimwikiStoreLink()
	let @" = 'file:'.expand("%:p").'::'.line('.')
endfunction
command! StoreLink :call VimwikiStoreLink()

function! VimwikiLinkHandler(link)
	try
		let pageNum = matchstr(a:link, '::\zs\d\+')
		let file = matchstr(a:link, '^.*:\zs.*\ze::')
		let fileCmdOutput = system('file '.file)
		if pageNum ==? ""
			pageNum = 1
		endif
		if matchstr(fileCmdOutput, '\zsPDF\ze') ==? 'PDF'
			let opener = '/usr/bin/zathura'
			call system(opener.' -P '.pageNum.' '.file.' &')
			return 1
		elseif matchstr(fileCmdOutput, '\zstext\ze') ==? 'text'
			execute 'edit +'.pageNum.' '.file
			return 1
		else
			return 0
		endif
	catch
		echom "This can happen for a variety of reasons ..."
	endtry
	return 0
endfunction

set sessionoptions+=globals
Plug 'tpope/vim-obsession'

nnoremap  co :cw<CR>
nnoremap  cx :ccl<CR>
nnoremap  cn :cn<CR>
nnoremap  cp :cp<CR>

" 复制文件名
nnoremap  <leader>yfn :let @+=expand("%:t")<CR> :let @"=expand("%:t")<CR>
nnoremap  <leader>yfp :let @+=expand("%:p")<CR> :let @"=expand("%:p")<CR>

" switch tab
:nn <M-h> gT<CR>
:nn <M-l> gt<CR>

" 全屏当前pane
function! Zoom ()
    " check if is the zoomed state (tabnumber > 1 && window == 1)
    if tabpagenr('$') > 1 && tabpagewinnr(tabpagenr(), '$') == 1
        let l:cur_winview = winsaveview()
        let l:cur_bufname = bufname('')
        tabclose

        " restore the view
        if l:cur_bufname == bufname('')
            call winrestview(cur_winview)
        endif
    else
        tab split
    endif
endfunction

nmap <leader>z :call Zoom()<CR>


" 翻译
Plug 'VincentCordobes/vim-translate'
let g:translate#default_languages={'en': 'zh'}
vnoremap <silent> <leader>tt :<C-u>TranslateVisual<CR>
nnoremap <silent> <leader>tt viw :TranslateVisual<CR>
nnoremap <silent> <leader>tp vip :TranslateVisual<CR>
nnoremap <silent> <leader>tq :TranslateClear<CR>


" Wrapped lines goes down/up to next row, rather than next line in file.
noremap j gj
noremap k gk

" Code folding options
nmap <leader>f0 :set foldlevel=0<CR>
nmap <leader>f1 :set foldlevel=1<CR>
nmap <leader>f2 :set foldlevel=2<CR>
nmap <leader>f3 :set foldlevel=3<CR>
nmap <leader>f4 :set foldlevel=4<CR>
nmap <leader>f5 :set foldlevel=5<CR>
nmap <leader>f6 :set foldlevel=6<CR>
nmap <leader>f7 :set foldlevel=7<CR>
nmap <leader>f8 :set foldlevel=8<CR>
nmap <leader>f9 :set foldlevel=9<CR>

" Visual shifting (does not exit Visual mode)
vnoremap < <gv
vnoremap > >gv

" AutoCloseTag
Plug 'vim-scripts/HTML-AutoCloseTag'
au FileType html,xhtml,xml,vue,js,jsp ru ftplugin/html/autoclosetag.vim
nmap <Leader>ac <Plug>ToggleAutoCloseMappings

Plug 'mbbill/undotree'
nnoremap <Leader>u :UndotreeToggle<CR>
let g:undotree_SetFocusWhenToggle=1

Plug 'terryma/vim-expand-region'
map - <Plug>(expand_region_shrink)

cnoremap <c-n> <down>
cnoremap <c-p> <up>

set scrolljump=5
set scrolloff=3

" 自动折叠
set foldenable
" set foldmethod=syntax
set foldmethod=indent
set foldlevelstart=99

" 重绘屏幕
nnoremap <leader>l :nohlsearch<cr>:diffupdate<cr>:syntax sync fromstart<cr><c-l>
autocmd FileType vue syntax sync fromstart

" 系统剪贴板
vnoremap <leader>y "+y
nnoremap <leader>y "+y
vnoremap <leader>p "+p
nnoremap <leader>p "+p

nnoremap <leader>vs :vs<CR>
nnoremap <leader>sp :sp<CR>

vnoremap <C-w>S :new<CR>
vnoremap <C-w>V :vnew<CR>
nnoremap <C-w>S :new<CR>
nnoremap <C-w>V :vnew<CR>

nnoremap <leader>vS :vnew<CR>
nnoremap <leader>sP :new<CR>

" fzf
Plug '~/.fzf'
Plug 'junegunn/fzf.vim'
nnoremap <leader>mm :Marks<CR>
nnoremap <leader>ww :Windows<CR>
nnoremap <leader>bb :BufExplorer<CR>
nnoremap <leader>ss :Ag<CR>
nnoremap <M-x> :Commands<CR>
nnoremap <C-p> :CtrlP<CR>

" buffer
nnoremap <leader>bp :bprevious<CR>
nnoremap <leader>bn :bnext<CR>
" nnoremap <M-p> :bprevious<CR>
" nnoremap <M-n> :bnext<CR>

" sudo
map <leader>sudo :w !sudo tee % <CR><CR><CR>L
command! Sudo :w !sudo tee % <CR><CR><CR>L

" markdown
Plug 'godlygeek/tabular'
Plug 'plasticboy/vim-markdown'
Plug 'suan/vim-instant-markdown'
let g:instant_markdown_autostart = 0

" mattn/gist-vim
Plug 'mattn/webapi-vim'
Plug 'mattn/gist-vim'

set undofile
set backupdir=~/.vim/.backup//
set directory=~/.vim/.swp//
set undodir=~/.vim/.undo//

set wildmenu
set wildmode=longest:list,full

Plug 'jlanzarotta/bufexplorer'

Plug 'camspiers/lens.vim'
let g:lens#disabled_filetypes = ['nerdtree', 'fzf']
let g:lens#disabled=1
command! Lens :call lens#run()
nnoremap <C-w>a :Lens<CR>
command! LensEnable :let lens#disabled=0
command! LensDisable :let lens#disabled=1

command! Dt :windo diffthis
command! Do :windo diffoff

" format
command! Fmt :Autoformat
command! Jq :% !jq
command! Fmtxml :silent 1,$!xmllint -format -recover - 2>/dev/null
command! Fmtnt :%s/\\n/\r/g | :%s/\\t/\t/g
command! Fmtsql % !sqlformat -r -

Plug 'Chiel92/vim-autoformat'
let g:formatdef_sqlformat = '"sqlformat -r --keywords upper -"'
let g:formatters_sql = ['sqlformat']

" coc
Plug 'neoclide/coc.nvim', {'branch': 'release'}
source ~/.config/nvim/plug-config/coc.vim

Plug 'nvim-treesitter/nvim-treesitter'

" Java
command! JavaExec :call JavaExec()

function! JavaExec ()
	execute "!javac %"
	execute "!java %:r"
endfunction

call plug#end()

lua << EOF
require'nvim-treesitter.configs'.setup {
  ensure_installed = "maintained", -- one of "all", "maintained" (parsers with maintainers), or a list of languages
  highlight = {
    enable = true,              -- false will disable the whole extension
  },
}
EOF
