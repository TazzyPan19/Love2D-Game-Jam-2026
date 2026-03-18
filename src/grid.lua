local gridPattern = {}

local utils = require('src/tools/utils')
local gridTile = require('src/gridTile')

local gridRows, gridCols = 4, 6
local spacing = 40
local width, height, gridSize = nil, nil, nil
local initialX, initialY = 100, 100

function gridPattern:load()
    width, height, gridSize = self:getGridAreaDimensions(gridRows, gridCols, spacing)
    local xyCoords = self:getGridCoords(gridRows, gridSize, spacing)

    for _, grid in ipairs(xyCoords) do
        gridTile:new(grid.x, grid.y, grid.id, grid.value, grid.spacing)
    end
end

function gridPattern:update(dt)
    gridTile:updateAll(dt)
end

function gridPattern:draw()
    gridTile:drawAll()
end

function gridPattern:getGridAreaDimensions(rows, cols, spacing)
    if rows ~= math.ceil(rows) or cols ~= math.ceil(cols) or spacing ~= math.ceil(spacing) then
        return print(assert("Either rows, columns or spacing contains floating points, values can only be integers!"))
    end

    local rs = rows * spacing
    local cs = cols * spacing
    local gs = cols * rows
    
    return rs, cs, gs
end

function gridPattern:getGridCoords(alignment, size, spacings)
    local reset = 0
    local offsetX, offsetY = 0, spacings
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
        table.insert(set, {id = i,x = initialX + offsetX, y = initialY + offsetY, value = 0, spacing = spacings})
    end

    return set
end

return gridPattern