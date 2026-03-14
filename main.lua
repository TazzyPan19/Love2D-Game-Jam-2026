local globals = require("globals")
local map = require("map")
local attrition = require("attritionBar")

function love.load()
    globals.initialize()
end

function love.update(dt)
    attrition.update(dt)
end

function love.draw()
    map.draw()
    attrition.draw()
end

