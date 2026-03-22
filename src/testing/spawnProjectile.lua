local spawnProjectile = {}
spawnProjectile.__index = spawnProjectile

local winW, winH = love.graphics.getWidth(), love.graphics.getHeight() 
currentProjectiles = {}

function spawnProjectile:new(x, y)
    local instance = setmetatable({}, spawnProjectile)
    instance.x = x
    instance.y = y
    instance.speed = 200
    instance.damage = 10
    instance.radius = 10
    table.insert(currentProjectiles, instance)
end

function spawnProjectile:update(dt)
    for k, v in pairs(currentProjectiles) do
        v.x = v.x + (dt * v.speed)
        if v.x > winW + v.radius then
            print('removed!')
            self:remove(k)
        end
	end
end

function spawnProjectile:draw()    
    love.graphics.setColor(love.math.colorFromBytes(255, 255, 255))

    for _, v in pairs(currentProjectiles) do
        love.graphics.circle('fill', v.x, v.y, v.radius)
	end
end

function spawnProjectile:remove(p)    
    table.remove(currentProjectiles, p)
end

return spawnProjectile