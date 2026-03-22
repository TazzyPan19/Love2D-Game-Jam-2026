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
    -- resourceBar:load()
    turretEnemy1 = turret:new(130, 140, 20)
    -- turretEnemy2 = turret:new(130, 610, 20)
end

function love.update(dt)
    -- mx, my = love.mouse.getPosition()
    -- resourceBar:update(dt)
    turretEnemy1:update(dt)
    -- turretEnemy2:update(dt)
end

function love.draw()
    -- print('X: ' .. mx, 'Y: ' .. my)
    -- resourceBar:draw()
    turretEnemy1:draw()
    -- turretEnemy2:draw()
end

function love.mousepressed(x, y, button)
    -- resourceBar:button(button)
    turretEnemy1:button(button)
    -- turretEnemy2:new(button)
end

