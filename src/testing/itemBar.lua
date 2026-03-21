local itemBar = {}

local numOfItems = 1

function itemBar:load()
    self.itemBar = {}
    self.itemBar.x = 200
    self.itemBar.y = 550
    self.itemBar.width = 880
    self.itemBar.height = 150

    self.itemBox = {}
    self.itemBox.width = 80
    self.itemBox.height = 80
end

function itemBar:update(dt)
    return
end

function itemBar:draw()
    love.graphics.setColor(love.math.colorFromBytes(255, 255, 255))
    love.graphics.rectangle('fill', self.itemBar.x, self.itemBar.y, self.itemBar.width, self.itemBar.height)
    
    local itemBarCenterX, itemBarCenterY = self.itemBar.x - (self.itemBox.width / 2),  self.itemBar.y - (self.itemBox.height / 2)
    local cx = self.itemBox.width
    local cy = self.itemBar.height / 2
    local padding = 0
    -- local textW, textH = getTextDimensions(text)
    
    love.graphics.setColor(love.math.colorFromBytes(12, 133, 24))

    for i=1, numOfItems do
        if i >= 2 then
            padding = padding + (self.itemBox.width + (self.itemBox.width / 2))
        end
        if padding + (self.itemBox.width + (self.itemBox.width / 2)) > self.itemBar.width then
            print('Exceeded! item bar length. Can not insert more items')
            break
        end
        love.graphics.rectangle('fill', itemBarCenterX + cx + padding, itemBarCenterY + cy, self.itemBox.width, self.itemBox.height)
    end
end

function itemBar:button(button)
    if button == 1 then
        numOfItems = numOfItems + 1
    end
end

function getTextDimensions(text)
    local font = love.graphics.getFont()
    local textW = font:getWidth(text)
	local textH = font:getHeight()

    return textW, textH
end

-- function itemBar:draw()
--     love.graphics.setColor(love.math.colorFromBytes(255, 255, 255))
--     love.graphics.rectangle('fill', self.itemBar.x, self.itemBar.y, self.itemBar.width, self.itemBar.height)

--     local offset = 0
--     local cx = 0

--     for i=1, numOfItems do
--         local itemBarCenterX, itemBarCenterY = self.itemBar.x - (self.itemBox.width / 2),  self.itemBar.y - (self.itemBox.height / 2)
--         cx = self.itemBar.width / (numOfItems + i)
--         local cy = self.itemBar.height / 2
--         -- local totalSpanWidth = 0

--         if cx < self.itemBox.width then
--             print('Exceeded! item bar length. Can not insert more items')
--             break
--         end

--         love.graphics.setColor(love.math.colorFromBytes(0, 0, 0))
--         love.graphics.rectangle('fill', itemBarCenterX + cx, itemBarCenterY + cy, self.itemBox.width, self.itemBox.height)
--     end
-- end

-- function itemBar:draw()
--     love.graphics.setColor(love.math.colorFromBytes(255, 255, 255))
--     love.graphics.rectangle('fill', self.itemBar.x, self.itemBar.y, self.itemBar.width, self.itemBar.height)

--     local totalSpanWidth = 0
    
--     for i=1, numOfItems do
--         local addSpace = 0
--         local itemBarCenterX, itemBarCenterY = self.itemBar.x - (self.itemBox.width / 2),  self.itemBar.y - (self.itemBox.height / 2)
--         local cy = self.itemBar.height / 2
--         totalSpanWidth = totalSpanWidth + ((self.itemBox.width / 2) + 20)

--         if i >= 2 then
--             addSpace = 60
--         elseif i >= 3 then
--             addSpace = 60
--         end

--         -- if totalSpanWidth > self.itemBar.width then
--         --     print('Exceeded! item bar length. Can not insert more items')
--         --     break
--         -- end

--         love.graphics.setColor(love.math.colorFromBytes(0, 0, 0))
--         love.graphics.rectangle('fill', itemBarCenterX + totalSpanWidth + addSpace, itemBarCenterY + cy, self.itemBox.width, self.itemBox.height)
--     end
-- end

-- function itemBar:draw()
--     love.graphics.setColor(love.math.colorFromBytes(255, 255, 255))
--     love.graphics.rectangle('fill', self.itemBar.x, self.itemBar.y, self.itemBar.width, self.itemBar.height)
    
--     local itemBarCenterX, itemBarCenterY = self.itemBar.x - (self.itemBox.width / 2),  self.itemBar.y - (self.itemBox.height / 2)
--     local cx = self.itemBox.width
--     local cy = self.itemBar.height / 2

--     love.graphics.setColor(love.math.colorFromBytes(0, 0, 0))
--     love.graphics.rectangle('fill', itemBarCenterX + cx, itemBarCenterY + cy, self.itemBox.width, self.itemBox.height)
--     love.graphics.rectangle('fill', itemBarCenterX + cx + (80 + 40), itemBarCenterY + cy, self.itemBox.width, self.itemBox.height)
--     love.graphics.rectangle('fill', itemBarCenterX + cx + (160 + 80), itemBarCenterY + cy, self.itemBox.width, self.itemBox.height)
-- end

return itemBar