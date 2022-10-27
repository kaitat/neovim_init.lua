--見た目関連の設定
vim.o.synmaxcol = 200
vim.cmd([[ syntax enable ]])
vim.o.t_Co = 256
vim.o.cursorline = false
vim.o.matchtime = 1
vim.o.showcmd = true
vim.o.display = "lastline"
vim.o.number = false
vim.o.relativenumber = true
vim.o.wrap = false
vim.o.title = false
vim.o.scrolloff = 5
vim.o.sidescrolloff = 5
vim.o.pumheight = 30
vim.o.showmode = false
vim.o.showmatch = true
vim.o.foldmethod = "manual"
vim.o.foldlevel = 1
vim.o.foldlevelstart = 99
vim.w.foldcolumn = "0:"
vim.o.cursorlineopt = "number"
vim.o.laststatus = 3
vim.o.shortmess = "aItToOF"
vim.o.cmdheight = 1

-- 設定
vim.g.mapleader = "<Space>"
vim.o.complete = vim.o.complete .. ",k"
vim.o.history = 1000
vim.o.ttimeoutlen = 10
vim.o.timeout = true
vim.o.timeoutlen = 500
vim.o.updatetime = 2000
vim.o.fileformats = "unix,dos,mac"
vim.o.tabstop = 2
vim.o.softtabstop = 0
vim.o.shiftwidth = 2
vim.o.list = true
vim.o.expandtab = true
vim.o.backspace = "indent,eol,start"
vim.o.formatoptions = vim.o.formatoptions .. "m"
vim.o.fixendofline = false
vim.o.wildmenu = true
vim.o.wildmode = "longest,list,full"
vim.o.wrapscan = true
vim.o.ignorecase = true
vim.o.smartcase = true
vim.o.incsearch = true
vim.o.hlsearch = true
vim.o.splitright = true
vim.o.splitbelow = true
vim.o.autoread = true
vim.o.swapfile = false
vim.o.hidden = true
vim.o.backupskip = ""
vim.o.backup = false
vim.o.updatecount = 100
vim.o.undofile = false
vim.o.modeline = false
if vim.fn.has("clipboard") == 1 then
  vim.o.clipboard = "unnamedplus,unnamed"
end
vim.o.errorbells = false
vim.o.visualbell = false
vim.o.sessionoptions = "buffers,curdir,tabpages,winsize,globals"
vim.o.switchbuf = "useopen,uselast"
vim.o.pumblend = 0
vim.o.wildoptions = vim.o.wildoptions .. ",pum"
vim.o.spelllang = "en,cjk"
vim.o.inccommand = "split"
vim.g.vimsyn_embed = "l"
vim.o.diffopt = vim.o.diffopt .. ",vertical,internal,algorithm:patience,iwhite,indent-heuristic"
vim.opt.nrformats:append("unsigned")

-- plugin
local tb = function(value)
  if value == nil then
    return false
  elseif type(value) == "boolean" then
    return value
  elseif type(value) == "number" then
    return value ~= 0
  elseif type(value) == "string" then
    return string.lower(value) == "true"
  else
    return false
  end
end

vim.g.jetpack_copy_method = "symlink"
vim.g.jetpack_optimization = 1
vim.g.jetpack_njobs = 16
vim.g.enabled_snippet = "vsnip"
--vim.g.enabled_snippet = "luasnip"

local status, _ = pcall(vim.cmd, "packadd vim-jetpack")
if not tb(status) then
  local dir = vim.fn.expand(vim.fn.stdpath("data") .. "/site/pack/jetpack/opt/vim-jetpack")
  if not tb(vim.fn.isdirectory(dir)) then
    local url = "https://github.com/tani/vim-jetpack"
    vim.cmd(string.format("!git clone %s %s", url, dir))
  end
  pcall(vim.cmd, "packadd vim-jetpack")
end

local jp = require("jetpack")

