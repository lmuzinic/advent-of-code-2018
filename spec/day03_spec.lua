local day03 = require('src.day03')

describe('day03 part one', function()
    it('overlap', function()
        assert.are.equal(4, day03.overlap([[#1 @ 1,3: 4x4
#2 @ 3,1: 4x4
#3 @ 5,5: 2x2
]]))
    end)
end)

describe('day03 part two', function()
    it('intact', function()
        assert.are.equal(3, day03.intact([[#1 @ 1,3: 4x4
#2 @ 3,1: 4x4
#3 @ 5,5: 2x2
]]))
    end)
end)

