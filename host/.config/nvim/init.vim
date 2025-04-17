
"==============================
" vim plug
"==============================

set shell=/bin/bash

call plug#begin('~/.vim/plugged')

" coc.nvim lspの補完など
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" 多言語シンタックスチェック
Plug 'sheerun/vim-polyglot' 

" jsdoc
Plug 'heavenshell/vim-jsdoc', { 'for': ['js','javascript','typescript'], 'do': 'make install' }

" phpdoc
Plug 'tobyS/pdv', { 'for': 'php' }

" vim-easy-align
Plug 'junegunn/vim-easy-align'

" fzf search
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }

" Syntax テーマ
Plug 'w0ng/vim-hybrid'

" ステータスバー改造
Plug 'vim-airline/vim-airline'

" ステータスバーテーマ
Plug 'vim-airline/vim-airline-themes'

" コマンドをPreviewする
Plug 'osyo-manga/vim-over'

" ウィンドウサイズを変更
Plug 'simeji/winresizer'

" コメントアウトを行うプラグイン
Plug 'tyru/caw.vim'

" カッコをいい感じにしてくれる
" Plug 'cohama/lexima.vim'

Plug 'sika7/coc-claude'

" マークダウンをプレビュー
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && npx --yes yarn install' }

" emmet入力
Plug 'mattn/emmet-vim', { 'for': ['html','pug','css','php','stylus','sass','vue'] }

call plug#end()


"==============================
"エディターの設定
"==============================

"#####基本設定#####

set fenc=utf-8      "デフォルトの文字コード
set autoread        "他のエディタでの編集を読み込み
set number          "行番号を表示
set nocursorline    "現在の行を強調表示
set showcmd         "コマンドを表示
set virtualedit=onemore   "最後の行以上
set clipboard=unnamedplus " クリップボードの共有

" set nowrap
set fileencodings=utf-8,euc-jp,sjis,cp932,iso-2022-jp
set hidden
set nowritebackup

" Leaderの入力遅延解消
set ttimeoutlen=50
set timeoutlen=800

" #####カラー設定#####
colorscheme hybrid
set background=dark

" テキスト背景色
" au ColorScheme * hi Normal ctermbg=none
" 括弧対応
au ColorScheme * hi MatchParen cterm=bold ctermfg=214 ctermbg=black
" スペルチェック
au Colorscheme * hi SpellBad ctermfg=23 cterm=none ctermbg=none

syntax on           "Syntaxを使う
set laststatus=2

let g:airline_theme = 'minimalist'
" highlight Normal ctermbg=NONE guibg=NONE
" highlight Comment ctermfg=248

" 行番号の色指定
highlight LineNr ctermfg=245
highlight Search ctermfg=221 ctermbg=NONE
" highlight WildMenu ctermfg=99 ctermbg=235

" highlight CursorLine ctermfg=99

" アンダーラインを引く
hi CursorLine term=underline cterm=underline ctermbg=NONE

set conceallevel=0
let g:vim_json_syntax_conceal = 0
let g:vim_markdown_conceal = 0

"#####タブの設定#####

set list                    "不可視文字を表示する
set tabstop=2
set shiftwidth=2
set expandtab
"タブを>-スペースを.で表示
set listchars=tab:>-,trail:>


"#####検索の設定#####
set incsearch "インクリメンタルサーチに変更

"==============================
"テーマ設定 カラースキーム
"==============================

"ステータスバー改造
let g:airline_powerline_fonts = 1


"==============================
"キーマッピング
"==============================

"基本設定
let mapleader = "\<Space>"
nnoremap <Leader>w  :w<CR>
nnoremap <Leader>q  :q<CR>
nnoremap <Leader>nq :q!<CR>


"設定を再読み込み
" nnoremap <Leader>rrr :source ~/.config/nvim/init.vim<CR>

"ファイルを再読み込み
nnoremap <Leader>rr :bufdo edit<CR>

" =====Window=====
nnoremap <silent><Leader>ss :split<CR>
nnoremap <silent><Leader>sv :vsplit<CR>
nnoremap <Leader>h <C-w>h
nnoremap <Leader>j <C-w>j
nnoremap <Leader>k <C-w>k
nnoremap <Leader>l <C-w>l
nnoremap <Leader>wr :WinResizerStartResize<CR>

"移動系
nnoremap <C-h> ^
nnoremap <C-j> <C-f>
nnoremap <C-k> <C-b>
nnoremap <C-l> $
nnoremap <S-j> gj
nnoremap <S-k> gk


"tabの設定
nnoremap <Leader>st :tabnew<CR>
nnoremap <Tab>      gt
nnoremap <S-Tab>    gT

"Indentを形成
nnoremap <Leader>i gg=G''

"==============================
"インサートモード設定
"==============================