local plugin_list = {
  { 'tani/vim-jetpack', as = "jetpack", opt = 1 },
  {"EdenEast/nightfox.nvim", as = "nightfox"},
  { "nvim-lua/plenary.nvim" },
  { "tami5/sqlite.lua" },
  { "tpope/vim-repeat" },
  { "monaqa/peridot.vim", as = "peridot" },
  { "antoinemadec/FixCursorHold.nvim" },
  { "MunifTanjim/nui.nvim" },
  { "kyazdani42/nvim-web-devicons" },
  { "nvim-lua/popup.nvim" },
  { "ray-x/guihua.lua" },
  { "rcarriga/nvim-notify", as = "notify"},
  { "echasnovski/mini.nvim", branch = "stable", as = "mini"},
  { "sidebar-nvim/sidebar.nvim", as = "sidebar"},
  { "phaazon/hop.nvim", as = "hop" },
  { "goolord/alpha-nvim", as = "alpha"},
  { "nvim-neo-tree/neo-tree.nvim", as = "neo-tree", branch = "v2.x"},
  { "machakann/vim-sandwich"},
  { "andymass/vim-matchup" },
  { "AndrewRadev/linediff.vim" },
  { "jghauser/mkdir.nvim" },
  { "akinsho/toggleterm.nvim", as = "toggleterm"},
  { "TimUntersberger/neogit", as = "neogit", on = "Neogit" },
  { "lewis6991/gitsigns.nvim", as = "gitsigns"},
  { "rhysd/git-messenger.vim" },
  { "sindrets/diffview.nvim", as = "diffview"},
  { "kevinhwang91/nvim-hlslens", as = "hlslens" },
  { "nvim-telescope/telescope.nvim", as = "telescope"},
  { "nvim-telescope/telescope-ui-select.nvim"},
  { "nvim-telescope/telescope-file-browser.nvim"},
  { "nvim-telescope/telescope-frecency.nvim"},
  { "nvim-telescope/telescope-fzf-native.nvim", run = "make"},
  { "nvim-telescope/telescope-media-files.nvim"},
  { "nvim-telescope/telescope-symbols.nvim"},
  { "nvim-telescope/telescope-ghq.nvim"},
  { "nvim-telescope/telescope-github.nvim"},
  { "LinArcX/telescope-env.nvim"},
  { "crispgm/telescope-heading.nvim"},
  { "LinArcX/telescope-changes.nvim"},
  { "tknightz/telescope-termfinder.nvim"},
  { "benfowler/telescope-luasnip.nvim"},
  { "kaitat/telescope-ag", as = "telescope-ag"},
  { "neovim/nvim-lspconfig", as = "lspconfig", opt = true },

  { "williamboman/nvim-lsp-installer" },
  { "jose-elias-alvarez/null-ls.nvim", as = "null-ls"},
  { "lukas-reineke/lsp-format.nvim", as = "lsp-format" },
  { "j-hui/fidget.nvim", as = "fidget"},

  { "hrsh7th/nvim-cmp", as = "cmp"},
  { "hrsh7th/cmp-nvim-lsp", as = "cmp_nvim_lsp", opt = true },
  { "hrsh7th/cmp-nvim-lsp-document-symbol", opt = true },
  { "hrsh7th/cmp-nvim-lua", opt = true },
  { "hrsh7th/cmp-nvim-lsp-signature-help", opt = true },
  { "hrsh7th/cmp-buffer", opt = true },
  { "hrsh7th/cmp-path", opt = true },
  { "hrsh7th/cmp-cmdline", opt = true },
  { "hrsh7th/cmp-calc", opt = true },
  { "hrsh7th/cmp-omni", opt = true },
  { "hrsh7th/cmp-emoji", opt = true },
  { "lukas-reineke/cmp-rg", opt = true },
  { "lukas-reineke/cmp-under-comparator", opt = true },
  { "f3fora/cmp-spell", opt = true },
  { "ray-x/cmp-treesitter", opt = true },
  { "yutkat/cmp-mocword", opt = true },
  { "petertriho/cmp-git", as = "cmp_git", opt = true },

  { "nvim-treesitter/nvim-treesitter", run = ":TSUpdate" },
  { "stevearc/aerial.nvim", as = "aerial"},

  { "norcalli/nvim-colorizer.lua", as = "colorizer", on = "" },
  { "m-demare/hlargs.nvim", as = "hlargs" },
  { "RRethy/vim-illuminate", as = "illuminate" },
}

jp.startup(function(use)
  for _, plugin in ipairs(plugin_list) do
    use(plugin)
  end
end)

-- nightfox
local nightfox = require("nightfox")
nightfox.setup({
	options = {
		dim_inactive = true,
	},
})
vim.cmd([[ colorscheme nightfox ]])
local compile_path = vim.fn.stdpath("cache") .. "/colors/nightfox"
if vim.fn.isdirectory(compile_path) == 0 then
	nightfox.compile()
