local file = require('src.file')
local puzzle_input = file.read('inputs/day01.io')

local day01 = {}

function day01.frequency(input)
    local sum = 0

    for change in string.gmatch(input, "[+|-]%d+") do
        sum = sum + tonumber(change)
    end

    return sum
end

function day01.reach(input)
    local frequency = 0
    local reached = {[0] = true}

    while (true) do
        for change in string.gmatch(input, "[+|-]%d+") do
            frequency = frequency + tonumber(change)

            if reached[frequency] == nil then
                reached[frequency] = true
            else
                return frequency
            end
        end
    end
end

function day01.first()
    return day01.frequency(puzzle_input)
end

function day01.second()
    return day01.reach(puzzle_input)
end

return day01