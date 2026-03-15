local globals = require("globals")
local map = require("map")
local attrition = require("attritionBar")
local walls = require('walls')

function love.load()
    globals.initialize()
end

function love.update(dt)
    attrition.update(dt)
    map.update(dt)
end

function love.draw()
    walls:draw()
    -- map.draw()
    -- attrition.draw()
end

function love.mousepressed(x, y, button)
	if button == 1 then
		walls:new(x, y, 10, 200)
	end
end

