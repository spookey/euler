#!/usr/bin/env lua

local function factorial(n)
    local res = 1
    for i = 1, n, 1 do
        res = res * i
    end
    return res
end

local function calc(n)
    local res = 0
    for i = 0, n, 1 do
        res = res + (1 / factorial(i))
    end
    return res
end


local limit = 100

if (#arg > 0) then
    local l = tonumber(arg[1])
    if l then limit = l end
end

print(
    string.format("%.16f", calc(limit))
)
