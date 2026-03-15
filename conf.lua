function love.conf(t)
    local major, minor = love.getVersion()
    t.version = major .. '.' .. minor

    t.title = "Defense Attack"
    t.window.width = 1280
    t.window.height = 720
    t.console = true
end