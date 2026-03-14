local globals = {}

function globals.initialize()
    isOpaque = true
    isNotOpaque = false
    winW, winH = love.graphics.getWidth(), love.graphics.getHeight()
end

return globals