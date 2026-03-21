local globals = require("globals")
local map = require("src/map")
local attrition = require("src/attritionBar")
local walls = require('src/walls')
local grid = require('src/grid')
local gridSnapping = require('src/testing/gridSnapping')
local resourceBar = require('src/testing/resourceBar')

function love.load()
    globals.initialize()
    resourceBar:load()
end

function love.update(dt)
    resourceBar:update(dt)
end

function love.draw()
    resourceBar:draw()
end

function love.mousepressed(x, y, button)
    resourceBar:button(button)
end