end

-- notify
require("notify").setup({
  icons = {
    ERROR = "✗",
    WARN = "▲",
    INFO = "■",
    DEBUG = "N",
    TRACE = "E",
  },
  timeout = 1000,
  render = "default",
})
vim.notify = function(msg, ...)
  if msg:match("%[lspconfig%]") then
    return
  end

  if msg:match("warning: multiple different client offset_encodings") then
    return
  end

  require("notify")(msg, ...)
end

-- mini
local function mini_setup(pluin_name, options)
  local status, req = pcall(require, pluin_name)
  if status then
    req.setup(options)
  end
end

mini_setup('mini.cursorword',{
  vim.cmd('hi! link MiniCursorword Visual'),
  vim.cmd('hi! MiniCursorword gui=underline guifg=#E27878 guibg=NONE')
})
mini_setup("mini.jump", {
  mappings = {
    forward = "f",
    backward = "F",
    forward_till = "",
    backward_till = "",
    repeat_jump = "",
  },
  delay = {
    highlight = 10,
  },
})
mini_setup("mini.jump2d", {
  mappings = { start_jumping = "<Space><cr>" },
  vim.cmd('highlight MiniJump2dSpot ctermfg=209 ctermbg=NONE cterm=underline,bold guifg=#E27878 guibg=NONE gui=underline,bold')
})
mini_setup("mini.trailspace", {})
mini_setup("mini.pairs", {})

-- sidebar
local sidebar = require("sidebar-nvim")
local opts = {
  disable_default_keybindings = 0,
  bindings = {
    ["q"] = function()
      sidebar.close()
    end,
  },
  open = false,
  side = "left",
  initial_width = 35,
  hide_statusline = false,
  update_interval = 1000,
  sections = {"datetime", "buffers", "diagnostics", "files"},
  section_separator = "-----",
  containers = {
    attach_shell = "/bin/sh",
    show_all = true,
    interval = 5000
  },
  datetime = {format = "%a %b %d, %H:%M", clocks = {{name = "local"}}},
  disable_closing_prompt = false
}
sidebar.setup(opts)
vim.api.nvim_set_keymap("n", "gs", "<Cmd>SidebarNvimFocus<CR>", { noremap = true, silent = true })

-- hop
local hop = require("hop")
hop.setup()

vim.keymap.set({ "n", "v" }, "<Space>j", function()
  hop.hint_words()
end, { silent = true, noremap = true, desc = "hop: hint_words" })
vim.keymap.set({ "n", "v" }, "<Space>s", function()
  hop.hint_char1()
end, { silent = true, noremap = true, desc = "hop: hint_char1" })
vim.keymap.set({ "n", "v" }, "<Space>l", function()
  hop.hint_lines()
end, { silent = true, noremap = true, desc = "hop: hint_lines" })

-- alpha
local alpha = require("alpha")
local dashboard = require("alpha.themes.dashboard")

local function capture(cmd, raw)
  local f = assert(io.popen(cmd, "r"))
  local s = assert(f:read("*a"))
  f:close()
  if raw then
    return s
  end
  s = string.gsub(s, "^%s+", "")
  s = string.gsub(s, "%s+$", "")
  s = string.gsub(s, "[\n\r]+", " ")
  return s
end

local function split(source, sep)
  local result, i = {}, 1
  while true do
    local a, b = source:find(sep)
    if not a then
      break
    end
    local candidat = source:sub(1, a - 1)
    if candidat ~= "" then
      result[i] = candidat
    end
    i = i + 1
    source = source:sub(b + 1)
  end
  if source ~= "" then
    result[i] = source
  end
  return result
end

dashboard.section.header.val = vim.fn.readfile(vim.fn.expand("~/.config/nvim/n.txt"))
dashboard.section.buttons.val = {
  dashboard.button("e", "New file", ":enew<CR>"),
  dashboard.button("f", "Open file", ":Telescope find_files<CR>"),
  dashboard.button("p", "Update plugins", ":JetpackSync<CR>"),
  dashboard.button("q", "Exit", ":qa<CR>"),
}
alpha.setup(dashboard.config)

-- neo-tree
local neo_tree = "neo-tree"

vim.cmd([[
      hi link NeoTreeDirectoryName Directory
      hi link NeoTreeDirectoryIcon NeoTreeDirectoryName
    ]])

