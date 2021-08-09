hs.loadSpoon("UnsplashRandom")

hs.hotkey.bind({"cmd", "alt", "ctrl"}, "C", function()
  win = hs.window.focusedWindow()
  f = win:frame()

  f.y = f.y - 30
  win:setFrame(f)
end)

hs.loadSpoon("UnsplashRandom")
hs.hotkey.bind({"cmd", "alt", "ctrl"}, "T", function()
  win = hs.window.focusedWindow()
  f = win:frame()

  f.y = f.y + 30
  win:setFrame(f)
end)

hs.loadSpoon("UnsplashRandom")
hs.hotkey.bind({"cmd", "alt", "ctrl"}, "H", function()
  win = hs.window.focusedWindow()
  f = win:frame()

  f.x = f.x - 30
  win:setFrame(f)
end)

hs.loadSpoon("UnsplashRandom")
hs.hotkey.bind({"cmd", "alt", "ctrl"}, "N", function()
  win = hs.window.focusedWindow()
  f = win:frame()

  f.x = f.x + 30
  win:setFrame(f)
end)

hs.hotkey.bind({"cmd", "alt", "ctrl"}, "F", function()
  local win = hs.window.focusedWindow()
  local f = win:frame()
  local screen = win:screen()
  local max = screen:frame()

  f.x = max.x
  f.y = max.y
  f.w = max.w 
  f.h = max.h
  win:setFrame(f)
end)

hs.hotkey.bind({"cmd", "alt", "ctrl"}, "W", function()
  hs.alert.show("Hello World!")
end)

hs.hotkey.bind({"cmd", "alt", "ctrl"}, "R", function()
  hs.reload()
end)
hs.alert.show("Config loaded")

mouseCircle = nil
mouseCircleTimer = nil

function mouseHighlight()
    -- Delete an existing highlight if it exists
    if mouseCircle then
        mouseCircle:delete()
        if mouseCircleTimer then
            mouseCircleTimer:stop()
        end
    end
    -- Get the current co-ordinates of the mouse pointer
    mousepoint = hs.mouse.getAbsolutePosition()
    -- Prepare a big red circle around the mouse pointer
    mouseCircle = hs.drawing.circle(hs.geometry.rect(mousepoint.x-40, mousepoint.y-40, 80, 80))
    mouseCircle:setStrokeColor({["red"]=1,["blue"]=0,["green"]=0,["alpha"]=1})
    mouseCircle:setFill(false)
    mouseCircle:setStrokeWidth(5)
    mouseCircle:show()

    -- Set a timer to delete the circle after 3 seconds
    mouseCircleTimer = hs.timer.doAfter(3, function() mouseCircle:delete() end)
end
hs.hotkey.bind({"cmd", "alt", "ctrl"}, "D", mouseHighlight)

hs.hotkey.bind({"cmd", "alt", "ctrl"}, "8", function() -- Previous window
  local win = hs.window.focusedWindow();
  if not win then return end
win:moveToScreen(win:screen():previous())
end)

hs.hotkey.bind({"cmd", "alt", "ctrl"}, "7", function() -- Next window
  local win = hs.window.focusedWindow();
  if not win then return end
win:moveToScreen(win:screen():next())
end)

hs.hotkey.bind({"cmd", "alt", "ctrl"}, "1", function()
  local win = hs.window.focusedWindow();
  if not win then return end
win:moveToUnit(hs.layout.left50)
end)
hs.hotkey.bind({"cmd", "alt", "ctrl"}, "9", function()
  local win = hs.window.focusedWindow();
  if not win then return end
win:moveToUnit(hs.layout.left50)
end)
hs.hotkey.bind({"cmd", "alt", "ctrl"}, "0", function()
  local win = hs.window.focusedWindow();
  if not win then return end
win:moveToUnit(hs.layout.right50)
end)

hs.hotkey.bind({"cmd", "alt", "ctrl"}, "S", function()
  local win = hs.window.focusedWindow()
  local f = win:frame()
  local screen = win:screen()
  local max = screen:frame()

  f.x = max.x
  f.y = max.y
  f.w = f.w - 30
  f.h = f.h - 30
  win:setFrame(f)
end)

hs.hotkey.bind({"cmd", "alt", "ctrl"}, "B", function()
  local win = hs.window.focusedWindow()
  local f = win:frame()
  local screen = win:screen()
  local max = screen:frame()

  f.x = max.x
  f.y = max.y
  f.w = f.w + 30
  f.h = f.h + 30
  win:setFrame(f)
end)

function applicationWatcher(appName, eventType, appObject)
  if (eventType == hs.application.watcher.launched) then
    if (appName == "Music") then
      appObject:kill()
    end
  end
end
appWatcher = hs.application.watcher.new(applicationWatcher)
appWatcher:start()
