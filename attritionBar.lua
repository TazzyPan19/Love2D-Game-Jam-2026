local attrition = {}
local flavor = require('color')
local winW, winH = love.graphics.getWidth(), love.graphics.getHeight()

function attrition.load()
    startingValue = 0
end

function attrition.update(dt)
    
end

function attrition.draw()
    local rw, rh = 900, 80
    local rx, ry = (winW / 2) - (rw / 2), winH / 1.1 - (rh / 2)
    local setAttritionValue = attrition.setValue(rw, 450)
    -- attrition.checkWinCondition(rw, setAttritionValue)
    
    love.graphics.setColor(love.math.colorFromBytes((flavor.setColorFormat("white", isOpaque))))
    love.graphics.rectangle('fill', rx, ry, rw, rh)
    love.graphics.setColor(love.math.colorFromBytes((flavor.setColorFormat("orange", isOpaque))))
    love.graphics.rectangle('fill', rx, ry, setAttritionValue, rh)
end

function attrition.setValue(max, setValue)
    if setValue > max then
        print(assert('setValue exceeds the maxValue that is already set!'))
        setAttritionValue = max
        return setAttritionValue
    end

    return setValue
end

function attrition.checkWinCondition(max, value)
    local likelyOutcome = max / 6
    local outcome = max / 2

    if value > outcome then
        print("Your Advanatage!")
    elseif value == outcome then
        print("Stalemate!")
    elseif value < outcome then
        print("Opponent Advanatage!")
    end
end

return attrition