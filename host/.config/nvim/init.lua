-- ==============================
-- lazy nvim
-- ==============================

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
  -- coc.nvim lspの補完など
  {
    'neoclide/coc.nvim',
    branch = "release",
  },

  -- 多言語シンタックスチェック
  'sheerun/vim-polyglot',

  -- jsdoc
  {
    "heavenshell/vim-jsdoc",
    ft = { "javascript", "typescript", "js" },
    build = "make install",
  },

  -- phpdoc
  {
    "tobyS/pdv",
    ft = { "php" },
  },

  -- vim-easy-align
  'junegunn/vim-easy-align',

  -- Syntax テーマ
  'w0ng/vim-hybrid',

  -- ステータスバー改造
  'vim-airline/vim-airline',

  -- ステータスバーテーマ
  'vim-airline/vim-airline-themes',

  -- ウィンドウサイズを変更
  'simeji/winresizer',

  -- コメントアウトを行うプラグイン
  'tyru/caw.vim',

  -- 画像をコピペでインサートできるようにするプラグイン
  'sika7/dropmd.nvim',

  -- ワークスペースのlua設定ファイルを読むプラグイン
  'sika7/workspace-config.nvim',

  -- 自作プラグイン
  -- 'sika7/coc-claude',
  -- {
  --   dir = "~/Documents/coc-claude",
  --   dependencies = {
  --     'folke/snacks.nvim',
  --   },
  -- },
  {
    dir = "~/Documents/ai-assistant.nvim/",
    dependencies = {
      'folke/snacks.nvim',
      -- 'nvim-lua/plenary.nvim', -- HTTP通信用
    },
    name = "ai-assistant",
  },

  -- マークダウンをプレビュー
  {

    'iamcco/markdown-preview.nvim',
    build = "cd app && npx --yes yarn install",
  },

  -- emmet入力
  {
    'mattn/emmet-vim',
    ft = { 'html', 'pug', 'css', 'php', 'stylus', 'sass', 'vue' }
  },

  -- snacks.nvim（UI改善モジュール群）
  'folke/snacks.nvim',

  -- キー入力を表示する
  'nvzone/showkeys',
})

-- ==============================
-- エディターの設定
-- ==============================

-- #####基本設定#####

vim.opt.shell = "/bin/bash"

vim.scriptencoding = "utf-8"      -- デフォルトの文字コード
vim.opt.autoread = true           -- 他のエディタでの編集を読み込み
vim.opt.number = true             -- 行番号を表示
vim.opt.cursorline = false        -- 現在の行を強調表示しない
vim.opt.showcmd = true            -- コマンドを表示
vim.opt.virtualedit = "onemore"   -- 最後の行以上
vim.opt.clipboard = "unnamedplus" -- クリップボードの共有

vim.opt.fileencodings = "utf-8,euc-jp,sjis,cp932,iso-2022-jp"
vim.opt.hidden = true
vim.opt.writebackup = false

-- Leaderの入力遅延解消
vim.opt.ttimeoutlen = 50
vim.opt.timeoutlen = 800

-- カラー設定
vim.cmd("colorscheme hybrid")
vim.opt.background = "dark"

-- 構文ハイライト
vim.cmd("syntax on")
vim.opt.laststatus = 2

-- Airline テーマ
vim.g.airline_theme = 'minimalist'

-- JSON のダブルクォーテーションを表示
vim.opt.conceallevel = 0
vim.g.vim_json_syntax_conceal = 0
vim.g.vim_markdown_conceal = 0

-- タブの設定
vim.opt.list = true -- 不可視文字を表示する
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true
vim.opt.listchars = "tab:>-,trail:>" -- タブを>-スペースを.で表示

-- 検索の設定
vim.opt.incsearch = true   -- インクリメンタルサーチに変更

vim.opt.signcolumn = 'yes' -- 行がずれないように

--==============================
-- キーマッピング
--==============================

-- 基本設定
vim.g.mapleader = " "
vim.keymap.set('n', '<Leader>w', ':w<CR>', { silent = true })
vim.keymap.set('n', '<Leader>q', ':q<CR>', { silent = true })
vim.keymap.set('n', '<Leader>nq', ':q!<CR>', { silent = true })

