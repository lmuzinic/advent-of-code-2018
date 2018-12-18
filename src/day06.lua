local file = require('src.file')
local puzzle_input = file.read('inputs/day06.io')

local day06 = {}

function day06.first()
    return day06.largest_area(puzzle_input)
end

function day06.second()
    return day06.largest_region(puzzle_input, 10000)
end

function day06.largest_area(input)
    local list, area, border = {}, {}, {}
    for line in string.gmatch(input, "([^\n]+)") do
        local x, y = string.match(line, "(%d+), (%d+)")
        table.insert(list, { x = tonumber(x), y = tonumber(y) })
        area[x .. "," .. y] = 0
    end

    local top_left, bottom_right = day06.bounding_box(list)

    for x = top_left.x, bottom_right.x do
        for y = top_left.y, bottom_right.y do
            local distances = {}

            for i, point in ipairs(list) do
                local manhattan = day06.manhattan({ x = x, y = y }, point)
                table.insert(distances, manhattan)
            end

            table.sort(distances, function(a, b)
                return a.distance < b.distance
            end)

            if (distances[1].distance ~= distances[2].distance) then
                local key = distances[1].point.x .. ',' .. distances[1].point.y

                area[key] = area[key] + 1
                if (x == top_left.x or x == bottom_right.x or y == top_left.y or y == bottom_right.y) then
                    border[key] = true
                end
            end
        end
    end

    local max = 0
    for i, v in pairs(area) do
        if (border[i] == nil and v > max) then
            max = v
        end
    end

    return max
end

function day06.largest_region(input, size)
    local list, region_size = {}, 0
    for line in string.gmatch(input, "([^\n]+)") do
        local x, y = string.match(line, "(%d+), (%d+)")
        table.insert(list, { x = tonumber(x), y = tonumber(y) })
    end

    local top_left, bottom_right = day06.bounding_box(list)

    for x = top_left.x, bottom_right.x do
        for y = top_left.y, bottom_right.y do
            local region = 0

            for i, point in ipairs(list) do
                local manhattan = day06.manhattan({ x = x, y = y }, point)

                region = region + manhattan.distance
            end

            if region < size then
                region_size = region_size + 1
            end
        end
    end

    return region_size
end

function day06.manhattan(from, to)
    return {
        distance = math.abs(to.x - from.x) + math.abs(to.y - from.y),
        point = to
    }
end

function day06.bounding_box(list)
    local first = list[1]
    local tx, ty, bx, by = first.x, first.y, first.x, first.y

    for _, point in ipairs(list) do
        if (point.x < tx) then
            tx = point.x
        end

        if (point.y < ty) then
            ty = point.y
        end

        if (point.x > bx) then
            bx = point.x
        end

        if (point.y > by) then
            by = point.y
        end
    end

    return { x = tx, y = ty }, { x = bx, y = by }
end

function day06.point()
    return { x = 0, y = 0 }
end

return day06