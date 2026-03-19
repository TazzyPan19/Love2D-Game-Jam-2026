local initialX, initialY = 100, 100
local gridRows, gridCols = 2, 6
local spacing = 10

function getGridAreaDimensions(rows, cols, spacing)
    if rows ~= math.ceil(rows) or cols ~= math.ceil(cols) or spacing ~= math.ceil(spacing) then
        return print(assert("Either rows, columns or spacing contains floating points, values can only be integers!"))
    end

    local rs = rows * spacing
    local cs = cols * spacing
    local gs = cols * rows
    
    return rs, cs, gs
end

function getGridCoords(alignment, size, spacings)
    local reset = 0
    local offsetX = 0
    local offsetY = spacings
    local set = {}
    
    for i=1, size do
        reset = reset + 1
        
        if reset > alignment then
            offsetY = offsetY + spacings
            offsetX = 0
            reset = 1
        end
        if reset <= alignment then
            offsetX = offsetX + spacings
        end
        table.insert(set, {id = i,x = offsetX, y = offsetY, value = 0})
    end

    return set
end

local width, height, gridSize = getGridAreaDimensions(gridRows, gridCols, spacing)

local xyCoords = getGridCoords(gridRows, gridSize, spacing)

for k,v in pairs(xyCoords) do
    print("id: " .. v.id,"x: " .. v.x, "y: " .. v.y, "value: " .. v.value)
end