inoremap jj <ESC>

"移動
inoremap <C-j>  <down>
inoremap <C-k>  <up>
inoremap <C-h>  <left>
inoremap <C-l>  <right>

"=======================================
" vim-easy-align
"=======================================

" 検索によるハイライト表示を解除する
nnoremap <Esc><Esc> :<C-u>nohlsearch<CR>

" 全体置換
nnoremap <silent> <Space>o :OverCommandLine<CR>%s//g<Left><Left>
" 選択範囲置換
vnoremap <silent> <Space>o :OverCommandLine<CR>s//g<Left><Left>
" カーソル下の単語をハイライト付きで置換
nnoremap sub :OverCommandLine<CR>%s/<C-r><C-w>//g<Left><Left>
" コピーした文字列をハイライト付きで置換
nnoremap subp y:OverCommandLine<CR>%s!<C-r>=substitute(@0, '!', '\\!', 'g')<CR>!!gI<Left><Left><Left>

"=======================================
" vim-easy-align
"=======================================

xmap ga <Plug>(EasyAlign)
nmap ga <Plug>(EasyAlign)

"==============================
" tyru/caw.vim
"==============================

" 行の最初の文字の前にコメント文字をトグル
nmap cc <Plug>(caw:hatpos:toggle)
vmap cc <Plug>(caw:hatpos:toggle)

"==============================
" JsDoc Config
"==============================

" JsCocの追加
nmap J :JsDoc <cr>

"==============================
" PHP Doc Config
"==============================

" inoremap P <ESC>:call PhpDocSingle()<CR>i
nnoremap P :call PhpDocSingle()<CR>
vnoremap P :call PhpDocRange()<CR>

"==============================
" emmet
"==============================

autocmd FileType html,pug,css,scss,php,stylus,sass,vue imap <buffer><expr><C-e>
      \ emmet#isExpandable() ? "\<plug>(emmet-expand-abbr)" :
      \ "\<C-e>"

let g:user_emmet_settings = {
      \   'variables' :{
      \     'lang' :"ja"
      \   },
      \   'indentation': '  '
      \ }
 
"==============================
" coc.nvim (lsp)
"==============================

" coc color setting
highlight CocErrorSign ctermfg=15 ctermbg=196
highlight CocWarningSign ctermfg=0 ctermbg=172
" hi CocCursorRange guibg=#b16286 guifg=#ebdbb2

" install plugins
let g:coc_global_extensions = [ 
      \ 'coc-tsserver',
      \ 'coc-vetur',
      \ 'coc-phpls',
      \ 'coc-yaml',
      \ 'coc-emmet',
      \ 'coc-eslint',
      \ 'coc-lists',
      \ 'coc-git',
      \ 'coc-snippets',
      \ 'coc-word',
      \ 'coc-syntax',
      \ 'coc-highlight',
      \ 'coc-yank',
      \ 'coc-actions',
      \ 'coc-json',
      \ 'coc-html',
      \ 'coc-css',
      \ 'coc-explorer',
      \ 'coc-translator',
      \ 'coc-fzf-preview',
      \ 'coc-pairs',
      \ 'coc-prettier'
      \ ]

" git status line
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" ===
" coc-list
" ===

"スペース2回でCocList
nmap <silent> <space><space> :<C-u>CocList<cr>

" ファイルを開く
nnoremap <silent> <leader>sf  :<C-u>CocList files<cr>

" Prettier formatter
command! -nargs=0 Prettier :CocCommand prettier.formatFile

" Workspaceを診断
nnoremap <silent> <leader>wa  :<C-u>CocList diagnostics<cr>

" Grepで検索
nnoremap <silent>sg  :<C-u>CocList grep<cr>

vnoremap <leader>g :<C-u>call <SID>GrepFromSelected(visualmode())<CR>
nnoremap <leader>g :<C-u>set operatorfunc=<SID>GrepFromSelected<CR>g@

function! s:GrepFromSelected(type)
  let saved_unnamed_register = @@
  if a:type ==# 'v'
    normal! `<v`>y
  elseif a:type ==# 'char'
    normal! `[v`]y
  else
    return
  endif
  let word = substitute(@@, '\n$', '', 'g')
  let word = escape(word, '| ')
  let @@ = saved_unnamed_register
  execute 'CocList grep '.word
endfunction

" Show buffers
nnoremap <silent>b  :<C-u>CocList buffers<cr>

" Manage extensions
nnoremap <silent> <leader>e  :<C-u>CocList extensions<cr>

" Show commands
nnoremap <silent> <leader>c  :<C-u>CocList commands<cr>

" Find symbol of current document
nnoremap <silent> <leader>ol  :<C-u>CocList outline<cr>

" coc-yank
nnoremap <silent> <leader>y  :<C-u>CocList -A --normal yank<cr>