-- 設定を再読み込み
-- vim.keymap.set('n', '<Leader>rrr', ':source ~/.config/nvim/init.lua<CR>', { silent = true })

-- ファイルを再読み込み
vim.keymap.set('n', '<Leader>rr', ':bufdo edit<CR>', { silent = true })

-- =====Window=====
vim.keymap.set('n', '<Leader>ss', ':split<CR>', { silent = true })
vim.keymap.set('n', '<Leader>sv', ':vsplit<CR>', { silent = true })
vim.keymap.set('n', '<Leader>h', '<C-w>h', { silent = true })
vim.keymap.set('n', '<Leader>j', '<C-w>j', { silent = true })
vim.keymap.set('n', '<Leader>k', '<C-w>k', { silent = true })
vim.keymap.set('n', '<Leader>l', '<C-w>l', { silent = true })
vim.keymap.set('n', '<Leader>wr', ':WinResizerStartResize<CR>', { silent = true })

-- 移動系
vim.keymap.set('n', '<C-h>', '^', { silent = true })
vim.keymap.set('n', '<C-j>', '<C-f>', { silent = true })
vim.keymap.set('n', '<C-k>', '<C-b>', { silent = true })
vim.keymap.set('n', '<C-l>', '$', { silent = true })

-- tabの設定
vim.keymap.set('n', '<Leader>st', ':tabnew<CR>', { silent = true })
vim.keymap.set('n', '<Tab>', 'gt', { silent = true })
vim.keymap.set('n', '<S-Tab>', 'gT', { silent = true })

-- Indentを形成
vim.keymap.set('n', '<Leader>i', 'gg=G\'\'', { silent = true })

--==============================
-- markdownのときテキストを折り返さない設定(マークダウンのテーブル表示用)
--==============================

-- init.lua などに追記
vim.api.nvim_create_autocmd("FileType", {
  pattern = "markdown",
  callback = function()
    -- 折り返しをオフに
    vim.opt_local.wrap = false
    -- 自動でテキストを折り返す幅（textwidth）をリセット
    vim.opt_local.textwidth = 0
    -- 自動フォーマット（formatoptions の 't'）を外す
    vim.opt_local.formatoptions:remove("t")
  end,
})

--==============================
-- インサートモード設定
--==============================

vim.keymap.set('i', 'jj', '<ESC>', { silent = true })

-- 移動
vim.keymap.set('i', '<C-j>', '<down>', { silent = true })
vim.keymap.set('i', '<C-k>', '<up>', { silent = true })
vim.keymap.set('i', '<C-h>', '<left>', { silent = true })
vim.keymap.set('i', '<C-l>', '<right>', { silent = true })

--=======================================
-- vim-easy-align
--=======================================

vim.keymap.set('x', 'ga', '<Plug>(EasyAlign)', { silent = true })
vim.keymap.set('n', 'ga', '<Plug>(EasyAlign)', { silent = true })

--==============================
-- tyru/caw.vim
--==============================

-- 行の最初の文字の前にコメント文字をトグル
vim.keymap.set('n', 'cc', '<Plug>(caw:hatpos:toggle)', { silent = true })
vim.keymap.set('v', 'cc', '<Plug>(caw:hatpos:toggle)', { silent = true })

--==============================
-- JsDoc Config
--==============================

-- JsDocの追加
vim.keymap.set('n', 'J', ':JsDoc <cr>', { silent = true })

--==============================
-- PHP Doc Config
--==============================

-- vim.keymap.set('i', 'P', '<ESC>:call PhpDocSingle()<CR>i', { silent = true })
vim.keymap.set('n', 'P', ':call PhpDocSingle()<CR>', { silent = true })
vim.keymap.set('v', 'P', ':call PhpDocRange()<CR>', { silent = true })

--==============================
-- emmet
--==============================

vim.cmd([[
  autocmd FileType html,pug,css,scss,php,stylus,sass,vue imap <buffer><expr><C-e>
        \ emmet#isExpandable() ? "\<plug>(emmet-expand-abbr)" :
        \ "\<C-e>"
]])