local neo_tree = require(neo_tree)
neo_tree.setup({
  close_if_last_window = true,
  popup_border_style = "rounded",
  enable_git_status = true,
  enable_diagnostics = true,
  default_component_configs = {
    indent = {
      indent_size = 2,
      padding = 1, -- extra padding on left hand side
      with_markers = true,
      indent_marker = "│",
      last_indent_marker = "└",
      highlight = "NeoTreeIndentMarker",
    },
    icon = {
      folder_closed = "",
      folder_open = "",
      folder_empty = "ﰊ",
      default = "*",
    },
    name = {
      trailing_slash = false,
      use_git_status_colors = true,
    },
    git_status = {
    },
  },
  event_handlers = {
    {
      event = "file_opened",
      handler = function(file_path)
        --auto close
        neo_tree.close_all()
      end,
    },
    {
      event = "file_added",
      handler = function(file_path)
        require(neo_tree .. "utils").open_file({}, file_path)
      end,
    },
  },
  filesystem = {
    filtered_items = {
      hide_dotfiles = false,
      hide_gitignored = false,
    },
    follow_current_file = true,
    use_libuv_file_watcher = false,
    hijack_netrw_behavior = "open_current",
    window = {
      position = "left",
      width = 30,
      mappings = {
        ["<cr>"] = "open",
        ["l"] = "none",
        ["h"] = "close_node",
        ["s"] = "none",
        ["S"] = "none",
        ["V"] = "open_split",
        ["v"] = "open_vsplit",
        ["<bs>"] = "navigate_up",
        ["."] = "set_root",
        ["H"] = "toggle_hidden",
        ["I"] = "toggle_gitignore",
        ["R"] = "refresh",
        ["/"] = "fuzzy_finder",
        ["f"] = "filter_on_submit",
        ["<c-x>"] = "clear_filter",
        ["a"] = "add",
        ["d"] = "delete",
        ["r"] = "rename",
        ["c"] = "copy_to_clipboard",
        ["x"] = "cut_to_clipboard",
        ["p"] = "paste_from_clipboard",
        ["m"] = "move",
        ["q"] = "close_window",
        ["<esc>"] = "close_window",
        ["t"] = "none",
      },
    },
  },
  buffers = {
    show_unloaded = true,
    window = {
      position = "left",
      mappings = {
        ["<2-LeftMouse>"] = "open",
        ["<cr>"] = "open",
        ["<bs>"] = "navigate_up",
        ["."] = "set_root",
        ["R"] = "refresh",
        ["a"] = "add",
        ["d"] = "delete",
        ["r"] = "rename",
        ["c"] = "copy_to_clipboard",
        ["x"] = "cut_to_clipboard",
        ["p"] = "paste_from_clipboard",
        ["bd"] = "buffer_delete",
      },
    },
  },
  git_status = {
    window = {
      position = "float",
      mappings = {
        ["<2-LeftMouse>"] = "open",
        ["<cr>"] = "open",
        ["C"] = "close_node",
        ["R"] = "refresh",
        ["d"] = "delete",
        ["r"] = "rename",
        ["c"] = "copy_to_clipboard",
        ["x"] = "cut_to_clipboard",
        ["p"] = "paste_from_clipboard",
        ["A"] = "git_add_all",
        ["gu"] = "git_unstage_file",
        ["ga"] = "git_add_file",
        ["gr"] = "git_revert_file",
        ["gc"] = "git_commit",
        ["gp"] = "git_push",
        ["gg"] = "git_commit_and_push",
      },
    },
  },
})

vim.api.nvim_exec(
  [[if isdirectory(expand('%:p')) | exe 'cd %:p:h' | exe 'bd!'| exe 'NeoTreeShowInSplit' | endif]],
  false
)

vim.keymap.set("n", "<Space>eE", "<Cmd>NeoTreeRevealToggle<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<Space>ee", "<Cmd>NeoTreeFloatToggle<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<Space>eg", "<Cmd>NeoTreeFloatToggle git_status<CR>", { noremap = true, silent = true })

-- toggle term
require("toggleterm").setup({
  start_in_insert = true,
  shade_terminals = false,
})
vim.keymap.set("n", "<Space>t", "<cmd>ToggleTerm<cr>", { noremap = true, silent = true })

