local day04 = require('src.day04')
local test_input = [[[1518-11-01 00:00] Guard #10 begins shift
[1518-11-01 00:05] falls asleep
[1518-11-01 00:25] wakes up
[1518-11-01 00:30] falls asleep
[1518-11-01 00:55] wakes up
[1518-11-01 23:58] Guard #99 begins shift
[1518-11-02 00:40] falls asleep
[1518-11-02 00:50] wakes up
[1518-11-03 00:05] Guard #10 begins shift
[1518-11-03 00:24] falls asleep
[1518-11-03 00:29] wakes up
[1518-11-04 00:02] Guard #99 begins shift
[1518-11-04 00:36] falls asleep
[1518-11-04 00:46] wakes up
[1518-11-05 00:03] Guard #99 begins shift
[1518-11-05 00:45] falls asleep
[1518-11-05 00:55] wakes up
]]

describe('day04 part one', function()
    it('most minutes', function()
        assert.are.equal(240, day04.most_minutes(test_input))
    end)
end)

describe('day04 part two', function()
    it('most frequent', function()
        assert.are.equal(4455, day04.most_frequent(test_input))
    end)
end)

describe('day04 helper', function()
    it('frequent count 42', function()
        minute, count = day04.frequent_count({10, 20, 42, 30, 42})

        assert.are.equal(42, minute)
        assert.are.equal(2, count)
    end)
    it('frequent count 20', function()
        minute, count = day04.frequent_count({10, 20, 42, 30, 42, 20, 20})

        assert.are.equal(20, minute)
        assert.are.equal(3, count)
    end)
end)

