local walls = {}
currentWalls = {}
walls.__index = walls

local flavor = require('color')
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
    for k, v in pairs(currentWalls) do
        love.graphics.setColor(love.math.colorFromBytes((flavor.setColorFormat("white", isOpaque))))
        love.graphics.rectangle('fill', v.x - (v.width/2), v.y - (v.height/2), v.width, v.height)
	end
end

return walls