" Search workspace symbols
" nnoremap <silent> <lender>s  :<C-u>CocList -I symbols<cr>

" ===
" coc-explorer
" ===
nnoremap <leader>ff :CocCommand explorer --position floating<CR>


" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
set signcolumn=yes

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.

inoremap <silent><expr> <TAB>
    \ pumvisible() ? "\<C-n>" :
    \ <SID>check_back_space() ? "\<TAB>" :
    \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use `[g` and `]g` to navigate diagnostics
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

"スペースfmtでFormat
nmap <silent> <space>fmt <Plug>(coc-format)


" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocActionAsync('doHover')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor.
" autocmd CursorHold * silent call CocActionAsync('highlight')


augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder.
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Applying codeAction to the selected region.
" Example: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)


" Remap keys for applying codeAction to the current line.
nmap <leader>ac  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)



" Do default action for next item.
nnoremap <silent> <C-n>  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent> <C-p>  :<C-u>CocPrev<CR>
" Resume latest coc list.
nnoremap <silent> <leader>p  :<C-u>CocListResume<CR>



" マルチ選択設定
nmap <silent> <C-c> <Plug>(coc-cursors-position)
nmap <silent> <C-d> <Plug>(coc-cursors-word)
" xmap <silent> <C-d> <Plug>(coc-cursors-range)
" nmap <leader>x  <Plug>(coc-cursors-operator)

" nmap <silent> <C-d> <Plug>(coc-cursors-word)*
xmap <silent> <C-d> y/\V<C-r>=escape(@",'/\')<CR><CR>gN<Plug>(coc-cursors-range)gn

" ===
" coc-pairs
" ===
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm() : "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" ===
" coc-translator
" ===
nmap <Leader>t <Plug>(coc-translator-e)
vmap <Leader>t <Plug>(coc-translator-ev)

" ===
" coc-fzf-preview
" ===
nmap <Leader>f [fzf-p]
xmap <Leader>f [fzf-p]

nnoremap <silent> [fzf-p]p     :<C-u>CocCommand fzf-preview.FromResources project_mru git<CR>
nnoremap <silent> [fzf-p]gs    :<C-u>CocCommand fzf-preview.GitStatus<CR>
nnoremap <silent> [fzf-p]ga    :<C-u>CocCommand fzf-preview.GitActions<CR>
nnoremap <silent> [fzf-p]b     :<C-u>CocCommand fzf-preview.Buffers<CR>
nnoremap <silent> [fzf-p]B     :<C-u>CocCommand fzf-preview.AllBuffers<CR>
nnoremap <silent> [fzf-p]o     :<C-u>CocCommand fzf-preview.FromResources buffer project_mru<CR>
nnoremap <silent> [fzf-p]<C-o> :<C-u>CocCommand fzf-preview.Jumps<CR>
nnoremap <silent> [fzf-p]g;    :<C-u>CocCommand fzf-preview.Changes<CR>
nnoremap <silent> [fzf-p]/     :<C-u>CocCommand fzf-preview.Lines --add-fzf-arg=--no-sort --add-fzf-arg=--query="'"<CR>
nnoremap <silent> [fzf-p]*     :<C-u>CocCommand fzf-preview.Lines --add-fzf-arg=--no-sort --add-fzf-arg=--query="'<C-r>=expand('<cword>')<CR>"<CR>
nnoremap          [fzf-p]gr    :<C-u>CocCommand fzf-preview.ProjectGrep<Space>
xnoremap          [fzf-p]gr    "sy:CocCommand   fzf-preview.ProjectGrep<Space>-F<Space>"<C-r>=substitute(substitute(@s, '\n', '', 'g'), '/', '\\/', 'g')<CR>"
nnoremap <silent> [fzf-p]t     :<C-u>CocCommand fzf-preview.BufferTags<CR>
nnoremap <silent> [fzf-p]q     :<C-u>CocCommand fzf-preview.QuickFix<CR>
nnoremap <silent> [fzf-p]l     :<C-u>CocCommand fzf-preview.LocationList<CR>

"==============================
"MarkdownPreview設定
"==============================

nnoremap <C-s> <Plug>MarkdownPreviewStop
nnoremap <C-p> <Plug>MarkdownPreviewToggle

"==============================
"claude-code設定
"==============================

" set runtimepath^=~/Documents/coc-claude

nnoremap <silent> <leader>cl :CocCommand claude.log<CR>
nnoremap <silent> <leader>ca :CocCommand claude.ask<CR>
nnoremap <silent> <leader>co :CocCommand claude.askCodeOnly<CR>

vmap <leader>ca <Plug>(coc-claude-ask)
vmap <leader>co <Plug>(coc-claude-ask-code-only)
