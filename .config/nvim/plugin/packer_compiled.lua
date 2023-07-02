-- Automatically generated packer.nvim plugin loader code

if vim.api.nvim_call_function('has', {'nvim-0.5'}) ~= 1 then
  vim.api.nvim_command('echohl WarningMsg | echom "Invalid Neovim version for packer.nvim! | echohl None"')
  return
end

vim.api.nvim_command('packadd packer.nvim')

local no_errors, error_msg = pcall(function()

_G._packer = _G._packer or {}
_G._packer.inside_compile = true

local time
local profile_info
local should_profile = false
if should_profile then
  local hrtime = vim.loop.hrtime
  profile_info = {}
  time = function(chunk, start)
    if start then
      profile_info[chunk] = hrtime()
    else
      profile_info[chunk] = (hrtime() - profile_info[chunk]) / 1e6
    end
  end
else
  time = function(chunk, start) end
end

local function save_profiles(threshold)
  local sorted_times = {}
  for chunk_name, time_taken in pairs(profile_info) do
    sorted_times[#sorted_times + 1] = {chunk_name, time_taken}
  end
  table.sort(sorted_times, function(a, b) return a[2] > b[2] end)
  local results = {}
  for i, elem in ipairs(sorted_times) do
    if not threshold or threshold and elem[2] > threshold then
      results[i] = elem[1] .. ' took ' .. elem[2] .. 'ms'
    end
  end
  if threshold then
    table.insert(results, '(Only showing plugins that took longer than ' .. threshold .. ' ms ' .. 'to load)')
  end

  _G._packer.profile_output = results
end

time([[Luarocks path setup]], true)
local package_path_str = "/home/vantm/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?.lua;/home/vantm/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?/init.lua;/home/vantm/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?.lua;/home/vantm/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?/init.lua"
local install_cpath_pattern = "/home/vantm/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/lua/5.1/?.so"
if not string.find(package.path, package_path_str, 1, true) then
  package.path = package.path .. ';' .. package_path_str
end

if not string.find(package.cpath, install_cpath_pattern, 1, true) then
  package.cpath = package.cpath .. ';' .. install_cpath_pattern
end

time([[Luarocks path setup]], false)
time([[try_loadstring definition]], true)
local function try_loadstring(s, component, name)
  local success, result = pcall(loadstring(s), name, _G.packer_plugins[name])
  if not success then
    vim.schedule(function()
      vim.api.nvim_notify('packer.nvim: Error running ' .. component .. ' for ' .. name .. ': ' .. result, vim.log.levels.ERROR, {})
    end)
  end
  return result
end

time([[try_loadstring definition]], false)
time([[Defining packer_plugins]], true)
_G.packer_plugins = {
  ["aerial.nvim"] = {
    config = { "\27LJ\2\nâ\1\0\1\b\0\n\0\0286\1\0\0009\1\1\0019\1\2\1\18\3\0\0'\4\3\0'\5\4\0'\6\5\0004\a\0\0B\1\6\0016\1\0\0009\1\1\0019\1\2\1\18\3\0\0'\4\3\0'\5\6\0'\6\a\0004\a\0\0B\1\6\0016\1\0\0009\1\1\0019\1\2\1\18\3\0\0'\4\3\0'\5\b\0'\6\t\0004\a\0\0B\1\6\1K\0\1\0\24<cmd>AerialNext<CR>\6}\24<cmd>AerialPrev<CR>\6{\27<cmd>AerialToggle!<CR>\14<leader>o\6n\24nvim_buf_set_keymap\bapi\bvimN\1\0\4\0\6\0\t6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\4\0003\3\3\0=\3\5\2B\0\2\1K\0\1\0\14on_attach\1\0\0\0\nsetup\vaerial\frequire\0" },
    loaded = true,
    path = "/home/vantm/.local/share/nvim/site/pack/packer/start/aerial.nvim",
    url = "https://github.com/stevearc/aerial.nvim"
  },
  ["barbar.nvim"] = {
    config = { "\27LJ\2\nª\1\0\0\5\0\n\0\r6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0005\3\4\0005\4\5\0=\4\6\3=\3\a\0025\3\b\0=\3\t\2B\0\2\1K\0\1\0\22sidebar_filetypes\1\0\1\rNvimTree\1\nicons\rfiletype\1\0\1\fenabled\1\1\0\1\18buffer_number\2\1\0\1\14animation\1\nsetup\vbarbar\frequire\0" },
    loaded = true,
    path = "/home/vantm/.local/share/nvim/site/pack/packer/start/barbar.nvim",
    url = "https://github.com/romgrk/barbar.nvim"
  },
  ["cmp-buffer"] = {
    loaded = true,
    path = "/home/vantm/.local/share/nvim/site/pack/packer/start/cmp-buffer",
    url = "https://github.com/hrsh7th/cmp-buffer"
  },
  ["cmp-cmdline"] = {
    loaded = true,
    path = "/home/vantm/.local/share/nvim/site/pack/packer/start/cmp-cmdline",
    url = "https://github.com/hrsh7th/cmp-cmdline"
  },
  ["cmp-nvim-lsp"] = {
    loaded = true,
    path = "/home/vantm/.local/share/nvim/site/pack/packer/start/cmp-nvim-lsp",
    url = "https://github.com/hrsh7th/cmp-nvim-lsp"
  },
  ["cmp-path"] = {
    loaded = true,
    path = "/home/vantm/.local/share/nvim/site/pack/packer/start/cmp-path",
    url = "https://github.com/hrsh7th/cmp-path"
  },
  ["gitsigns.nvim"] = {
    config = { "\27LJ\2\n6\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\rgitsigns\frequire\0" },
    loaded = true,
    path = "/home/vantm/.local/share/nvim/site/pack/packer/start/gitsigns.nvim",
    url = "https://github.com/lewis6991/gitsigns.nvim"
  },
  ["hop.nvim"] = {
    config = { "\27LJ\2\n1\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\bhop\frequire\0" },
    loaded = true,
    path = "/home/vantm/.local/share/nvim/site/pack/packer/start/hop.nvim",
    url = "https://github.com/phaazon/hop.nvim"
  },
  ["lualine.nvim"] = {
    config = { "\27LJ\2\nÙ\2\0\0\5\0\20\0\0236\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\4\0005\3\3\0=\3\5\0025\3\a\0005\4\6\0=\4\b\0035\4\t\0=\4\n\0035\4\v\0=\4\f\0035\4\r\0=\4\14\0035\4\15\0=\4\16\0035\4\17\0=\4\18\3=\3\19\2B\0\2\1K\0\1\0\rsections\14lualine_z\1\2\0\0\rlocation\14lualine_y\1\2\0\0\rprogress\14lualine_x\1\4\0\0\vspaces\rencoding\rfiletype\14lualine_c\1\2\0\0\14filenames\14lualine_b\1\3\0\0\vbranch\tdiff\14lualine_a\1\0\0\1\2\0\0\tmode\foptions\1\0\0\1\0\3\17globalstatus\2\ntheme\rcodedark\18icons_enabled\1\nsetup\flualine\frequire\0" },
    loaded = true,
    path = "/home/vantm/.local/share/nvim/site/pack/packer/start/lualine.nvim",
    url = "https://github.com/nvim-lualine/lualine.nvim"
  },
  ["mason-lspconfig.nvim"] = {
    loaded = true,
    path = "/home/vantm/.local/share/nvim/site/pack/packer/start/mason-lspconfig.nvim",
    url = "https://github.com/williamboman/mason-lspconfig.nvim"
  },
  ["mason.nvim"] = {
    config = { "\27LJ\2\nã\1\0\0\4\0\b\0\0216\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\0016\0\0\0'\2\3\0B\0\2\0029\0\2\0005\2\5\0005\3\4\0=\3\6\2B\0\2\0016\0\0\0'\2\a\0B\0\2\0029\0\2\0004\2\0\0B\0\2\1K\0\1\0\fnull-ls\21ensure_installed\1\0\1\27automatic_installation\2\1\6\0\0\vlua_ls\fpyright\rtsserver\18rust_analyzer\ngopls\20mason-lspconfig\nsetup\nmason\frequire\0" },
    loaded = true,
    path = "/home/vantm/.local/share/nvim/site/pack/packer/start/mason.nvim",
    url = "https://github.com/williamboman/mason.nvim"
  },
  ["null-ls.nvim"] = {
    loaded = true,
    path = "/home/vantm/.local/share/nvim/site/pack/packer/start/null-ls.nvim",
    url = "https://github.com/jose-elias-alvarez/null-ls.nvim"
  },
  ["nvim-cmp"] = {
    config = { "\27LJ\2\n—\1\0\0\6\0\b\2\0276\0\0\0009\0\1\0009\0\2\0'\2\3\0B\0\2\2\23\0\0\0\b\0\1\0X\1\17€6\1\0\0009\1\1\0019\1\4\1'\3\3\0B\1\2\2\18\3\1\0009\1\5\1\18\4\0\0\18\5\0\0B\1\4\2\18\3\1\0009\1\6\1'\4\a\0B\1\3\2X\2\3€+\1\1\0X\2\1€+\1\2\0L\1\2\0\a%s\nmatch\bsub\fgetline\6.\bcol\afn\bvim\2\0p\0\1\3\2\2\0\19-\1\0\0009\1\0\1B\1\1\2\15\0\1\0X\2\4€-\1\0\0009\1\1\1B\1\1\1X\1\t€-\1\1\0B\1\1\2\15\0\1\0X\2\3€\18\1\0\0B\1\1\1X\1\2€\18\1\0\0B\1\1\1K\0\1\0\0À\1À\21select_next_item\fvisibleR\0\1\3\1\2\0\f-\1\0\0009\1\0\1B\1\1\2\15\0\1\0X\2\4€-\1\0\0009\1\1\1B\1\1\1X\1\2€\18\1\0\0B\1\1\1K\0\1\0\0À\21select_prev_item\fvisible³\t\1\0\r\0F\0\0016\0\0\0'\2\1\0B\0\2\0023\1\2\0009\2\3\0005\4\4\0004\5\0\0=\5\5\0049\5\6\0009\5\a\0059\5\b\0055\a\n\0009\b\6\0009\b\t\bB\b\1\2=\b\v\a9\b\6\0009\b\f\bB\b\1\2=\b\r\a9\b\6\0009\n\6\0009\n\14\n)\fÿÿB\n\2\0025\v\15\0B\b\3\2=\b\16\a9\b\6\0009\n\6\0009\n\14\n)\f\1\0B\n\2\0025\v\17\0B\b\3\2=\b\18\a9\b\6\0009\n\6\0009\n\19\nB\n\1\0025\v\20\0B\b\3\2=\b\21\a9\b\6\0005\n\23\0009\v\6\0009\v\22\vB\v\1\2=\v\24\n9\v\6\0009\v\25\vB\v\1\2=\v\26\nB\b\2\2=\b\27\a9\b\6\0009\b\28\b5\n\29\0B\b\2\2=\b\30\a9\b\6\0003\n\31\0005\v \0B\b\3\2=\b!\a9\b\6\0003\n\"\0005\v#\0B\b\3\2=\b$\aB\5\2\2=\5\6\0044\5\5\0005\6%\0>\6\1\0055\6&\0>\6\2\0055\6'\0>\6\3\0055\6(\0>\6\4\5=\5)\0045\5,\0009\6*\0009\6+\6=\6-\5=\5.\4B\2\2\0019\2\3\0009\2/\0025\0040\0005\0051\0009\6\6\0009\6\a\0069\6/\6B\6\1\2=\6\6\0054\6\3\0005\a2\0>\a\1\6=\6)\5B\2\3\0019\2\3\0009\2/\2'\0043\0005\0054\0009\6\6\0009\6\a\0069\6/\6B\6\1\2=\6\6\0059\0065\0009\6)\0064\b\3\0005\t6\0>\t\1\b4\t\3\0005\n7\0>\n\1\tB\6\3\2=\6)\5B\2\3\0016\2\0\0'\0048\0B\2\2\0026\3\0\0'\0059\0B\3\2\0029\3:\3B\3\1\0029\4;\0029\4\3\0045\6<\0=\3=\6B\4\2\0019\4>\0029\4\3\0045\6?\0=\3=\6B\4\2\0019\4@\0029\4\3\0045\6A\0=\3=\6B\4\2\0019\4B\0029\4\3\0045\6C\0=\3=\6B\4\2\0019\4D\0029\4\3\0045\6E\0=\3=\6B\4\2\0012\0\0€K\0\1\0\1\0\0\ngopls\1\0\0\18rust_analyzer\1\0\0\rtsserver\1\0\0\fpyright\17capabilities\1\0\0\vlua_ls\25default_capabilities\17cmp_nvim_lsp\14lspconfig\1\0\1\tname\fcmdline\1\0\1\tname\tpath\vconfig\1\0\0\6:\1\0\1\tname\vbuffer\1\0\0\1\3\0\0\6/\6?\fcmdline\17confirm_opts\rbehavior\1\0\1\vselect\1\fReplace\20ConfirmBehavior\fsources\1\0\1\tname\tpath\1\0\1\tname\vbuffer\1\0\1\tname\rnvim_lua\1\0\1\tname\rnvim_lsp\f<S-Tab>\1\3\0\0\6i\6s\0\n<Tab>\1\3\0\0\6i\6s\0\t<CR>\1\0\1\vselect\2\fconfirm\n<C-e>\6c\nclose\6i\1\0\0\nabort\14<C-Space>\1\3\0\0\6i\6c\rcomplete\n<C-f>\1\3\0\0\6i\6c\n<C-b>\1\3\0\0\6i\6c\16scroll_docs\n<C-j>\21select_next_item\n<C-k>\1\0\0\21select_prev_item\vinsert\vpreset\fmapping\fsnippet\1\0\0\nsetup\0\bcmp\frequire\0" },
    loaded = true,
    path = "/home/vantm/.local/share/nvim/site/pack/packer/start/nvim-cmp",
    url = "https://github.com/hrsh7th/nvim-cmp"
  },
  ["nvim-dap"] = {
    loaded = true,
    path = "/home/vantm/.local/share/nvim/site/pack/packer/start/nvim-dap",
    url = "https://github.com/mfussenegger/nvim-dap"
  },
  ["nvim-lspconfig"] = {
    loaded = true,
    path = "/home/vantm/.local/share/nvim/site/pack/packer/start/nvim-lspconfig",
    url = "https://github.com/neovim/nvim-lspconfig"
  },
  ["nvim-treesitter"] = {
    config = { "\27LJ\2\nâ\1\0\0\4\0\b\0\v6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\4\0005\3\3\0=\3\5\0025\3\6\0=\3\a\2B\0\2\1K\0\1\0\14highlight\1\0\1\venable\2\21ensure_installed\1\0\0\1\17\0\0\6c\blua\bvim\vvimdoc\ago\trust\15typescript\15javascript\thtml\bcss\tscss\fc_sharp\bsql\rmarkdown\tjson\tyaml\nsetup\28nvim-treesitter.configs\frequire\0" },
    loaded = true,
    path = "/home/vantm/.local/share/nvim/site/pack/packer/start/nvim-treesitter",
    url = "https://github.com/nvim-treesitter/nvim-treesitter"
  },
  ["omnisharp-extended-lsp.nvim"] = {
    loaded = true,
    path = "/home/vantm/.local/share/nvim/site/pack/packer/start/omnisharp-extended-lsp.nvim",
    url = "https://github.com/Hoffs/omnisharp-extended-lsp.nvim"
  },
  ["omnisharp-vim"] = {
    config = { "\27LJ\2\n…\4\0\0\t\0\27\1/6\0\0\0009\0\1\0009\0\2\0B\0\1\2'\1\3\0006\2\0\0009\2\4\0029\2\5\2B\2\1\0029\2\6\2\a\2\a\0X\2\a€6\2\b\0009\2\t\2'\4\n\0B\2\2\2'\3\v\0&\1\3\2X\2\6€6\2\b\0009\2\t\2'\4\f\0B\2\2\2'\3\r\0&\1\3\0026\2\14\0'\4\15\0B\2\2\0029\2\16\0029\2\17\0025\4\22\0005\5\20\0006\6\14\0'\b\18\0B\6\2\0029\6\19\6=\6\21\5=\5\23\0045\5\24\0>\1\1\0056\6\25\0\18\b\0\0B\6\2\0?\6\0\0=\5\26\4B\2\2\1K\0\1\0\bcmd\rtostring\1\4\0\0\0\21--languageserver\14--hostPID\rhandlers\1\0\0\28textDocument/definition\1\0\0\fhandler\23omnisharp_extended\nsetup\14omnisharp\14lspconfig\frequire5/.cache/omnisharp-vim/omnisharp-roslyn/OmniSharp\tHOME2\\omnisharp-vim\\omnisharp-roslyn\\OmniSharp.exe\17LOCALAPPDATA\vgetenv\aos\15Windows_NT\fsysname\ros_uname\tloop\5\vgetpid\afn\bvim\t€€À™\4\0" },
    loaded = true,
    path = "/home/vantm/.local/share/nvim/site/pack/packer/start/omnisharp-vim",
    url = "https://github.com/OmniSharp/omnisharp-vim"
  },
  ["packer.nvim"] = {
    loaded = true,
    path = "/home/vantm/.local/share/nvim/site/pack/packer/start/packer.nvim",
    url = "https://github.com/wbthomason/packer.nvim"
  },
  ["plenary.nvim"] = {
    loaded = true,
    path = "/home/vantm/.local/share/nvim/site/pack/packer/start/plenary.nvim",
    url = "https://github.com/nvim-lua/plenary.nvim"
  },
  ripgrep = {
    loaded = true,
    path = "/home/vantm/.local/share/nvim/site/pack/packer/start/ripgrep",
    url = "https://github.com/BurntSushi/ripgrep"
  },
  ["telescope.nvim"] = {
    config = { "\27LJ\2\n‡\4\0\0\b\0\23\0\0306\0\0\0'\2\1\0B\0\2\0026\1\0\0'\3\2\0B\1\2\0029\1\3\0015\3\15\0005\4\r\0005\5\v\0005\6\5\0009\a\4\0=\a\6\0069\a\a\0=\a\b\0069\a\4\0=\a\t\0069\a\a\0=\a\n\6=\6\f\5=\5\14\4=\4\16\0035\4\20\0005\5\18\0005\6\17\0=\6\19\5=\5\21\4=\4\22\3B\1\2\1K\0\1\0\fpickers\15find_files\1\0\0\17find_command\1\0\0\1\27\0\0\arg\f--files\a-g\15!**/.git/*\a-g\23!**/node_modules/*\a-g\14!**/bin/*\a-g\14!**/bin/*\a-g\14!**/.vs/*\a-g\16!**/.idea/*\a-g\15!**/dist/*\a-g\14!**/bin/*\a-g\14!**/obj/*\a-g\15!**/*.lock\a-g\20!**/*.lock.json\a-g#!**/*.{dll,bin,min.js,min.css}\rdefaults\1\0\0\rmappings\1\0\0\6i\1\0\0\n<C-k>\n<C-j>\t<Up>\28move_selection_previous\v<Down>\1\0\0\24move_selection_next\nsetup\14telescope\22telescope.actions\frequire\0" },
    loaded = true,
    path = "/home/vantm/.local/share/nvim/site/pack/packer/start/telescope.nvim",
    url = "https://github.com/nvim-telescope/telescope.nvim"
  },
  undotree = {
    loaded = true,
    path = "/home/vantm/.local/share/nvim/site/pack/packer/start/undotree",
    url = "https://github.com/mbbill/undotree"
  },
  ["vim-fugitive"] = {
    loaded = true,
    path = "/home/vantm/.local/share/nvim/site/pack/packer/start/vim-fugitive",
    url = "https://github.com/tpope/vim-fugitive"
  }
}

time([[Defining packer_plugins]], false)
-- Config for: mason.nvim
time([[Config for mason.nvim]], true)
try_loadstring("\27LJ\2\nã\1\0\0\4\0\b\0\0216\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\0016\0\0\0'\2\3\0B\0\2\0029\0\2\0005\2\5\0005\3\4\0=\3\6\2B\0\2\0016\0\0\0'\2\a\0B\0\2\0029\0\2\0004\2\0\0B\0\2\1K\0\1\0\fnull-ls\21ensure_installed\1\0\1\27automatic_installation\2\1\6\0\0\vlua_ls\fpyright\rtsserver\18rust_analyzer\ngopls\20mason-lspconfig\nsetup\nmason\frequire\0", "config", "mason.nvim")
time([[Config for mason.nvim]], false)
-- Config for: barbar.nvim
time([[Config for barbar.nvim]], true)
try_loadstring("\27LJ\2\nª\1\0\0\5\0\n\0\r6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0005\3\4\0005\4\5\0=\4\6\3=\3\a\0025\3\b\0=\3\t\2B\0\2\1K\0\1\0\22sidebar_filetypes\1\0\1\rNvimTree\1\nicons\rfiletype\1\0\1\fenabled\1\1\0\1\18buffer_number\2\1\0\1\14animation\1\nsetup\vbarbar\frequire\0", "config", "barbar.nvim")
time([[Config for barbar.nvim]], false)
-- Config for: omnisharp-vim
time([[Config for omnisharp-vim]], true)
try_loadstring("\27LJ\2\n…\4\0\0\t\0\27\1/6\0\0\0009\0\1\0009\0\2\0B\0\1\2'\1\3\0006\2\0\0009\2\4\0029\2\5\2B\2\1\0029\2\6\2\a\2\a\0X\2\a€6\2\b\0009\2\t\2'\4\n\0B\2\2\2'\3\v\0&\1\3\2X\2\6€6\2\b\0009\2\t\2'\4\f\0B\2\2\2'\3\r\0&\1\3\0026\2\14\0'\4\15\0B\2\2\0029\2\16\0029\2\17\0025\4\22\0005\5\20\0006\6\14\0'\b\18\0B\6\2\0029\6\19\6=\6\21\5=\5\23\0045\5\24\0>\1\1\0056\6\25\0\18\b\0\0B\6\2\0?\6\0\0=\5\26\4B\2\2\1K\0\1\0\bcmd\rtostring\1\4\0\0\0\21--languageserver\14--hostPID\rhandlers\1\0\0\28textDocument/definition\1\0\0\fhandler\23omnisharp_extended\nsetup\14omnisharp\14lspconfig\frequire5/.cache/omnisharp-vim/omnisharp-roslyn/OmniSharp\tHOME2\\omnisharp-vim\\omnisharp-roslyn\\OmniSharp.exe\17LOCALAPPDATA\vgetenv\aos\15Windows_NT\fsysname\ros_uname\tloop\5\vgetpid\afn\bvim\t€€À™\4\0", "config", "omnisharp-vim")
time([[Config for omnisharp-vim]], false)
-- Config for: hop.nvim
time([[Config for hop.nvim]], true)
try_loadstring("\27LJ\2\n1\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\bhop\frequire\0", "config", "hop.nvim")
time([[Config for hop.nvim]], false)
-- Config for: nvim-cmp
time([[Config for nvim-cmp]], true)
try_loadstring("\27LJ\2\n—\1\0\0\6\0\b\2\0276\0\0\0009\0\1\0009\0\2\0'\2\3\0B\0\2\2\23\0\0\0\b\0\1\0X\1\17€6\1\0\0009\1\1\0019\1\4\1'\3\3\0B\1\2\2\18\3\1\0009\1\5\1\18\4\0\0\18\5\0\0B\1\4\2\18\3\1\0009\1\6\1'\4\a\0B\1\3\2X\2\3€+\1\1\0X\2\1€+\1\2\0L\1\2\0\a%s\nmatch\bsub\fgetline\6.\bcol\afn\bvim\2\0p\0\1\3\2\2\0\19-\1\0\0009\1\0\1B\1\1\2\15\0\1\0X\2\4€-\1\0\0009\1\1\1B\1\1\1X\1\t€-\1\1\0B\1\1\2\15\0\1\0X\2\3€\18\1\0\0B\1\1\1X\1\2€\18\1\0\0B\1\1\1K\0\1\0\0À\1À\21select_next_item\fvisibleR\0\1\3\1\2\0\f-\1\0\0009\1\0\1B\1\1\2\15\0\1\0X\2\4€-\1\0\0009\1\1\1B\1\1\1X\1\2€\18\1\0\0B\1\1\1K\0\1\0\0À\21select_prev_item\fvisible³\t\1\0\r\0F\0\0016\0\0\0'\2\1\0B\0\2\0023\1\2\0009\2\3\0005\4\4\0004\5\0\0=\5\5\0049\5\6\0009\5\a\0059\5\b\0055\a\n\0009\b\6\0009\b\t\bB\b\1\2=\b\v\a9\b\6\0009\b\f\bB\b\1\2=\b\r\a9\b\6\0009\n\6\0009\n\14\n)\fÿÿB\n\2\0025\v\15\0B\b\3\2=\b\16\a9\b\6\0009\n\6\0009\n\14\n)\f\1\0B\n\2\0025\v\17\0B\b\3\2=\b\18\a9\b\6\0009\n\6\0009\n\19\nB\n\1\0025\v\20\0B\b\3\2=\b\21\a9\b\6\0005\n\23\0009\v\6\0009\v\22\vB\v\1\2=\v\24\n9\v\6\0009\v\25\vB\v\1\2=\v\26\nB\b\2\2=\b\27\a9\b\6\0009\b\28\b5\n\29\0B\b\2\2=\b\30\a9\b\6\0003\n\31\0005\v \0B\b\3\2=\b!\a9\b\6\0003\n\"\0005\v#\0B\b\3\2=\b$\aB\5\2\2=\5\6\0044\5\5\0005\6%\0>\6\1\0055\6&\0>\6\2\0055\6'\0>\6\3\0055\6(\0>\6\4\5=\5)\0045\5,\0009\6*\0009\6+\6=\6-\5=\5.\4B\2\2\0019\2\3\0009\2/\0025\0040\0005\0051\0009\6\6\0009\6\a\0069\6/\6B\6\1\2=\6\6\0054\6\3\0005\a2\0>\a\1\6=\6)\5B\2\3\0019\2\3\0009\2/\2'\0043\0005\0054\0009\6\6\0009\6\a\0069\6/\6B\6\1\2=\6\6\0059\0065\0009\6)\0064\b\3\0005\t6\0>\t\1\b4\t\3\0005\n7\0>\n\1\tB\6\3\2=\6)\5B\2\3\0016\2\0\0'\0048\0B\2\2\0026\3\0\0'\0059\0B\3\2\0029\3:\3B\3\1\0029\4;\0029\4\3\0045\6<\0=\3=\6B\4\2\0019\4>\0029\4\3\0045\6?\0=\3=\6B\4\2\0019\4@\0029\4\3\0045\6A\0=\3=\6B\4\2\0019\4B\0029\4\3\0045\6C\0=\3=\6B\4\2\0019\4D\0029\4\3\0045\6E\0=\3=\6B\4\2\0012\0\0€K\0\1\0\1\0\0\ngopls\1\0\0\18rust_analyzer\1\0\0\rtsserver\1\0\0\fpyright\17capabilities\1\0\0\vlua_ls\25default_capabilities\17cmp_nvim_lsp\14lspconfig\1\0\1\tname\fcmdline\1\0\1\tname\tpath\vconfig\1\0\0\6:\1\0\1\tname\vbuffer\1\0\0\1\3\0\0\6/\6?\fcmdline\17confirm_opts\rbehavior\1\0\1\vselect\1\fReplace\20ConfirmBehavior\fsources\1\0\1\tname\tpath\1\0\1\tname\vbuffer\1\0\1\tname\rnvim_lua\1\0\1\tname\rnvim_lsp\f<S-Tab>\1\3\0\0\6i\6s\0\n<Tab>\1\3\0\0\6i\6s\0\t<CR>\1\0\1\vselect\2\fconfirm\n<C-e>\6c\nclose\6i\1\0\0\nabort\14<C-Space>\1\3\0\0\6i\6c\rcomplete\n<C-f>\1\3\0\0\6i\6c\n<C-b>\1\3\0\0\6i\6c\16scroll_docs\n<C-j>\21select_next_item\n<C-k>\1\0\0\21select_prev_item\vinsert\vpreset\fmapping\fsnippet\1\0\0\nsetup\0\bcmp\frequire\0", "config", "nvim-cmp")
time([[Config for nvim-cmp]], false)
-- Config for: lualine.nvim
time([[Config for lualine.nvim]], true)
try_loadstring("\27LJ\2\nÙ\2\0\0\5\0\20\0\0236\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\4\0005\3\3\0=\3\5\0025\3\a\0005\4\6\0=\4\b\0035\4\t\0=\4\n\0035\4\v\0=\4\f\0035\4\r\0=\4\14\0035\4\15\0=\4\16\0035\4\17\0=\4\18\3=\3\19\2B\0\2\1K\0\1\0\rsections\14lualine_z\1\2\0\0\rlocation\14lualine_y\1\2\0\0\rprogress\14lualine_x\1\4\0\0\vspaces\rencoding\rfiletype\14lualine_c\1\2\0\0\14filenames\14lualine_b\1\3\0\0\vbranch\tdiff\14lualine_a\1\0\0\1\2\0\0\tmode\foptions\1\0\0\1\0\3\17globalstatus\2\ntheme\rcodedark\18icons_enabled\1\nsetup\flualine\frequire\0", "config", "lualine.nvim")
time([[Config for lualine.nvim]], false)
-- Config for: nvim-treesitter
time([[Config for nvim-treesitter]], true)
try_loadstring("\27LJ\2\nâ\1\0\0\4\0\b\0\v6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\4\0005\3\3\0=\3\5\0025\3\6\0=\3\a\2B\0\2\1K\0\1\0\14highlight\1\0\1\venable\2\21ensure_installed\1\0\0\1\17\0\0\6c\blua\bvim\vvimdoc\ago\trust\15typescript\15javascript\thtml\bcss\tscss\fc_sharp\bsql\rmarkdown\tjson\tyaml\nsetup\28nvim-treesitter.configs\frequire\0", "config", "nvim-treesitter")
time([[Config for nvim-treesitter]], false)
-- Config for: gitsigns.nvim
time([[Config for gitsigns.nvim]], true)
try_loadstring("\27LJ\2\n6\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\rgitsigns\frequire\0", "config", "gitsigns.nvim")
time([[Config for gitsigns.nvim]], false)
-- Config for: aerial.nvim
time([[Config for aerial.nvim]], true)
try_loadstring("\27LJ\2\nâ\1\0\1\b\0\n\0\0286\1\0\0009\1\1\0019\1\2\1\18\3\0\0'\4\3\0'\5\4\0'\6\5\0004\a\0\0B\1\6\0016\1\0\0009\1\1\0019\1\2\1\18\3\0\0'\4\3\0'\5\6\0'\6\a\0004\a\0\0B\1\6\0016\1\0\0009\1\1\0019\1\2\1\18\3\0\0'\4\3\0'\5\b\0'\6\t\0004\a\0\0B\1\6\1K\0\1\0\24<cmd>AerialNext<CR>\6}\24<cmd>AerialPrev<CR>\6{\27<cmd>AerialToggle!<CR>\14<leader>o\6n\24nvim_buf_set_keymap\bapi\bvimN\1\0\4\0\6\0\t6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\4\0003\3\3\0=\3\5\2B\0\2\1K\0\1\0\14on_attach\1\0\0\0\nsetup\vaerial\frequire\0", "config", "aerial.nvim")
time([[Config for aerial.nvim]], false)
-- Config for: telescope.nvim
time([[Config for telescope.nvim]], true)
try_loadstring("\27LJ\2\n‡\4\0\0\b\0\23\0\0306\0\0\0'\2\1\0B\0\2\0026\1\0\0'\3\2\0B\1\2\0029\1\3\0015\3\15\0005\4\r\0005\5\v\0005\6\5\0009\a\4\0=\a\6\0069\a\a\0=\a\b\0069\a\4\0=\a\t\0069\a\a\0=\a\n\6=\6\f\5=\5\14\4=\4\16\0035\4\20\0005\5\18\0005\6\17\0=\6\19\5=\5\21\4=\4\22\3B\1\2\1K\0\1\0\fpickers\15find_files\1\0\0\17find_command\1\0\0\1\27\0\0\arg\f--files\a-g\15!**/.git/*\a-g\23!**/node_modules/*\a-g\14!**/bin/*\a-g\14!**/bin/*\a-g\14!**/.vs/*\a-g\16!**/.idea/*\a-g\15!**/dist/*\a-g\14!**/bin/*\a-g\14!**/obj/*\a-g\15!**/*.lock\a-g\20!**/*.lock.json\a-g#!**/*.{dll,bin,min.js,min.css}\rdefaults\1\0\0\rmappings\1\0\0\6i\1\0\0\n<C-k>\n<C-j>\t<Up>\28move_selection_previous\v<Down>\1\0\0\24move_selection_next\nsetup\14telescope\22telescope.actions\frequire\0", "config", "telescope.nvim")
time([[Config for telescope.nvim]], false)

_G._packer.inside_compile = false
if _G._packer.needs_bufread == true then
  vim.cmd("doautocmd BufRead")
end
_G._packer.needs_bufread = false

if should_profile then save_profiles() end

end)

if not no_errors then
  error_msg = error_msg:gsub('"', '\\"')
  vim.api.nvim_command('echohl ErrorMsg | echom "Error in packer_compiled: '..error_msg..'" | echom "Please check your config for correctness" | echohl None')
end
