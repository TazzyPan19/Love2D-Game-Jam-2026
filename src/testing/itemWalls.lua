local itemWalls = {}
itemWalls.__index = itemWalls

local utils = require('src/tools/utils')
currentMaterials = {} 

local setWH = 80

function itemWalls:load(x, y, quantity)
    self.x = x
    self.y = y
    self.quantity = quantity
end

function itemWalls:new(x, y, quantity)
    local instance = setmetatable({}, itemWalls)
    instance.x = x
    instance.y = y
    instance.width = setWH
    instance.height = setWH
    instance.quantity = quantity
    table.insert(currentMaterials, instance)
end

function itemWalls:update(dt)
    return
end

function itemWalls:draw()
    local textW, textH = utils:getTextDimensions(tostring(self.quantity))

    local quantityRectW, quantityRectH = 24, 20
    local rectangleCenterX, rectangleCenterY = (self.width/2) - (quantityRectW/2), quantityRectH/3
    local labelCenterX, labelCenterY = rectangleCenterX + (quantityRectW/2), rectangleCenterY - (quantityRectH/2)

    love.graphics.setColor(love.math.colorFromBytes(255, 255, 255))
    love.graphics.rectangle('fill', self.x, self.y, self.width, self.height)

    love.graphics.setColor(love.math.colorFromBytes(0, 0, 0))
    love.graphics.rectangle('fill', self.x + rectangleCenterX, self.y - rectangleCenterY, quantityRectW, quantityRectH, 4)

    love.graphics.setColor(love.math.colorFromBytes(255, 255, 255))
    love.graphics.setLineWidth(2)
    love.graphics.rectangle('line', self.x + rectangleCenterX, self.y - rectangleCenterY, quantityRectW, quantityRectH, 4)

    love.graphics.print(tostring(self.quantity), self.x + labelCenterX, self.y - labelCenterY, _, _, _, textW/2, textH/2)
end

function itemWalls:getDimensions()
    local w, h = setWH, setWH
    
    return w, h
end

function itemWalls:drawAll()
    for i, instance in ipairs(currentMaterials) do
        instance:draw()
    end
end 

return itemWalls

-- TODO remove old draw function below

-- function itemWalls:draw()
--     local textW, textH = utils:getTextDimensions(tostring(self.quantity))
--     local circleCenter = self.x + self.width
--     local quantityRectW, quantityRectH = 24, 20
--     local rectangleCenter = self.width - (quantityRectW/1.5)
--     local textCenterX = self.x + rectangleCenter

--     love.graphics.setColor(love.math.colorFromBytes(255, 255, 255))
--     love.graphics.rectangle('fill', self.x, self.y, self.width, self.height)

--     -- love.graphics.setColor(love.math.colorFromBytes(0, 0, 0))
--     -- love.graphics.print(tostring(self.quantity), self.x + (self.width/2), self.y + (self.height/2), _, _, _, textW/2, textH/2)

--     love.graphics.setColor(love.math.colorFromBytes(135, 55, 201))
--     love.graphics.rectangle('fill', self.x + rectangleCenter, self.y - (quantityRectH/3), quantityRectW, quantityRectH, 4)

--     love.graphics.setColor(love.math.colorFromBytes(255, 255, 255))
--     love.graphics.print(tostring(self.quantity), textCenterX + (quantityRectW/2), (self.y - (quantityRectH/3)) + (quantityRectH/2), _, _, _, textW/2, textH/2)
-- end