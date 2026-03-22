local globals = require("globals")
local map = require("src/map")
local attrition = require("src/attritionBar")
local walls = require('src/walls')
local grid = require('src/grid')
local gridSnapping = require('src/testing/gridSnapping')
local resourceBar = require('src/testing/resourceBar')
local turret = require('src/testing/turret')

function love.load()
    globals.initialize()
    turretEnemy1 = turret:new(130, 140, 20)
end

function love.update(dt)
    turretEnemy1:update(dt)
end

function love.draw()
    turretEnemy1:draw()
end

function love.mousepressed(x, y, button)
    turretEnemy1:button(button)
end

