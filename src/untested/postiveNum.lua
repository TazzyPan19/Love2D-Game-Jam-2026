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

local negativeNum1, negativeNum2 = -21, -7
local mixedNum1, mixedNum2 = 21, -7
local postiveNum1, postiveNum2 = 21, 7

print(getPositiveNum(negativeNum1, negativeNum2))
print(getPositiveNum(mixedNum1, mixedNum2))
print(getPositiveNum(postiveNum1, postiveNum2))

-- function utils:createMultipleInstances(instance, args)
--     if type(options) == 'table' then
--         instance:new(args)
--     end
-- end

-- local randList = {}

-- for i=1, 3 do
--     randList["key" .. i] = i *4
-- end

-- for k,v in pairs(randList) do
--     print(k, v)
-- end