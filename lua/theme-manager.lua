local theme = {
  github = false,
  catppuccin = false,
  kanagawa = true,
}

local M = {}

-- Randomly pick a theme from theme table and alter the theme table to reflect that
local function pickRandomTheme()
  -- Reset all themes to false
  for k, _ in pairs(theme) do
    theme[k] = false
  end

  -- Get all theme keys
  local themes = {}
  for k, _ in pairs(theme) do
    table.insert(themes, k)
  end

  -- Pick a random theme
  math.randomseed(os.time())
  local randomIndex = math.random(1, #themes)
  local selectedTheme = themes[randomIndex]

  -- Set the selected theme to true
  theme[selectedTheme] = true
  return selectedTheme
end

-- Function to load the selected theme
local function loadTheme()
  -- Find which theme is currently active
  local activeTheme = nil
  for k, v in pairs(theme) do
    if v then
      activeTheme = k
      break
    end
  end

  -- Load the appropriate theme
  if activeTheme == 'github' then
    vim.cmd 'colorscheme github_dark'
    -- Add any specific github theme settings here
  elseif activeTheme == 'catppuccin' then
    vim.cmd 'colorscheme catppuccin'
    -- Add any specific catppuccin theme settings here
  elseif activeTheme == 'kanagawa' then
    vim.cmd 'colorscheme kanagawa'
    -- Add any specific kanagawa theme settings here
  end
end

-- To pick a random theme and load it
local function randomizeAndLoadTheme()
  local selected = pickRandomTheme()
  loadTheme()
  return selected
end

M.load = randomizeAndLoadTheme

return M
