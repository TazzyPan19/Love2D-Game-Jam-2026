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

function utils:getTextDimensions(text)
    local font = love.graphics.getFont()
    local textW = font:getWidth(text)
	local textH = font:getHeight()

    return textW, textH
end

-- function utils:createMultipleInstances(instance, args)
--     if type(options) == 'table' then
--         instance:new(args)
--     end
-- end

-- local randList = {}

-- for i=1, 3 do
--     randList["key" .. i] = i *4
-- end

-- for k,v in pairs(randList) do
--     print(k, v)
-- end

return utils