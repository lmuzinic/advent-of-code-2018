local file = require('src.file')
local puzzle_input = file.read('inputs/day05.io')

local day05 = {}

function day05.first()
    return day05.reduced_length(puzzle_input)
end

function day05.second()
    return day05.most_reduced(puzzle_input)
end

function day05.reduced_length(input)
    local reduced = day05.reduce(input)

    return reduced:len()
end

function day05.most_reduced(input)
    local min = day05.reduced_length(input)

    for byte = 97, 122 do
        local removed = day05.remove(string.char(byte), input)
        local len = day05.reduced_length(removed)

        if (min > len) then
            min = len
        end
    end

    return min
end

function day05.reduce(input)
    local first, second
    local position = 1

    while (position < input:len()) do
        first = string.sub(input, position, position)
        second = string.sub(input, position + 1, position + 1)

        if (day05.react(first, second)) then
            input = string.sub(input, 1, position - 1) .. string.sub(input, position + 2)
            if (position > 1) then
                position = position - 1
            end
        else
            position = position + 1
        end

    end

    return input
end

function day05.react(first, second)
    local diff = string.byte(first) - string.byte(second)

    if (math.abs(diff) == 32) then
        return true
    end

    return false
end

function day05.remove(char, input)
    local lower, upper = string.lower(char), string.upper(char)

    return string.gsub(input, "[" .. lower .. upper .. "]", "")
end

return day05