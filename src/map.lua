local map = {}
local flavor = require('src/tools/color')
local utils = require('src/tools/utils')

local winW, winH = love.graphics.getWidth(), love.graphics.getHeight()
local mapDebug = false

function map.load()

end

function map.update(dt)
    local p1, p2, p3, p4 = winW-300, winW, winH-winH, winH
    local rectangleProps = {
        shape = "rectangle",
        posX1 = p1,
        posX2 = p2,
        posY1 = p3,
        posY2 = p4,
    }
    
    utils:withinBounds(rectangleProps, mapDebug)
end

function map.draw()
    love.graphics.setColor(love.math.colorFromBytes((flavor.setColorFormat("red", isOpaque))))
    love.graphics.rectangle('fill', 0, 0, 300, winH)
    love.graphics.setColor(love.math.colorFromBytes((flavor.setColorFormat("teal", isOpaque))))
    love.graphics.rectangle('fill', winW-300, 0, 300, winH)
end

return map