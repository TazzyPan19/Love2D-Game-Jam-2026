local gridTile = {}
gridTile.__index = gridTile

local utils = require('src/tools/utils')
currentGrid = {}

function gridTile:new(x, y, id, value, spacing)
    local instance = setmetatable({}, gridTile)
    instance.x = x
    instance.y = y
    instance.width = spacing
    instance.height = spacing
    instance.id = id 
    instance.value = value
    instance.squareProps = {
        shape = 'rectangle',
        posX1 = instance.x,
        posX2 = instance.x + instance.width,
        posY1 = instance.y,
        posY2 = instance.y + instance.height
    }
    table.insert(currentGrid, instance)
end

function gridTile:update(dt)
    utils:withinBounds(self.squareProps, true)
end

function gridTile:draw()
    local tw, th = utils:getTextDimensions(tostring(self.id))

    love.graphics.print(self.id, self.x + (self.width / 2), self.y + (self.width / 2), nil, 1, 1, tw/2, th/2)
    love.graphics.rectangle('line', self.x, self.y, self.width, self.height)
end

function gridTile:drawAll()
    for i, instance in ipairs(currentGrid) do
        instance:draw()
    end
end

function gridTile:updateAll(dt)
    for i, instance in ipairs(currentGrid) do
        instance:update(dt)
    end
end

return gridTile