local file = require('src.file')
local helper = require('src.helper')
local puzzle_input = file.read('inputs/day02.io')

local day02 = {}

function day02.first()
    return day02.checksum(puzzle_input)
end

function day02.second()
    return day02.equal(puzzle_input)
end

function day02.equal(input)
    local common_string = ''
    local common_num = 0

    for from in string.gmatch(input, "%w+") do
        for to in string.gmatch(input, "%w+") do
            if from == to then
                break
            end

            common_string = ''
            common_num = 0

            for i = 1, to:len() do
                if from:sub(i, i) == to:sub(i, i) then
                    common_string = common_string .. to:sub(i, i)
                    common_num = common_num + 1
                end
            end

            if (common_num == to:len() - 1) then
                return common_string
            end
        end
    end
end

function day02.checksum(input)
    local total = { double = 0, triple = 0 }
    for line in string.gmatch(input, "%w+") do
        local count = day02.count(line)
        total.double = total.double + count.double
        total.triple = total.triple + count.triple
    end

    return total.double * total.triple
end

function day02.count(input)
    local found = {}
    for letter in string.gmatch(input, "%w") do
        if found[letter] == nil then
            found[letter] = 1
        else
            found[letter] = found[letter] + 1
        end
    end

    local result = { double = 0, triple = 0 }
    if helper.table_contains(found, 2) == true then
        result.double = 1
    end

    if helper.table_contains(found, 3) == true then
        result.triple = 1
    end

    return result
end

return day02