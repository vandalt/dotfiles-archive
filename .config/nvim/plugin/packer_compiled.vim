" Automatically generated packer.nvim plugin loader code

if !has('nvim-0.5')
  echohl WarningMsg
  echom "Invalid Neovim version for packer.nvim!"
  echohl None
  finish
endif

packadd packer.nvim

try

lua << END
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

  _G._packer = _G._packer or {}
  _G._packer.profile_output = results
end

time([[Luarocks path setup]], true)
local package_path_str = "/home/vandal/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?.lua;/home/vandal/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?/init.lua;/home/vandal/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?.lua;/home/vandal/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?/init.lua"
local install_cpath_pattern = "/home/vandal/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/lua/5.1/?.so"
if not string.find(package.path, package_path_str, 1, true) then
  package.path = package.path .. ';' .. package_path_str
end

if not string.find(package.cpath, install_cpath_pattern, 1, true) then
  package.cpath = package.cpath .. ';' .. install_cpath_pattern
end

time([[Luarocks path setup]], false)
time([[try_loadstring definition]], true)
local function try_loadstring(s, component, name)
  local success, result = pcall(loadstring(s))
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
  CamelCaseMotion = {
    loaded = true,
    path = "/home/vandal/.local/share/nvim/site/pack/packer/start/CamelCaseMotion"
  },
  ReplaceWithRegister = {
    loaded = true,
    path = "/home/vandal/.local/share/nvim/site/pack/packer/start/ReplaceWithRegister"
  },
  ["Vim-Jinja2-Syntax"] = {
    loaded = true,
    path = "/home/vandal/.local/share/nvim/site/pack/packer/start/Vim-Jinja2-Syntax"
  },
  ["argtextobj.vim"] = {
    loaded = true,
    path = "/home/vandal/.local/share/nvim/site/pack/packer/start/argtextobj.vim"
  },
  ["dashboard-nvim"] = {
    loaded = true,
    path = "/home/vandal/.local/share/nvim/site/pack/packer/start/dashboard-nvim"
  },
  ["diffview.nvim"] = {
    loaded = true,
    path = "/home/vandal/.local/share/nvim/site/pack/packer/start/diffview.nvim"
  },
  ["friendly-snippets"] = {
    loaded = true,
    path = "/home/vandal/.local/share/nvim/site/pack/packer/start/friendly-snippets"
  },
  ["gitsigns.nvim"] = {
    loaded = true,
    path = "/home/vandal/.local/share/nvim/site/pack/packer/start/gitsigns.nvim"
  },
  ["iron.nvim"] = {
    loaded = true,
    path = "/home/vandal/.local/share/nvim/site/pack/packer/start/iron.nvim"
  },
  ["jupytext.vim"] = {
    loaded = true,
    path = "/home/vandal/.local/share/nvim/site/pack/packer/start/jupytext.vim"
  },
  ["lualine.nvim"] = {
    loaded = true,
    path = "/home/vandal/.local/share/nvim/site/pack/packer/start/lualine.nvim"
  },
  neogit = {
    loaded = true,
    path = "/home/vandal/.local/share/nvim/site/pack/packer/start/neogit"
  },
  ["nlua.nvim"] = {
    loaded = true,
    path = "/home/vandal/.local/share/nvim/site/pack/packer/start/nlua.nvim"
  },
  ["nvim-autopairs"] = {
    loaded = true,
    path = "/home/vandal/.local/share/nvim/site/pack/packer/start/nvim-autopairs"
  },
  ["nvim-compe"] = {
    loaded = true,
    path = "/home/vandal/.local/share/nvim/site/pack/packer/start/nvim-compe"
  },
  ["nvim-lspconfig"] = {
    loaded = true,
    path = "/home/vandal/.local/share/nvim/site/pack/packer/start/nvim-lspconfig"
  },
  ["nvim-toggleterm.lua"] = {
    loaded = true,
    path = "/home/vandal/.local/share/nvim/site/pack/packer/start/nvim-toggleterm.lua"
  },
  ["nvim-treesitter"] = {
    loaded = true,
    path = "/home/vandal/.local/share/nvim/site/pack/packer/start/nvim-treesitter"
  },
  ["nvim-web-devicons"] = {
    loaded = true,
    path = "/home/vandal/.local/share/nvim/site/pack/packer/start/nvim-web-devicons"
  },
  ["packer.nvim"] = {
    loaded = false,
    needs_bufread = false,
    path = "/home/vandal/.local/share/nvim/site/pack/packer/opt/packer.nvim"
  },
  ["plenary.nvim"] = {
    loaded = true,
    path = "/home/vandal/.local/share/nvim/site/pack/packer/start/plenary.nvim"
  },
  ["poet-v"] = {
    loaded = true,
    path = "/home/vandal/.local/share/nvim/site/pack/packer/start/poet-v"
  },
  ["popup.nvim"] = {
    loaded = true,
    path = "/home/vandal/.local/share/nvim/site/pack/packer/start/popup.nvim"
  },
  ["splitjoin.vim"] = {
    loaded = true,
    path = "/home/vandal/.local/share/nvim/site/pack/packer/start/splitjoin.vim"
  },
  ["telescope-fzy-native.nvim"] = {
    loaded = true,
    path = "/home/vandal/.local/share/nvim/site/pack/packer/start/telescope-fzy-native.nvim"
  },
  ["telescope-github.nvim"] = {
    loaded = true,
    path = "/home/vandal/.local/share/nvim/site/pack/packer/start/telescope-github.nvim"
  },
  ["telescope-project.nvim"] = {
    loaded = true,
    path = "/home/vandal/.local/share/nvim/site/pack/packer/start/telescope-project.nvim"
  },
  ["telescope-symbols.nvim"] = {
    loaded = true,
    path = "/home/vandal/.local/share/nvim/site/pack/packer/start/telescope-symbols.nvim"
  },
  ["telescope-z.nvim"] = {
    loaded = true,
    path = "/home/vandal/.local/share/nvim/site/pack/packer/start/telescope-z.nvim"
  },
  ["telescope.nvim"] = {
    loaded = true,
    path = "/home/vandal/.local/share/nvim/site/pack/packer/start/telescope.nvim"
  },
  ["tokyonight.nvim"] = {
    loaded = true,
    path = "/home/vandal/.local/share/nvim/site/pack/packer/start/tokyonight.nvim"
  },
  ["vim-arsync"] = {
    loaded = true,
    path = "/home/vandal/.local/share/nvim/site/pack/packer/start/vim-arsync"
  },
  ["vim-closetag"] = {
    loaded = true,
    path = "/home/vandal/.local/share/nvim/site/pack/packer/start/vim-closetag"
  },
  ["vim-colors-solarized"] = {
    loaded = true,
    path = "/home/vandal/.local/share/nvim/site/pack/packer/start/vim-colors-solarized"
  },
  ["vim-commentary"] = {
    loaded = true,
    path = "/home/vandal/.local/share/nvim/site/pack/packer/start/vim-commentary"
  },
  ["vim-doge"] = {
    loaded = true,
    path = "/home/vandal/.local/share/nvim/site/pack/packer/start/vim-doge"
  },
  ["vim-easymotion"] = {
    loaded = true,
    path = "/home/vandal/.local/share/nvim/site/pack/packer/start/vim-easymotion"
  },
  ["vim-eunuch"] = {
    loaded = true,
    path = "/home/vandal/.local/share/nvim/site/pack/packer/start/vim-eunuch"
  },
  ["vim-exchange"] = {
    loaded = true,
    path = "/home/vandal/.local/share/nvim/site/pack/packer/start/vim-exchange"
  },
  ["vim-fugitive"] = {
    loaded = true,
    path = "/home/vandal/.local/share/nvim/site/pack/packer/start/vim-fugitive"
  },
  ["vim-gtfo"] = {
    loaded = true,
    path = "/home/vandal/.local/share/nvim/site/pack/packer/start/vim-gtfo"
  },
  ["vim-illuminate"] = {
    loaded = true,
    path = "/home/vandal/.local/share/nvim/site/pack/packer/start/vim-illuminate"
  },
  ["vim-indent-object"] = {
    loaded = true,
    path = "/home/vandal/.local/share/nvim/site/pack/packer/start/vim-indent-object"
  },
  ["vim-matchup"] = {
    loaded = true,
    path = "/home/vandal/.local/share/nvim/site/pack/packer/start/vim-matchup"
  },
  ["vim-maximizer"] = {
    loaded = true,
    path = "/home/vandal/.local/share/nvim/site/pack/packer/start/vim-maximizer"
  },
  ["vim-python-pep8-indent"] = {
    loaded = true,
    path = "/home/vandal/.local/share/nvim/site/pack/packer/start/vim-python-pep8-indent"
  },
  ["vim-pythonsense"] = {
    loaded = true,
    path = "/home/vandal/.local/share/nvim/site/pack/packer/start/vim-pythonsense"
  },
  ["vim-repeat"] = {
    loaded = true,
    path = "/home/vandal/.local/share/nvim/site/pack/packer/start/vim-repeat"
  },
  ["vim-signature"] = {
    loaded = true,
    path = "/home/vandal/.local/share/nvim/site/pack/packer/start/vim-signature"
  },
  ["vim-sleuth"] = {
    loaded = true,
    path = "/home/vandal/.local/share/nvim/site/pack/packer/start/vim-sleuth"
  },
  ["vim-surround"] = {
    loaded = true,
    path = "/home/vandal/.local/share/nvim/site/pack/packer/start/vim-surround"
  },
  ["vim-textobj-entire"] = {
    loaded = true,
    path = "/home/vandal/.local/share/nvim/site/pack/packer/start/vim-textobj-entire"
  },
  ["vim-textobj-hydrogen"] = {
    loaded = true,
    path = "/home/vandal/.local/share/nvim/site/pack/packer/start/vim-textobj-hydrogen"
  },
  ["vim-textobj-user"] = {
    loaded = true,
    path = "/home/vandal/.local/share/nvim/site/pack/packer/start/vim-textobj-user"
  },
  ["vim-tmux-navigator"] = {
    loaded = true,
    path = "/home/vandal/.local/share/nvim/site/pack/packer/start/vim-tmux-navigator"
  },
  ["vim-unimpaired"] = {
    loaded = true,
    path = "/home/vandal/.local/share/nvim/site/pack/packer/start/vim-unimpaired"
  },
  ["vim-vinegar"] = {
    loaded = true,
    path = "/home/vandal/.local/share/nvim/site/pack/packer/start/vim-vinegar"
  },
  ["vim-vsnip"] = {
    loaded = true,
    path = "/home/vandal/.local/share/nvim/site/pack/packer/start/vim-vsnip"
  },
  ["vim-vsnip-integ"] = {
    loaded = true,
    path = "/home/vandal/.local/share/nvim/site/pack/packer/start/vim-vsnip-integ"
  },
  vimspector = {
    loaded = true,
    path = "/home/vandal/.local/share/nvim/site/pack/packer/start/vimspector"
  },
  ["vista.vim"] = {
    loaded = true,
    path = "/home/vandal/.local/share/nvim/site/pack/packer/start/vista.vim"
  },
  ["which-key.nvim"] = {
    loaded = true,
    path = "/home/vandal/.local/share/nvim/site/pack/packer/start/which-key.nvim"
  }
}

time([[Defining packer_plugins]], false)
if should_profile then save_profiles() end

END

catch
  echohl ErrorMsg
  echom "Error in packer_compiled: " .. v:exception
  echom "Please check your config for correctness"
  echohl None
endtry
