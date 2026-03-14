function love.conf(t)
    local major, minor = love.getVersion()
    t.version = major .. '.' .. minor

    t.title = "Defense Attack"
    t.window.width = 1080
    t.window.height = 1080
    t.console = true
end