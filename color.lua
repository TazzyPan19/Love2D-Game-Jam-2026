local color = {}

function toHexidecimalNum(num)
    return math.ceil(num * 255)
end

local colorSet = {
    white = {
        rgba = {255, 255, 255, toHexidecimalNum(1.0)},
        hex = "#ffffff"},
    red = {
        rgba = {231, 30, 30, toHexidecimalNum(1.0)},
        hex = "#e71e1e"},
    teal = {
        rgba = {67, 234, 200, toHexidecimalNum(1.0)},
        hex = "#43eac8"},
}

local colorDebug = false

function color.setColorFormat(color, isOpaque)
    if type(isOpaque) ~= "boolean" then
        return assert("Not a vaild boolean!")
    end

    local colorOpaqueList = {}
    local colorList = {}
    local matchedColor

     for k,v in pairs(colorSet) do
        if k == color then
            matchedColor = k
        end
    end

    if matchedColor == nil then
        return error('Could not perform. ' .. tostring(matchedColor) .. ' does not exist in the current color set!')
    end

    local r,g,b,a = unpack(colorSet[matchedColor].rgba)

    if isOpaque then
        colorOpaqueList = {r,g,b,a}
        return colorOpaqueList
    elseif not isOpaque then
        colorList = {r,g,b}
        return colorList
    end
end

if colorDebug then
    local testColor
    testColor = color.setColorFormat("white", false)

    for i,v in ipairs(testColor) do
        print(v)
    end
end

return color