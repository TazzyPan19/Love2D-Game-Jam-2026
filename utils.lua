utils = {}

local function printMessage(message, debug)
    if debug then
        return print(message)
    else
        return
    end
end

function utils:withinBoundsNoList(shapeType, posX1, posX2, posY1, posY2, debug)
    local mouseX, mouseY = love.mouse.getPosition()

    if mouseX > posX1 and mouseX < posX2 and mouseY > posY1 and mouseY < posY2 then 
		 printMessage('within-bound!', debug)
        return true
	end
end

function utils:withinBounds(shapeProps, debug)
    local mx, my = love.mouse.getPosition()

    if shapeProps.shape == "rectangle" then
        if mx > shapeProps.posX1 and mx < shapeProps.posX2 and my > shapeProps.posY1 and my < shapeProps.posY2 then 
            printMessage('within-bound!', debug)
            return true
        end
    elseif shapeProps.shape == "circle" then
        local dx = mx - shapeProps.x
        local dy = my - shapeProps.y
        local distance = (dx*dx + dy*dy)

        if distance < (shapeProps.radius * shapeProps.radius) then
            printMessage('within-bound!', debug)
            return true
        end
    else
        print(assert('Shape can only be either rectangle or circle!'))
    end
end

function utils:toHexidecimalNum(num)
    return math.ceil(num * 255)
end

return utils