local gl = require('galaxyline')

local function is_buffer_empty() return vim.fn.empty(vim.fn.expand('%:t')) == 1 end

local gls = gl.section
gl.short_line_list = {'NvimTree'}

local hl = vim.api.nvim_get_hl_by_name('StatusLine', true)
if hl.foreground ~= nil then
  hl.fg = string.format('#%x', hl.foreground)
end
if hl.background ~= nil then
  hl.bg = string.format('#%x', hl.background)
end

local colors = require('gruvbox.colors').setup()
-- Local helper functions
local buffer_not_empty = function() return not is_buffer_empty() end

local mode_color = function()
  local mode_colors = {
    n = colors.green,
    i = colors.blue,
    c = colors.green,
    V = colors.purple,
    [''] = colors.purple,
    v = colors.purple,
    R = colors.red,
    t = colors.blue
  }

  if mode_colors[vim.fn.mode()] ~= nil then
    return mode_colors[vim.fn.mode()]
  else
    print(vim.fn.mode())
    return colors.purple
  end
end

local function file_readonly()
  if vim.bo.readonly == true then
    return '  '
  end
  return ''
end

local function get_current_file_name()
  local file = vim.api.nvim_exec([[
    if winwidth(0) < 50
      echo expand('%:t')
    elseif winwidth(0) > 150
      echo expand('%')
    else
      echo pathshorten(expand('%'))
    endif
    ]], true)
  if vim.fn.empty(file) == 1 then
    return ''
  end
  if string.len(file_readonly()) ~= 0 then
    return file .. file_readonly()
  end
  if vim.bo.modifiable then
    if vim.bo.modified then
      return file .. '  '
    end
  end
  return file .. ' '
end

-- Left side
gls.left = {
  {
    ViMode = {
      provider = function()
        local alias = {
          n = 'NORMAL',
          i = 'INSERT',
          c = 'COMMAND',
          v = 'VISUAL',
          V = 'V-LINE',
          [''] = 'VISUAL',
          R = 'REPLACE',
          t = 'TERMINAL',
          s = 'SELECT',
          S = 'S-LINE'
        }
        vim.api.nvim_command('hi GalaxyViMode guibg=' .. mode_color())
        if alias[vim.fn.mode()] ~= nil then
          return '  ' .. alias[vim.fn.mode()] .. ' '
        else
          return '  V-BLOCK '
        end
      end,
      highlight = {colors.bg, colors.bg, 'bold'}
    }
  }, {
    FileIcon = {
      provider = {function() return '  ' end, 'FileIcon'},
      condition = buffer_not_empty,
      highlight = {require('galaxyline.provider_fileinfo').get_file_icon, colors.bg_visual}
    }
  }, {
    FileName = {
      provider = get_current_file_name,
      condition = buffer_not_empty,
      highlight = {colors.blue, colors.bg_visual}
    }
  }, {
    DiagnosticError = {
      provider = 'DiagnosticError',
      icon = '  ',
      highlight = {colors.red, colors.bg}
    }
  }, {
    DiagnosticWarn = {
      provider = 'DiagnosticWarn',
      icon = '  ',
      highlight = {colors.orange, colors.bg}
    }
  }, {
    DiagnosticInfo = {
      provider = 'DiagnosticInfo',
      icon = '  ',
      highlight = {colors.blue, colors.bg}
    }
  }, {
    DiagnosticHint = {
      provider = 'DiagnosticHint',
      icon = '  ',
      highlight = {colors.yellow, colors.bg}
    }
  }
}

-- Mid section
gls.mid = {
}


local GetGitBranch = function()
  local git_branch = require('galaxyline.provider_vcs').get_git_branch()
  if not git_branch then
    return ''
  end
  return string.gsub(git_branch, "%s+", "")
end

-- Right side
local right_1 = {
  {
    GitBranch = {
      provider = {function() return ' ︁ ' end, GetGitBranch, function() return ' ' end},
      condition = buffer_not_empty and require('galaxyline.condition').check_git_workspace,
      highlight = {colors.aqua, colors.bg_visual}
    }
  }, {
    LineInfo = {
      provider = 'LineColumn',
      highlight = {colors.fg, colors.bg_highlight},
      separator = ' ',
      separator_highlight = {colors.fg, colors.bg_highlight}
    }
  }
}

local right_2 = {
  {
    FileFormat = {
      provider = {function() return '  ' end, 'FileFormat', function() return ' ' end},
      highlight = {colors.fg, colors.bg_visual},
      separator = '',
      separator_highlight = {colors.section_fg, colors.bg_visual}
    }
  }, {
    FileEncode = {
      provider = {'FileEncode', function() return ' ' end},
      highlight = {colors.fg, colors.bg_visual},
      separator = '',
      separator_highlight = {colors.section_fg, colors.bg_visual}
    }
  }, {
    BufferType = {
      provider = {'FileTypeName', function() return ' ' end},
      highlight = {colors.fg, colors.bg_visual},
      separator = '',
      separator_highlight = {colors.section_fg, colors.bg_visual}
    }
  }, {
    FileSize = {
      provider = {function() return '  ' end, 'FileSize'},
      highlight = {colors.fg, colors.bg_visual},
      separator = '',
      separator_highlight = {colors.section_fg, colors.bg_visual}
    }
  }, {
    PerCent = {
      provider = {function() return ' ' end, 'LinePercent'},
      highlight = {colors.aqua, colors.bg_highlight},
      separator = '',
      separator_highlight = {colors.aqua, colors.bg_highlight}
    }
  }
}

gls.right = right_1

function ToggleGalaxyline()
  gl.disable_galaxyline()
  if gls.right == right_1 then
    gls.right = right_2
  else
    gls.right = right_1
  end
  gl.load_galaxyline()
end

vim.api.nvim_set_keymap('n', '!', ':lua ToggleGalaxyline()<CR>', {noremap = true, silent = true})

-- Short status line
gls.short_line_left = {
  {
    SFileName = {
      provider = get_current_file_name,
      condition = buffer_not_empty,
      highlight = {colors.blue, colors.bg}
    }
  }
}

gls.short_line_right = {
  {SBufferIcon = {provider = 'BufferIcon', highlight = {colors.fg, colors.bg}}}
}

-- Force manual load so that nvim boots with a status line
gl.load_galaxyline()
