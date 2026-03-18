local walls = {}
walls.__index = walls

currentWalls = {}

local flavor = require('src/tools/color')
local winW, winH = love.graphics.getWidth(), love.graphics.getHeight()

function walls:new(x, y, width, height)
    local instance = setmetatable({}, walls)
    instance.x = x
    instance.y = y
    instance.width = width
    instance.height = height
    instance.health = 200
    instance.defenceRate = 1.2
    table.insert(currentWalls, instance)
    return instance
end

function walls:update(dt)
    
end

function walls:draw()
    for _, wall in pairs(currentWalls) do
        love.graphics.setColor(love.math.colorFromBytes((flavor.setColorFormat("white", isOpaque))))
        love.graphics.rectangle('fill', wall.x - (wall.width/2), wall.y - (wall.height/2), wall.width, wall.height)
	end
end

return walls