vim.g.user_emmet_settings = {
  variables = {
    lang = "ja"
  },
  indentation = '  '
}

--==============================
-- coc.nvim (lsp)
--==============================

-- coc color setting
vim.cmd([[
  highlight CocErrorSign ctermfg=15 ctermbg=196
  highlight CocWarningSign ctermfg=0 ctermbg=172
  " hi CocCursorRange guibg=#b16286 guifg=#ebdbb2
]])

-- install plugins
vim.g.coc_global_extensions = {
  'coc-tsserver',
  'coc-vetur',
  'coc-phpls',
  'coc-yaml',
  'coc-emmet',
  'coc-eslint',
  'coc-lists',
  'coc-git',
  'coc-snippets',
  'coc-word',
  'coc-yank',
  'coc-json',
  'coc-html',
  'coc-css',
  'coc-translator',
  'coc-pairs',
  'coc-prettier',
  'coc-lua'
}

-- coc listでtabで保管する設定
local opts = {
  silent = true,
  noremap = true,
  expr = true,
  replace_keycodes = false
}
vim.keymap.set("i", "<TAB>", 'coc#pum#visible() ? coc#pum#next(1) : "<Tab>"', opts)
vim.keymap.set("i", "<S-TAB>", [[coc#pum#visible() ? coc#pum#prev(1) : "<C-h>"]], opts)

--==============================
-- coc-list
--==============================

-- スペース2回でCocList
vim.keymap.set('n', '<space><space>', ':<C-u>CocList<cr>', { silent = true })

-- ファイルを開く
vim.keymap.set('n', '<leader>sf', ':<C-u>CocList files<cr>', { silent = true })

-- Prettier formatter
vim.cmd('command! -nargs=0 Prettier :CocCommand prettier.formatFile')

-- Workspaceを診断
vim.keymap.set('n', '<leader>wa', ':<C-u>CocList diagnostics<cr>', { silent = true })

-- Grepで検索
vim.keymap.set('n', 'sg', ':<C-u>CocList grep<cr>', { silent = true })

vim.keymap.set('v', '<leader>g', ':<C-u>call v:lua.GrepFromSelected(visualmode())<CR>', { silent = true })

-- GrepFromSelected関数をLuaで定義
_G.GrepFromSelected = function(type)
  local saved_unnamed_register = vim.fn.getreg('"')
  if type == 'v' then
    vim.cmd('normal! `<v`>y')
  elseif type == 'char' then
    vim.cmd('normal! `[v`]y')
  else
    return
  end
  local word = vim.fn.substitute(vim.fn.getreg('"'), [[\n$]], '', 'g')
  word = vim.fn.escape(word, '| ')
  vim.fn.setreg('"', saved_unnamed_register)
  vim.cmd('CocList grep ' .. word)
end

-- Show buffers
vim.keymap.set('n', 'b', ':<C-u>CocList buffers<cr>', { silent = true })

-- Manage extensions
vim.keymap.set('n', '<leader>e', ':<C-u>CocList extensions<cr>', { silent = true })

-- Show commands
vim.keymap.set('n', '<leader>c', ':<C-u>CocList commands<cr>', { silent = true })

-- coc-yank
vim.keymap.set('n', '<leader>y', ':<C-u>CocList -A --normal yank<cr>', { silent = true })

-- GoTo code navigation.
vim.keymap.set('n', 'gd', '<Plug>(coc-definition)', { silent = true })
vim.keymap.set('n', 'gy', '<Plug>(coc-type-definition)', { silent = true })
vim.keymap.set('n', 'gi', '<Plug>(coc-implementation)', { silent = true })
vim.keymap.set('n', 'gr', '<Plug>(coc-references)', { silent = true })

-- スペースfmtでFormat
vim.keymap.set('n', '<space>fmt', '<Plug>(coc-format)', { silent = true })

-- Use K to show documentation in preview window.
vim.keymap.set('n', 'K', ':call v:lua.show_documentation()<CR>', { silent = true })

-- show_documentation関数をLuaで定義
_G.show_documentation = function()
  local filetype = vim.bo.filetype
  if filetype == 'vim' or filetype == 'help' then
    vim.cmd('h ' .. vim.fn.expand('<cword>'))
  else
    vim.fn.CocActionAsync('doHover')
  end
end

vim.cmd([[
  augroup mygroup
    autocmd!
    " Setup formatexpr specified filetype(s).
    autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
    " Update signature help on jump placeholder.
    autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
  augroup end
]])

-- Remap keys for applying codeAction to the current line.
vim.keymap.set('n', '<C-a>', '<Plug>(coc-codeaction)', { silent = true })
-- Resume latest coc list.
vim.keymap.set('n', '<leader>p', ':<C-u>CocListResume<CR>', { silent = true })

--==============================
-- coc-pairs
-- https://qiita.com/maguro_tuna/items/70814d99aef8f1ddc8e9
--==============================
vim.cmd([[
  inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm() : "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"
]])

--==============================
-- coc-translator
--==============================
vim.keymap.set('n', '<Leader>t', '<Plug>(coc-translator-e)', { silent = true })
vim.keymap.set('v', '<Leader>t', '<Plug>(coc-translator-ev)', { silent = true })

--==============================
-- MarkdownPreview設定
--==============================

vim.keymap.set('n', '<C-s>', '<Plug>MarkdownPreviewStop', { silent = true })
vim.keymap.set('n', '<C-p>', '<Plug>MarkdownPreviewToggle', { silent = true })

--==============================
-- aiAssist設定
--==============================

vim.keymap.set('n', '<leader>a', ':CocCommand aiAssist.quickAssist<CR>', { silent = true })
vim.keymap.set('n', '<leader>ad', ':CocCommand aiAssist.detailedAssist<CR>', { silent = true })
vim.keymap.set('n', '<leader>ac', ':CocCommand aiAssist.selectClient<CR>', { silent = true })
vim.keymap.set('n', '<leader>am', ':CocCommand aiAssist.selectModel<CR>', { silent = true })
vim.keymap.set('n', '<leader>as', ':CocCommand aiAssist.selectSystemPrompt<CR>', { silent = true })
vim.keymap.set('n', '<leader>ah', ':CocCommand aiAssist.showHistory<CR>', { silent = true })

--==============================
-- coc-snippets設定
--==============================

-- Use <C-l> for trigger snippet expand.
vim.keymap.set('i', '<C-l>', '<Plug>(coc-snippets-expand)', { silent = true })

-- Use <C-j> for both expand and jump (make expand higher priority.)
vim.keymap.set('i', '<C-u>', '<Plug>(coc-snippets-expand-jump)', { silent = true })

vim.g.coc_snippet_next = '<tab>'

-- ==============================
-- 入力key表示設定
-- ==============================

require("showkeys").toggle()

-- ==============================
-- snacks設定
-- ==============================

require("snacks").setup({
  picker = {
    previewer = true,
  },
  notifier = {
    enabled = true, -- vim.notifyの見た目改善
  },
  dashboard = {
    enabled = true,
  },
})

local picker = require("snacks.picker")

-- キーマップ例：snacksのpickerを呼び出す
vim.keymap.set("n", "<C-f>", picker.files, { desc = "Find files" })
vim.keymap.set("n", "<C-e>", picker.explorer)
vim.keymap.set("n", "<C-f>b", picker.buffers)
vim.keymap.set("n", "<C-f>p", picker.pickers)
vim.keymap.set("n", "<C-f>r", picker.smart)
vim.keymap.set("n", "<C-f>s", picker.grep)

-- ==============================
-- プラグイン開発設定
-- ==============================

-- vim.cmd('set runtimepath^=~/Documents/coc-claude')
-- vim.keymap.set('n', '<leader>ct', ':CocCommand claude.test<CR>', { silent = true })

-- function ReloadCocExtension()
--   vim.cmd("call CocAction('toggleExtension', 'coc-claude')")
-- end
-- vim.keymap.set("n", "<C-r>", ReloadCocExtension)

-- local function packageReload(moduleName)
--   package.loaded[moduleName] = nil
--   return require(moduleName)
-- end
-- vim.keymap.set("n", "<C-r>", function()
--   packageReload("ai-assistant")
-- end)
