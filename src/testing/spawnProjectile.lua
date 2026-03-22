local spawnProjectile = {}
spawnProjectile.__index = spawnProjectile

local winW, winH = love.graphics.getWidth(), love.graphics.getHeight() 
currentProjectiles = {}

function spawnProjectile:new(x, y, id)
    local instance = setmetatable({}, spawnProjectile)
    instance.id = id
    instance.x = x
    instance.y = y
    instance.speed = 200
    instance.damage = 10
    instance.radius = 10
    
    local mx, my = love.mouse.getPosition()
    local dx, dy = mx - instance.x, my - instance.y
    
    instance.dir = math.atan2(dy, dx)
    
    table.insert(currentProjectiles, instance)
    print(math.deg(instance.dir))
end

function spawnProjectile:update(dt)
    for k, v in pairs(currentProjectiles) do
        local ax, by = v.speed * dt * math.cos(v.dir), v.speed * dt * math.sin(v.dir)
        v.x = v.x + ax
        v.y = v.y + by
        
         if v.x < -v.radius or v.x > winW + v.radius or v.y < -v.radius or v.y > winH + v.radius then
            print('removed!', v.id)
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

function spawnProjectile:remove(p )    
    table.remove(currentProjectiles, p)
end

return spawnProjectile