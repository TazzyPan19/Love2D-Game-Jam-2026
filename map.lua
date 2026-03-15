local map = {}
local flavor = require('color')
local winW, winH = love.graphics.getWidth(), love.graphics.getHeight()

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
    
    map.withinBounds(rectangleProps)
end

function map.draw()
    love.graphics.setColor(love.math.colorFromBytes((flavor.setColorFormat("red", isOpaque))))
    love.graphics.rectangle('fill', 0, 0, 300, winH)
    love.graphics.setColor(love.math.colorFromBytes((flavor.setColorFormat("teal", isOpaque))))
    love.graphics.rectangle('fill', winW-300, 0, 300, winH)
end

function map.withinBoundsNoList(shapeType, posX1, posX2, posY1, posY2)
    local mouseX, mouseY = love.mouse.getPosition()

    if mouseX > posX1 and mouseX < posX2 and mouseY > posY1 and mouseY < posY2 then 
		print("In-bounds!")
        return true
	end
end

function map.withinBounds(shapeProps)
    local mx, my = love.mouse.getPosition()

    if shapeProps.shape == "rectangle" then
        if mx > shapeProps.posX1 and mx < shapeProps.posX2 and my > shapeProps.posY1 and my < shapeProps.posY2 then 
            -- print(shapeProps.shape, "In-bounds!")
            return true
        end
    elseif shapeProps.shape == "circle" then
        local dx = mx - shapeProps.x
        local dy = my - shapeProps.y
        local distance = (dx*dx + dy*dy)

        if distance < (shapeProps.radius * shapeProps.radius) then
            -- print(shapeProps.shape, "In-bounds!")
            return true
        end
    else
        print(assert('Shape can only be either rectangle or circle!'))
    end
end

return map