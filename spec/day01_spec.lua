local day01 = require('src.day01')

describe('day01 part one', function ()
    it('positive', function ()
        assert.are.equal(3, day01.frequency('+1\n+1\n+1'))
    end)
    it('zero', function ()
        assert.are.equal(0, day01.frequency('+1\n+1\n-2'))
    end)
    it('negative', function ()
        assert.are.equal(-6, day01.frequency('-1\n-2\n-3'))
    end)
end)

describe('day01 part two', function ()
    it('case', function ()
        assert.are.equal(0, day01.reach('+1\n-1'))
    end)
    it('case', function ()
        assert.are.equal(10, day01.reach('+3\n+3\n+4\n-2\n-4'))
    end)
    it('case', function ()
        assert.are.equal(5, day01.reach('-6\n+3\n+8\n+5\n-6'))
    end)
    it('case', function ()
        assert.are.equal(14, day01.reach('+7\n+7\n-2\n-7\n-4'))
    end)
end)