if arg[1] == nil then
    print("usage: lua all.lua [days]")
    os.exit(1)
end

for day = 1, arg[1] do
    local module = require(string.format("src.day%02d", day))

    print(string.format("Day %s part 1: ", day) .. module.first())
    print(string.format("Day %s part 2: ", day) .. module.second())
end

