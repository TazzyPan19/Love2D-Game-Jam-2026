local gridSnapping = {}

local utils = require('src/tools/utils')
local withinGridTile = false
local blockGrabbed = false
local gridcontact = false
local initialX, initialY = 100, 100

function gridSnapping:load()
    self:loadTile()
    self:loadBlock()
end

function gridSnapping:update(dt)
    local mx, my = love.mouse.getPosition()

    blockGrabbed = utils:withinBounds(self.blockProps, false)
    withinGridTile = utils:withinBounds(self.tileProps, false)
    
    if blockGrabbed and love.mouse.isDown(1) then
        gridcontact = false
        self.blockX, self.blockY = mx-20, my-20
        self.blockProps = {
            shape = 'rectangle',
            posX1 = self.blockX,
            posX2 = self.blockX + self.blockW,
            posY1 = self.blockY,
            posY2 = self.blockY + self.blockH,
        }
    elseif not love.mouse.isDown(1) and withinGridTile and blockGrabbed then
        gridcontact = true
        self.blockX = self.tileX
        self.blockY = self.tileY
        self.blockProps = {
            shape = 'rectangle',
            posX1 = self.tileX,
            posX2 = self.tileX + self.blockW,
            posY1 = self.tileY,
            posY2 = self.tileY + self.blockH,
        }
    elseif not love.mouse.isDown(1) and not gridcontact then
        self.blockX = initialX
        self.blockY = initialY
        self.blockProps = {
            shape = 'rectangle',
            posX1 = initialX,
            posX2 = initialX + self.blockW,
            posY1 = initialY,
            posY2 = initialY + self.blockH,
        }
    end

end

function gridSnapping:draw()
    love.graphics.rectangle('line', self.tileX, self.tileY, self.tileW, self.tileH)
    love.graphics.rectangle('fill', self.blockX, self.blockY, self.blockW, self.blockH)
end

function gridSnapping:loadTile()
    self.tileX = 600
    self.tileY = 300
    self.tileW = 100
    self.tileH = 100
    self.tileProps = {
        shape = 'rectangle',
        posX1 = self.tileX,
        posX2 = self.tileX + self.tileW,
        posY1 = self.tileY,
        posY2 = self.tileY + self.tileH,
    }
end

function gridSnapping:loadBlock()
    self.blockX = initialX
    self.blockY = initialY
    self.blockW = 100
    self.blockH = 100
    self.blockProps = {
        shape = 'rectangle',
        posX1 = self.blockX,
        posX2 = self.blockX + self.blockW,
        posY1 = self.blockY,
        posY2 = self.blockY + self.blockH,
    }
end

function getPositiveNum(number1, number2)
    local num1 = number1
    local num2 = number2

    if num1 <= -1 then
        num1 = math.abs(num1)
    end
    if num2 <= -1 then
        num2 = math.abs(num2)
    end

    return num1, num2
end

return gridSnapping