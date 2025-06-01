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
  -- 多言語シンタックスチェック
  'sheerun/vim-polyglot',

  -- mason と nvim-lspconfig のブリッジ
  {
    "mason-org/mason-lspconfig.nvim",
    opts = {},
    dependencies = {
      -- さまざまな LSP サーバに基本的な Nvim LSP クライアント構成を提供
      "neovim/nvim-lspconfig",
      -- LSPサーバーのマネージャー
      "mason-org/mason.nvim",
    },
  },
  -- blink.cmp 本体は補完UI（メニュー）を提供。
  {
    "saghen/blink.cmp",
    version = "1.*"
  },
  -- cmp-nvim-lsp は LSP との補完統合用アダプタ。

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

  {
    "prettier/vim-prettier",
    ft = {
      "javascript", "typescript", "css", "scss", "html",
      "json", "markdown", "graphql", "vue", "yaml"
    },
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
  'numToStr/Comment.nvim',

  -- 画像をコピペでインサートできるようにするプラグイン
  'sika7/dropmd.nvim',

  -- ワークスペースのlua設定ファイルを読むプラグイン
  'sika7/workspace-config.nvim',

  -- gitの差分表示するためのプラグイン
  'lewis6991/gitsigns.nvim',

  -- カッコをいい感じにしてくれるプラグイン
  { 'echasnovski/mini.pairs', version = '*' },

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
require('Comment').setup()

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

local picker = Snacks.picker

-- キーマップ例：snacksのpickerを呼び出す
vim.keymap.set("n", "<C-f>", picker.files, { desc = "Find files" })
vim.keymap.set("n", "<C-e>", picker.explorer)
vim.keymap.set("n", "<Leader>b", function () picker.buffers({ layout = { preset = "ivy" } }) end)
vim.keymap.set("n", "<Leader>p", picker.pickers)
vim.keymap.set("n", "<Leader>r", picker.smart)
vim.keymap.set("n", "<Leader>g", picker.grep)

--==============================
-- git差分表示のためのプラグイン
--==============================

local gitsigns = require('gitsigns')
gitsigns.setup({
  signs = {
    add = { text = "+" },
    change = { text = "~" },
    delete = { text = "-" },
    topdelete = { text = "‾" },
    changedelete = { text = "~" },
  },
})

-- Actions
vim.keymap.set('n', '<leader>hs', gitsigns.stage_hunk)
vim.keymap.set('n', '<leader>hr', gitsigns.reset_hunk)
vim.keymap.set('v', '<leader>hs', function() gitsigns.stage_hunk {vim.fn.line('.'), vim.fn.line('v')} end)
vim.keymap.set('v', '<leader>hr', function() gitsigns.reset_hunk {vim.fn.line('.'), vim.fn.line('v')} end)
vim.keymap.set('n', '<leader>hS', gitsigns.stage_buffer)
vim.keymap.set('n', '<leader>hu', gitsigns.undo_stage_hunk)
vim.keymap.set('n', '<leader>hR', gitsigns.reset_buffer)
vim.keymap.set('n', '<leader>hp', gitsigns.preview_hunk)
vim.keymap.set('n', '<leader>hb', function() gitsigns.blame_line{full=true} end)
vim.keymap.set('n', '<leader>tb', gitsigns.toggle_current_line_blame)
vim.keymap.set('n', '<leader>hd', gitsigns.diffthis)
vim.keymap.set('n', '<leader>hD', function() gitsigns.diffthis('~') end)
vim.keymap.set('n', '<leader>td', gitsigns.toggle_deleted)

--==============================
-- LSP Sever management
--==============================
local mason = require("mason")
local mason_lspconfig = require("mason-lspconfig")
local lspconfig = require("lspconfig")

-- lua langのセットアップ(nvim用)
lspconfig.lua_ls.setup({
  settings = {
    Lua = {
      runtime = {
        version = "LuaJIT", -- Neovim は LuaJIT ベース
        path = vim.split(package.path, ";"),
      },
      diagnostics = {
        globals = { "vim" }, -- "vim" グローバルを未定義として警告しない
      },
      workspace = {
        library = vim.api.nvim_get_runtime_file("", true),
        checkThirdParty = false, -- 依存パッケージのチェックを無効化（誤警告対策）
      },
      telemetry = {
        enable = false, -- 解析情報の送信を無効化（プライバシー）
      },
    },
  },
})

mason.setup()
local lsp_servers = { "lua_ls", "ts_ls", "pyright", "jsonls", "yamlls", "rust_analyzer", "html" }
local diagnostics = { "typos_lsp" }

local capabilities = require("blink.cmp").get_lsp_capabilities()
mason_lspconfig.setup({
  ensure_installed = vim.tbl_flatten({ lsp_servers, diagnostics }),
  automatic_installation = true,
  handlers = {
    function(server_name)
      lspconfig.typos_lsp.setup({})

      lspconfig[server_name].setup({
        capabilities = capabilities
      })
    end,
  },
})

--==============================
-- blink.cmp 本体は補完UI（メニュー）を提供
-- https://eiji.page/blog/neovim-blink-cmp-intro/
--==============================
require("blink.cmp").setup({
  sources = {
    { name = "nvim_lsp" },
    default = { "lsp", "path", "snippets", "buffer" },
  },
  snippets = {}, -- 使用するスニペットエンジンを指定
  completion = {
    accept = {
      auto_brackets = {
        enabled = true, -- 自動括弧補完を有効化
      },
    },
    menu = { border = 'single' },
    documentation = {
      window = { border = 'single' },
      auto_show = true,         -- ドキュメントの自動表示を有効化
      auto_show_delay_ms = 200, -- 表示までの遅延時間（ミリ秒）
    },
  },
  signature = { window = { border = 'single' } },
  keymap = {
    preset = "enter",
    ['<Tab>'] = { 'select_next', 'fallback' },
    -- ["<C-u>"] = { "scroll_documentation_up", "fallback" },
    -- ["<C-d>"] = { "scroll_documentation_down", "fallback" },
    -- ["<C-b>"] = {},
    -- ["<C-f>"] = {},
  },
})


local function smart_hover()
  local bufnr = vim.api.nvim_get_current_buf()
  local params = {
    textDocument = vim.lsp.util.make_text_document_params(),
    position = vim.api.nvim_win_get_cursor(0)
  }

  for _, client in ipairs(vim.lsp.get_active_clients({ bufnr = bufnr })) do
    if type(client.supports_method) == "function" and client.supports_method("textDocument/signatureHelp") then
      client.request("textDocument/signatureHelp", params, function(err, result)
        if result and result.signatures and #result.signatures > 0 then
          vim.lsp.buf.signature_help()
        else
          vim.lsp.buf.hover()
        end
      end, bufnr)
      return
    end
  end

  vim.lsp.buf.hover()
end


-- -- カーソル下の変数の情報
vim.keymap.set('n', 'K', smart_hover)
-- 定義ジャンプ
vim.keymap.set('n', 'gd', function () picker.lsp_definitions({ layout = { preset = "ivy" } }) end)
-- 実装へジャンプ
vim.keymap.set('n', 'gi', function () picker.lsp_implementations({ layout = { preset = "ivy" } }) end)
-- 定義ジャンプ後に下のファイルに戻る
-- vim.keymap.set('n', 'gr', '<C-t>')
vim.keymap.set('n', 'gr', function () picker.lsp_references({ layout = { preset = "ivy" } }) end)
-- カーソル下の変数をコード内で参照している箇所
vim.keymap.set('n', 'gy', function () picker.lsp_declarations({ layout = { preset = "ivy" } }) end)

-- Error/Warning/Hintの実行可能な修正の候補を表示
vim.keymap.set('n', 'ga', '<cmd>lua vim.lsp.buf.code_action()<CR>')

-- type_definition???
vim.keymap.set('n', 'gt', function () picker.lsp_type_definitions({ layout = { preset = "ivy" } }) end)

vim.keymap.set('n', 'gn', '<cmd>lua vim.diagnostic.goto_next()<CR>')
vim.keymap.set('n', 'gp', '<cmd>lua vim.diagnostic.goto_prev()<CR>')

--==============================
-- coc.nvim (lsp)
--==============================

-- coc color setting
vim.cmd([[
  highlight CocErrorSign ctermfg=15 ctermbg=196
  highlight CocWarningSign ctermfg=0 ctermbg=172
  " hi CocCursorRange guibg=#b16286 guifg=#ebdbb2
]])

--==============================
-- Prettier
--==============================

-- キーマップ: <leader>p で Prettier を実行
vim.keymap.set('n', '<leader>fmt', ':Prettier<CR>', { noremap = true, silent = true, desc = "Format with Prettier" })

--==============================
-- MarkdownPreview設定
--==============================

vim.keymap.set('n', '<C-s>', '<Plug>MarkdownPreviewStop', { silent = true })
vim.keymap.set('n', '<C-p>', '<Plug>MarkdownPreviewToggle', { silent = true })

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

-- ==============================
-- 入力key表示設定
-- ==============================

require("showkeys").toggle()

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
