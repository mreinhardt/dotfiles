-- mod key
mod = {"cmd", "alt", "ctrl"}
smod = {"cmd", "alt", "ctrl", "shift"}

-- move window function
function movewin(x, y)
  local win = hs.window.focusedWindow()
  local f = win:frame()

  f.x = f.x + x
  f.y = f.y + y
  win:setFrame(f)
end

-- snap window function
function snapwin(x, y, w, h)
  local win = hs.window.focusedWindow()
  local f = win:frame()
  local screen = win:screen()
  local s = screen:frame()

  f.x = (s.x + x[2]) + s.w * x[1]
  f.y = (s.y + y[2]) + s.h * y[1]
  f.w = (s.x + w[2]) + s.w * w[1]
  f.h = (s.y + h[2]) + s.h * h[1]
  win:setFrame(f)
end

-- move window bindings
hs.hotkey.bind(mod, "up", function()
  movewin(0, -10)
end)
hs.hotkey.bind(mod, "right", function()
  movewin(10, 0)
end)
hs.hotkey.bind(mod, "down", function()
  movewin(0, 10)
end)
hs.hotkey.bind(mod, "left", function()
  movewin(-10, 0)
end)
hs.hotkey.bind(smod, "up", function()
  movewin(0, -100)
end)
hs.hotkey.bind(smod, "right", function()
  movewin(100, 0)
end)
hs.hotkey.bind(smod, "down", function()
  movewin(0, 100)
end)
hs.hotkey.bind(smod, "left", function()
  movewin(-100, 0)
end)

-- snap window bindings
hs.hotkey.bind(mod, "H", function()
  snapwin({0, 0}, {0, 0}, {0.5, 0}, {1, 0})
end)
hs.hotkey.bind(mod, "J", function()
  snapwin({0, 0}, {0.5, 0}, {1, 0}, {0.5, 0})
end)
hs.hotkey.bind(mod, "K", function()
  snapwin({0, 0}, {0, 0}, {1, 0}, {0.5, 0})
end)
hs.hotkey.bind(mod, "L", function()
  snapwin({0.5, 0}, {0, 0}, {0.5, 0}, {1, 0})
end)
hs.hotkey.bind(mod, "Y", function()
  snapwin({0, 0}, {0, 0}, {0.5, 0}, {0.5, 0})
end)
hs.hotkey.bind(mod, "U", function()
  snapwin({0.5, 0}, {0, 0}, {0.5, 0}, {0.5, 0})
end)
hs.hotkey.bind(mod, "B", function()
  snapwin({0, 0}, {0.5, 0}, {0.5, 0}, {0.5, 0})
end)
hs.hotkey.bind(mod, "N", function()
  snapwin({0.5, 0}, {0.5, 0}, {0.5, 0}, {0.5, 0})
end)
hs.hotkey.bind(mod, "M", function()
  snapwin({0, 0}, {0, 0}, {1, 0}, {1, 0})
end)
hs.hotkey.bind(mod, "C", function()
  snapwin({0.1, 0}, {0.1, 0}, {0.8, 0}, {0.8, 0})
end)
hs.hotkey.bind(mod, "S", function()
  snapwin({0.2, 0}, {0.2, 0}, {0.6, 0}, {0.6, 0})
end)

-- keep awake menu item
caffeine = hs.menubar.new()
function setCaffeineDisplay(state)
    if state then
        caffeine:setTitle("OO")
    else
        caffeine:setTitle("--")
    end
end

function caffeineClicked()
    setCaffeineDisplay(hs.caffeinate.toggle("displayIdle"))
end

if caffeine then
    caffeine:setClickCallback(caffeineClicked)
    setCaffeineDisplay(hs.caffeinate.get("displayIdle"))
end

-- reload config
hs.hotkey.bind(mod, "R", function()
  hs.reload()
end)
hs.alert.show("Hammerspoon config loaded!")
