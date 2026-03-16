local globals = require("globals")
local map = require("map")
local attrition = require("attritionBar")
local walls = require('walls')
-- local gridPattern = require('gridPattern')
-- local gridSquare = require('gridSquare')

function love.load()
    globals.initialize()
    -- gridSquare:load()
end

function love.update(dt)
    -- gridSquare:update(dt)
    -- attrition.update(dt)
    map.update(dt)
    -- gridPattern:update(dt)
end

function love.draw()
    -- gridSquare:draw()
    -- gridPattern:draw()
    -- walls:draw()
    map.draw()
    -- attrition.draw()
end

function love.mousepressed(x, y, button)
	if button == 1 then
		walls:new(x, y, 10, 200)
	end
end

