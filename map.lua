local map = {}
local flavor = require('color')
local winW, winH = love.graphics.getWidth(), love.graphics.getHeight()

function map.load()

end

function map.update(dt)
    
end

function map.draw()
    love.graphics.setColor(love.math.colorFromBytes((flavor.setColorFormat("red", isOpaque))))
    love.graphics.rectangle('fill', 0, 0, 200, winH)
    love.graphics.setColor(love.math.colorFromBytes((flavor.setColorFormat("teal", isOpaque))))
    love.graphics.rectangle('fill', winW-200, 0, 200, winH)
end

return map