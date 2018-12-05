local file = require('src.file')
local puzzle_input = file.read('inputs/day04_sorted.io')

local day04 = {}

function day04.first()
    return day04.most_minutes(puzzle_input)
end

function day04.second()
    return day04.most_frequent(puzzle_input)
end

function day04.most_minutes(input)
    local guards = day04.prepare_guards(input)

    local sleepy_guard
    local sleepy_guard_max = 0
    for guard_id, guard in pairs(guards) do
        if (guard.total_minutes > sleepy_guard_max) then
            sleepy_guard_max = guard.total_minutes
            sleepy_guard = { id = guard_id, minute = day04.frequent_count(guard.minutes) }
        end
    end

    return sleepy_guard.id * sleepy_guard.minute
end

function day04.most_frequent(input)
    local guards = day04.prepare_guards(input)

    local sleepy_guard, count, minute = nil, nil, nil
    local sleepy_guard_max = 0
    for guard_id, guard in pairs(guards) do
        minute, count = day04.frequent_count(guard.minutes)
        if (count > sleepy_guard_max) then
            sleepy_guard_max = count
            sleepy_guard = { id = guard_id, minute = minute }
        end
    end

    return sleepy_guard.id * sleepy_guard.minute
end

function day04.prepare_guards(input)
    local id, from, to = nil, nil, nil
    local guards = {}

    for line in string.gmatch(input, "([^\n]+)") do
        local min, event = string.match(line, "%d+-%d+-%d+ %d+:(%d+)] ([#%d%w%s^\n]+)")

        local new_id = string.match(event, "#(%d+)")
        if (id ~= new_id and new_id ~= nil) then
            from, to = nil, nil
            id = tonumber(new_id)
        end

        if (event == 'falls asleep') then
            from = tonumber(min)
        end

        if (event == 'wakes up') then
            to = tonumber(min)
        end

        if (from ~= nil and to ~= nil) then
            if (guards[id] == nil) then
                guards[id] = { total_minutes = 0, minutes = {} }
            end

            guards[id].total_minutes = guards[id].total_minutes + (tonumber(to) - tonumber(from))

            for minutes = from, to do
                table.insert(guards[id].minutes, minutes)
            end

            from, to = nil, nil
        end

    end

    return guards
end

function day04.frequent_count(input)
    items = {}
    for _, number in pairs(input) do
        if (items[number] == nil) then
            items[number] = 0
        end

        items[number] = items[number] + 1
    end

    local count, minute = 0, 0
    for item, occurrences in pairs(items) do
        if (occurrences > count) then
            minute = item
            count = occurrences
        end
    end

    return minute, count
end

return day04