-- gitsign
require("gitsigns").setup({
  signs = {
    add = { text = "+" },
    change = { text = "~" },
    delete = { text = "_" },
    topdelete = { text = "‾" },
    changedelete = { text = "~_" },
  },
  current_line_blame = true,
  on_attach = function(buffer)
    vim.keymap.set("n", "<Space>gh", "<cmd>Gitsigns preview_hunk<cr>", { silent = true, noremap = true })
    vim.keymap.set("n", "<Space>gd", "<cmd>Gitsigns diffthis<cr>", { silent = true, noremap = true })
    vim.keymap.set("n", "[p", "<cmd>Gitsigns prev_hunk<cr>", { silent = true, noremap = true })
    vim.keymap.set("n", "[n", "<cmd>Gitsigns next_hunk<cr>", { silent = true, noremap = true })
  end,
})

-- hlslens
require("hlslens").setup()

-- telescope
vim.api.nvim_set_keymap("n", ",", "[TeLeader]", {})
vim.keymap.set("n", "[TeLeader]", "<Nop>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "[TeLeader]<cr>", "<cmd>WhichKey [TeLeader]<cr>", { noremap = true })

vim.keymap.set("n", "[TeLeader]f", [[<cmd>Telescope find_files<cr>]], { noremap = true, silent = true })
vim.keymap.set("n", "[TeLeader].", [[<cmd>Telescope<cr>]], { noremap = true, silent = true })
vim.keymap.set("n", "[TeLeader]b", [[<cmd>Telescope buffers<cr>]], { noremap = true, silent = true })
vim.keymap.set("n", "[TeLeader]j", [[<cmd>Telescope jumplist<cr>]], { noremap = true, silent = true })
vim.keymap.set("n", "[TeLeader]o", [[<cmd>Telescope oldfiles<cr>]], { noremap = true, silent = true })
vim.keymap.set("n", "[TeLeader]g", [[<cmd>Telescope git_files<cr>]], { noremap = true, silent = true })
vim.keymap.set("n", "[TeLeader]m", [[<cmd>Telescope marks<cr>]], { noremap = true, silent = true })
vim.keymap.set("n", "[TeLeader]c", [[<cmd>Telescope colorscheme<cr>]], { noremap = true, silent = true })
vim.keymap.set("n", "[TeLeader]d", [[<cmd>Telescope current_buffer_fuzzy_find fuzzy=false case_mode=ignore_case<cr>]], { noremap = true, silent = true })

-- neogit
vim.keymap.set("n", ",t", "<cmd>Neogit<cr>", { silent = true, noremap = true })

-- telescope ag
local key_opts = { noremap = true, silent = false }
vim.keymap.set("n", "<C-g><C-g>", ":Ag ", key_opts)
vim.keymap.set("n", "<C-g><C-r>", ":Ag <C-r><C-w><CR>", key_opts)

-- aerial
require("aerial").setup({
  backends = { "lsp", "treesitter", "markdown" },
  close_behavior = "auto",
  default_bindings = true,
  default_direction = "prefer_right",
  disable_max_lines = 10000,
  filter_kind = {
    "Class",
    "Constructor",
    "Enum",
    "Function",
    "Interface",
    "Module",
    "Method",
    "Struct",
  },
  highlight_mode = "split_width",
  highlight_on_jump = 300,
  link_folds_to_tree = false,
  link_tree_to_folds = true,
  manage_folds = false,
  max_width = 40,
  min_width = 10,
  nerd_font = "auto",
  on_attach = nil,
  open_automatic = false,
  placement_editor_edge = false,
  post_jump_cmd = "normal! zz",
  close_on_select = false,
  show_guides = false,
  float = {
    border = "rounded",
    max_height = 100,
    min_height = 4,
  },
  lsp = {
    diagnostics_trigger_update = true,
    update_when_errors = true,
  },
  treesitter = {
    update_delay = 300,
  },
  markdown = {
    update_delay = 300,
  },
})

vim.keymap.set("n", "<Space>at", "<Cmd>:AerialToggle<CR>", { noremap = true, silent = true })

-- lspconfig
local signs = { Error = " ", Warn = " ", Hint = " ", Info = " " }
-- local signs = { Error = " ", Warn = " ", Hint = "", Info = " " }
for type, icon in pairs(signs) do
  local hl = "DiagnosticSign" .. type
  vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
end
-- lsp-format
require("lsp-format").setup({})
-- fidget
require("fidget").setup()

-- null-ls
local with_root_file = function(...)
  local files = { ... }
  return function(utils)
    return utils.root_has_file(files)
  end
end

local sources = function()
  local null_ls = require("null-ls")
  local diagnostics_format = "[#{c}] #{m} (#{s})"
  local formatting = null_ls.builtins.formatting
  local diagnostics = null_ls.builtins.diagnostics
  local code_actions = null_ls.builtins.code_actions
  local completion = null_ls.builtins.completion.vsnip
  return {
    formatting.prettier.with({
      extra_filetypes = {
        "javascript",
        "javascriptreact",
        "typescript",
        "typescriptreact",
      },
      condition = with_root_file(".prettierrc"),
    }),

    completion,
    diagnostics.editorconfig_checker.with({
      condition = function()
        return vim.fn.executable("ec") > 0
      end,
    }),

    diagnostics.tsc.with({
      diagnostics_format = diagnostics_format,
      condition = with_root_file("deno.json", "deno.jsonc"),
    }),

    formatting.deno_fmt.with({
      condition = with_root_file("deno.json", "deno.jsonc"),
    }),
    diagnostics.hadolint.with({
      diagnostics_format = diagnostics_format,
    }),
    formatting.stylua.with({
      diagnostics_format = diagnostics_format,
      condition = with_root_file({ "stylua.toml", ".stylua.toml" }),
    }),

    formatting.fish_indent,
    code_actions.gitsigns,
  }
end

local capabilities = require("handler").capabilities
local on_attach = require("handler").on_attach
local force_require = require("handler").force_require
require("null-ls").setup({
  on_attach = on_attach,
  capabilities = capabilities,
  sources = sources(),
})

-- cmp
local snippet_library = vim.g.enabled_snippet

vim.o.completeopt = "menuone,noinsert,noselect"

local function setup_dependencies()
  for _, name in ipairs(require("jetpack").names()) do
    if string.find(name, "cmp") then
      pcall(vim.cmd, string.format("packadd %s", name))
      local after_plugin_path = vim.fn.expand(require("jetpack").get(name).path .. "/after/plugin")
      if vim.fn.isdirectory(after_plugin_path) then
        for _, path in ipairs(vim.fn.glob(after_plugin_path .. "/*[.lua,.vim]", 1, 1, 1)) do
          vim.cmd(string.format("source %s", vim.fn.fnameescape(path)))
        end
      end
    end
  end
end

  local cmp = require("cmp")
  local types = require("cmp.types")
  local t = function(str)
    return vim.api.nvim_replace_termcodes(str, true, true, true)
  end
  local _, luasnip = force_require("luasnip")

  local has_words_before = function()
    local line, col = unpack(vim.api.nvim_win_get_cursor(0))
    return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
  end

  local snippet_jumpable = function(dir)
    if snippet_library == "vsnip" then
      return tb(vim.fn["vsnip#jumpable"](dir))
    elseif snippet_library == "luasnip" and luasnip ~= nil then
      return tb(luasnip.jumpable(dir))
    end
    return false
  end

  local snippet_jump = function(dir)
    if snippet_library == "vsnip" then
      if dir == 1 then
        vim.fn.feedkeys(t("<Plug>(vsnip-jump-next)"), "")
      elseif dir == -1 then
        vim.fn.feedkeys(t("<Plug>(vsnip-jump-prev)"), "")
      end
    elseif snippet_library == "luasnip" and luasnip ~= nil then
      luasnip.jump(dir)
    end
  end

  setup_dependencies()

  local setup_opt = {
    snippet = {
      expand = function(args)
        if snippet_library == "vsnip" then
          vim.fn["vsnip#anonymous"](args.body)
        elseif snippet_library == "luasnip" and luasnip ~= nil then
          luasnip.lsp_expand(args.body)
        end
      end,
    },

    mapping = cmp.mapping.preset.insert({
      ["<C-l>"] = cmp.mapping({
        i = cmp.mapping.abort(),
        c = cmp.mapping.close(),
      }),
      ["<C-y>"] = cmp.config.disable,
      ["<C-j>"] = cmp.mapping.select_next_item(),
      ["<C-k>"] = cmp.mapping.select_prev_item(),
      ["<C-d>"] = cmp.mapping.scroll_docs(-4),
      ["<C-f>"] = cmp.mapping.scroll_docs(4),
      ["<CR>"] = function(fallback)
        local entry = cmp.get_selected_entry()
        if cmp.visible() and entry ~= nil then
          local confirm_option = {
            select = false,
            behavior = entry.source.name == "copilot" and cmp.ConfirmBehavior.Insert or cmp.ConfirmBehavior.Replace,
          }
          cmp.confirm(confirm_option)
        else
          fallback()
        end
      end,
      ["<Tab>"] = cmp.mapping(function(fallback)
        if cmp.visible() then
          cmp.select_next_item()
        elseif snippet_jumpable(1) then
          snippet_jump(1)
        elseif has_words_before() then
          cmp.complete()
        else
          fallback()
        end
      end, { "i", "s" }),

      ["<S-Tab>"] = cmp.mapping(function(fallback)
        if cmp.visible() then
          cmp.select_prev_item()
        elseif snippet_jumpable(-1) then
          snippet_jump(-1)
        elseif vim.g.loaded_copilot then
          vim.api.nvim_feedkeys(vim.fn["copilot#Accept"](t("<Tab>")), "n", true)
        else
          fallback()
        end
      end, { "i", "s" }),
    }),

    sorting = {
      comparators = {
        cmp.config.compare.offset,
        cmp.config.compare.exact,
        cmp.config.compare.score,
        require("cmp-under-comparator").under,
        function(entry1, entry2)
          local kind1 = entry1:get_kind()
          kind1 = kind1 == types.lsp.CompletionItemKind.Text and 100 or kind1
          local kind2 = entry2:get_kind()
          kind2 = kind2 == types.lsp.CompletionItemKind.Text and 100 or kind2
          if kind1 ~= kind2 then
            if kind1 == types.lsp.CompletionItemKind.Snippet then
              return false
            end
            if kind2 == types.lsp.CompletionItemKind.Snippet then
              return true
            end
            local diff = kind1 - kind2
            if diff < 0 then
              return true
            elseif diff > 0 then
              return false
            end
          end
        end,
        cmp.config.compare.sort_text,
        cmp.config.compare.length,
        cmp.config.compare.order,
      },
    },

    sources = cmp.config.sources({
      { name = "copilot" },
      -- { name = "rg" },
      { name = "vsnip" },
      { name = "luasnip" },
      { name = "nvim_lsp" },
      { name = "path" },
      { name = "emoji", insert = true },
      { name = "nvim_lua" },
      { name = "nvim_lsp_signature_help" },
    }, {
      { name = "buffer" },
      { name = "omni" },
      { name = "calc" },
      { name = "spell" },
      { name = "treesitter" },
      { name = "git" },
      { name = "dictionary", keyword_length = 2 },
      { name = "look", keyword_length = 2, option = { convert_case = true, loud = true } },
    }),
    completion = {
      completeopt = "menu,menuone,noinsert,noselect",
    },
    experimental = {
      ghost_text = false,
    },
  }

  local status_lspkind, lspkind = force_require("lspkind")
  if status_lspkind then
    setup_opt.formatting = {
      format = lspkind.cmp_format({
        mode = "symbol",
        maxwidth = 50,
        menu = {
          nvim_lsp = "[LSP]",
          buffer = "[Buffer]",
          path = "[Path]",
          nvim_lua = "[Lua]",
          ultisnips = "[UltiSnips]",
          vsnip = "[vSnip]",
          luasnip = "[LuaSnip]",
          treesitter = "[TS]",
          spell = "[Spell]",
          calc = "[Calc]",
          emoji = "[Emoji]",
          neorg = "[Neorg]",
          rg = "[rg]",
          omni = "[Omni]",
          cmp_tabnine = "[Tabnine]",
          nvim_lsp_signature_help = "[Signature]",
          copilot = "[Copilot]",
          cmdline_history = "[History]",
          mocword = "[Mocword]",
          dictionary = "[Dictionary]",
          look = "[Look]",
          git = "[Git]",
        },
      }),
    }
  end

  cmp.setup(setup_opt)

  cmp.setup.filetype({ "gitcommit", "markdown" }, {
    sources = cmp.config.sources({
      { name = "copilot" },
      -- { name = "rg" },
      { name = "vsnip" },
      { name = "luasnip" },
      { name = "nvim_lsp" },
      { name = "path" },
      { name = "emoji", insert = true },
    }, {
      { name = "buffer" },
      { name = "omni" },
      { name = "spell" },
      { name = "calc" },
      { name = "treesitter" },
      { name = "git" },
      { name = "mocword" },
      { name = "dictionary", keyword_length = 2 },
      { name = "look", keyword_length = 2, option = { convert_case = true, loud = true } },
    }),
  })

  cmp.setup.cmdline("/", {
    mapping = cmp.mapping.preset.cmdline(),
    sources = cmp.config.sources({
      { name = "nvim_lsp_document_symbol" },
      -- { name = "cmdline_history" },
      { name = "cmdline" },
    }, {
      { name = "buffer" },
    }),
    completion = {
      completeopt = "menu,menuone,noselect",
    },
  })

  cmp.setup.cmdline(":", {
    mapping = cmp.mapping.preset.cmdline(),
    sources = cmp.config.sources({ { name = "path" } }, { { name = "cmdline" }, { { name = "cmdline_history" } } }),
    completion = {
      completeopt = "menu,menuone,noselect",
    },
  })

  vim.cmd([[highlight! default link CmpItemKind CmpItemMenuDefault]])

  local status_tn, _ = force_require("cmp-tabnine")
  if status_tn then
    require("cmp_tabnine.config"):setup({
      max_lines = 1000,
      max_num_results = 5,
      sort = true,
      run_on_every_keystroke = true,
      snippet_placeholder = "..",
    })
  end

  local status_git, _ = force_require("cmp_git")
  if status_git then
    require("cmp_git").setup()
  end

  local status_autopairs, _ = force_require("nvim-autopairs")
  if status_autopairs then
    local cmp_autopairs = require("nvim-autopairs.completion.cmp")
    cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done({ map_char = { tex = "" } }))
  end

