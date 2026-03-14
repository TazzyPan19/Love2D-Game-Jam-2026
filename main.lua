local map = require("map")
local globals = require("globals")

function love.load()
    globals.initialize()
end

function love.update(dt)
    
end

function love.draw()
    map.draw()
end

