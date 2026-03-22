local resourceBar = {}
local itemWalls = require('src/testing/itemWalls')

local numOfItems = 0
local padding = 0
local exceededLength = false
local itemW, itemH = 0, 0

local listItems = {}

function resourceBar:load()
    self.x = 200
    self.y = 550
    self.width = 880
    self.height = 150

    itemW, itemH = itemWalls:getDimensions()
end

function resourceBar:update(dt)
    itemWalls:update(dt)
end

function resourceBar:draw()
    love.graphics.setColor(love.math.colorFromBytes(133, 133, 255))
    love.graphics.rectangle('fill', self.x, self.y, self.width, self.height)

    itemWalls:drawAll()
end

function resourceBar:addItemData(x, y, width, height, itemWidth, itemHeight)
    local randQty = math.random(1, 10)
    local rex, rey = x, y + itemHeight/2
    local rew, reh = width, height
    
    if numOfItems <= 1 and not exceededLength then
        padding = padding + 40
        table.insert(listItems, {x = rex + padding, y = rey, qty = randQty})
    elseif numOfItems > 1 and not exceededLength then
        padding = padding + 100
        table.insert(listItems, {x = rex + padding, y = rey, qty = randQty})
    end

    if padding + ((itemWidth *2) + 40) > self.width then
        exceededLength = true
        print('Exceeded! item bar length. Can not insert more items')
    end
end

function resourceBar:button(button)
    if button == 1 then
        numOfItems = numOfItems + 1
        self:addItemData(self.x, self.y, self.width, self.height, itemW, itemH)
        
        for _, item in ipairs(listItems) do
            itemWalls:new(item.x, item.y, item.qty)
        end
    end
end

return resourceBar

-- TODO remove old draw function below

-- function resourceBar:draw()
--     love.graphics.setColor(love.math.colorFromBytes(255, 255, 255))
--     love.graphics.rectangle('fill', self.itemBar.x, self.itemBar.y, self.itemBar.width, self.itemBar.height)
    
--     local itemBarCenterX, itemBarCenterY = self.itemBar.x - (self.itemBox.width / 2),  self.itemBar.y - (self.itemBox.height / 2)
--     local cx = self.itemBox.width
--     local cy = self.itemBar.height / 2
--     local padding = 0
--     -- local textW, textH = getTextDimensions(text)
    
--     love.graphics.setColor(love.math.colorFromBytes(12, 133, 24))

--     for i=1, numOfItems do
--         if i >= 2 then
--             padding = padding + (self.itemBox.width + (self.itemBox.width / 2))
--         end
--         if padding + (self.itemBox.width + (self.itemBox.width / 2)) > self.itemBar.width then
--             print('Exceeded! item bar length. Can not insert more items')
--             break
--         end
--         love.graphics.rectangle('fill', itemBarCenterX + cx + padding, itemBarCenterY + cy, self.itemBox.width, self.itemBox.height)
--     end
-- end