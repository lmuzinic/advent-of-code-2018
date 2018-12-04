local file = require('src.file')
local puzzle_input = file.read('inputs/day03.io')

local day03 = {}

function day03.first()
    return day03.overlap(puzzle_input)
end

function day03.second()
    return day03.intact(puzzle_input)
end

--
function day03.overlap(input)
    local fabric = day03.fabric()
    local overlap = 0
    local start_x, start_y = 0
    local size_x, size_y = 0

    for id, line in string.gmatch(input, "#(%d+) @ (%d+,%d+: %d+x%d+)") do
        start_x, start_y, size_x, size_y = string.match(line, "(%d+),(%d+): (%d+)x(%d+)")
        day03.fill(fabric, start_x, start_y, size_x, size_y, id)
    end

    for x = 1, 1000 do
        for y = 1, 1000 do
            if (#(fabric[x][y]) > 1) then
               overlap = overlap + 1
            end
        end
    end

    return overlap
end

function day03.intact(input)
    local fabric = day03.fabric()
    local start_x, start_y = 0
    local size_x, size_y = 0

    for id, line in string.gmatch(input, "#(%d+) @ (%d+,%d+: %d+x%d+)") do
        start_x, start_y, size_x, size_y = string.match(line, "(%d+),(%d+): (%d+)x(%d+)")
        day03.fill(fabric, start_x, start_y, size_x, size_y, id)
    end

    for id, line in string.gmatch(input, "#(%d+) @ (%d+,%d+: %d+x%d+)") do
        start_x, start_y, size_x, size_y = string.match(line, "(%d+),(%d+): (%d+)x(%d+)")
        local check = day03.check(fabric, start_x, start_y, size_x, size_y, tonumber(id))

        if (check) then
            return tonumber(id)
        end
    end
end

function day03.fabric()
    local fabric = {}
    for x = 1, 1000 do
        fabric[x] = {}
        for y = 1, 1000 do
            fabric[x][y] = {}
        end
    end

    return fabric
end

function day03.fill(fabric, start_x, start_y, size_x, size_y, id)
    for x = start_x + 1, start_x + size_x do
        for y = start_y + 1, start_y + size_y do
            day03.insert(fabric[x][y], id)
        end
    end
end

function day03.check(fabric, start_x, start_y, size_x, size_y, id)
    for x = start_x + 1, start_x + size_x do
        for y = start_y + 1, start_y + size_y do
            if (#(fabric[x][y]) > 1) then
                return false
            end
        end
    end

    return true
end

function day03.insert(overlaps, id)
    for i = 1, #overlaps do
        if (overlaps[i] == id) then
            return nil
        end
    end
    table.insert(overlaps, id)
end

return day03