-- nvim-lsp-installer
local function loading()
  local status, lspinstaller = force_require("nvim-lsp-installer")
  if not status then
    return
  end

  local lsp_status, lspconfig = force_require("lspconfig")
  if not lsp_status or not lspconfig then
    return
  end
  local lsp_util = lspconfig.util

  lspinstaller.setup({
    ui = {
      icons = {
        server_installed = "✓",
        server_pending = "➜",
        server_uninstalled = "✗",
      },
    },
  })

  for _, server in ipairs(lspinstaller.get_installed_servers()) do
    local opts = { capabilities = capabilities, on_attach = on_attach }
    local name = server.name

    local web_filetypes= {
        "javascript",
        "javascriptreact",
        "javascript.jsx",
        "typescript",
        "typescriptreact",
        "typescript.tsx",
        "vue",
        "svelte",
      }

    if "emmet_ls" == name then
      opts.filetypes =web_filetypes
    elseif "eslint" == name then
      opts.root_dir = lsp_util.root_pattern(".eslintrc", ".eslintrc.js", ".eslintrc.cjs", ".eslintrc.json")
      opts.filetypes = web_filetypes
      opts.settings = {
        format = { enable = true },
      }
    elseif "tsserver" == name then
      local ts_status, ts = force_require("typescript")
      if ts_status and ts ~= nil then
        ts.setup({
          server = opts,
          disable_commands = false,
        })
        goto continue
      end
    elseif "denols" == name then
      opts.root_dir = lspconfig.util.root_pattern("deno.json", "deno.jsonc")
      opts.init_options = { lint = true, unstable = true }
    elseif "sumneko_lua" == name then
      local status_lua_dev, lua_dev = force_require("lua-dev")
      if status_lua_dev then
        local luadev = lua_dev.setup({
          library = {
            vimruntime = true,
            types = true,
            plugins = true,
            -- plugins = { "nvim-treesitter", "plenary.nvim" },
          },
          runtime_path = false,
          lspconfig = {
            on_attach = on_attach,
            flags = {
              debounce_text_changes = 150,
            },
            capabilities = capabilities,
            settings = {
              Lua = {
                diagnostics = {
                  globals = { "vim" },
                },
              },
            },
          },
        })
        lspconfig[server.name].setup(luadev)
        goto continue
      end
    end

    lspconfig[name].setup(opts)
    ::continue::
    vim.cmd([[ do User LspAttachBuffers ]])
  end
end

vim.api.nvim_create_autocmd({ "BufReadPre", "BufNewFile" }, {
  callback = loading,
  once = true,
})

