local globals = require("globals")
local map = require("src/map")
local attrition = require("src/attritionBar")
local walls = require('src/walls')
local grid = require('src/grid')

function love.load()
    globals.initialize()
    grid:load()
end

function love.update(dt)
    grid:update(dt)
end

function love.draw()
    grid:draw()
end

function love.mousepressed(x, y, button)
	-- if button == 1 then
	-- 	walls:new(x, y, 10, 200)
	-- end
end

