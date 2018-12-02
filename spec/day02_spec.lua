local day02 = require('src.day02')

describe('day02 part one', function()
    it('checksum', function()
        assert.are.equal(12, day02.checksum([[abcdef
bababc
abbcde
abcccd
aabcdd
abcdee
ababab
]]))
    end)

    describe('counts', function()
        it('none', function()
            assert.are.same({ double = 0, triple = 0 }, day02.count('abcdef'))
        end)
        it('both', function()
            assert.are.same({ double = 1, triple = 1 }, day02.count('bababc'))
        end)
        it('just two', function()
            assert.are.same({ double = 1, triple = 0 }, day02.count('abbcde'))
        end)
        it('just three', function()
            assert.are.same({ double = 0, triple = 1 }, day02.count('abcccd'))
        end)
        it('two counts as 1', function()
            assert.are.same({ double = 1, triple = 0 }, day02.count('aabcdd'))
        end)
        it('just two at the end', function()
            assert.are.same({ double = 1, triple = 0 }, day02.count('abcdee'))
        end)
        it('three counts as 1', function()
            assert.are.same({ double = 0, triple = 1 }, day02.count('ababab'))
        end)
    end)
end)

describe('day02 part two', function()
    it('equal letters', function()
        assert.are.equal('fgij', day02.equal([[abcde
fghij
klmno
pqrst
fguij
axcye
wvxyz
]]))
    end)
end)
