-- mod key
mod = {"cmd", "alt", "ctrl"}

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
hs.hotkey.bind(mod, "M", function()
  snapwin({0, 0}, {0, 0}, {1, 0}, {1, 0})
end)
hs.hotkey.bind(mod, "C", function()
  snapwin({0.1, 0}, {0.1, 0}, {0.8, 0}, {0.8, 0})
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
