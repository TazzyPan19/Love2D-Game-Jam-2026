local globals = require("globals")
local map = require("src/map")
local attrition = require("src/attritionBar")
local walls = require('src/walls')
local grid = require('src/grid')
local gridSnapping = require('src/testing/gridSnapping')
local itemBar = require('src/testing/itemBar')

function love.load()
    globals.initialize()
    itemBar:load()
end

function love.update(dt)
    itemBar:update(dt)
end

function love.draw()
    itemBar:draw()
end

function love.mousepressed(x, y, button)
    itemBar:button(button)
end

