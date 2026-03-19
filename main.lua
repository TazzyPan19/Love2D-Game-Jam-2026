local globals = require("globals")
local map = require("src/map")
local attrition = require("src/attritionBar")
local walls = require('src/walls')
local grid = require('src/grid')
local gridSnapping = require('src/testing/gridSnapping')

function love.load()
    globals.initialize()
    gridSnapping:load()
end

function love.update(dt)
    gridSnapping:update(dt)
end

function love.draw()
    gridSnapping:draw()
end

function love.mousepressed(x, y, button)
end

