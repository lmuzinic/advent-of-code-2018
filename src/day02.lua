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
    record = { a = 0, b = 0 }
    for line in string.gmatch(input, "%w+") do
        local count = day02.count(line)
        record.a = record.a + count[1]
        record.b = record.b + count[2]
    end

    return record.a * record.b
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

    local result = {}
    if helper.table_contains(found, 2) == true then
        table.insert(result, 1)
    else
        table.insert(result, 0)
    end

    if helper.table_contains(found, 3) == true then
        table.insert(result, 1)
    else
        table.insert(result, 0)
    end

    return result
end

return day02