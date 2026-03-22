local turret = {}
turret.__index = turret

spawnProjectile = require("src/testing/spawnProjectile")

local distX, distY = 0, 0 
local distance = 0
local angle = 0

function turret:new(x, y, radius)
    local instance = setmetatable({}, turret)
    instance.x = x
    instance.y = y
    instance.radius = radius
    return instance
end

function turret:update(dt)
    mx, my = love.mouse.getPosition()
    
    distX, distY = mx - self.x, my - self.y
    distance = math.sqrt(distX*distX + distY*distY)

    spawnProjectile:update(dt)
end

function turret:draw()
    love.graphics.setColor(love.math.colorFromBytes(255, 255, 255))
    love.graphics.print("x: " .. distX .. ' ' .. "y: " .. distY, 20, 20)
    love.graphics.print("Distance: " .. distance, 20, 35)
    
    love.graphics.setColor(love.math.colorFromBytes(255, 255, 255))
    love.graphics.circle('fill', self.x, self.y, self.radius)
    
    love.graphics.setLineWidth(2)
    love.graphics.setColor(love.math.colorFromBytes(255, 91, 0))
    love.graphics.line(self.x, self.y, mx, my)

    spawnProjectile:draw()
end

function turret:withinBounds()
    local mx, my = love.mouse.getPosition()

    local dx = mx - self.x
    local dy = my - self.y
    local distance = (dx*dx + dy*dy)

    if distance < (self.radius * self.radius) then
        print('Winthin-bounds')
        return true
    end
end

function turret:button(button)
    if button == 1 then
        spawnProjectile:new(self.x, self.y)
    end
end

return turret