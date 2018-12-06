local day05 = require('src.day05')

describe('day05 part one', function()
    it('reduced length', function()
        assert.are.equal(10, day05.reduced_length('dabAcCaCBAcCcaDA'))
    end)

    it('reduce', function()
        assert.are.equal('dabCBAcaDA', day05.reduce('dabAcCaCBAcCcaDA'))
    end)

    it('reduce end', function()
        assert.are.equal('b', day05.reduce('aaaaaAAAAAb'))
    end)

    it('reduce middle', function()
        assert.are.equal('b', day05.reduce('AaAabAaAaAaAa'))
    end)

    it('react', function()
        assert.truthy(day05.react('a', 'A'))
    end)

    it('react', function()
        assert.truthy(day05.react('A', 'a'))
    end)

    it('no react', function()
        assert.falsy(day05.react('A', 'b'))
    end)

    it('no react', function()
        assert.falsy(day05.react('A', 'A'))
    end)

    it('no react', function()
        assert.falsy(day05.react('b', 'b'))
    end)
end)

describe('day05 part two', function()
    it('full reduced length', function()
        assert.are.equal(4, day05.most_reduced('dabAcCaCBAcCcaDA'))
    end)

    it('remove a', function()
        local removed = day05.remove('a','dabAcCaCBAcCcaDA')
        assert.are.equal('dbcCCBcCcD', removed)
    end)

    it('remove b', function()
        local removed = day05.remove('b','dabAcCaCBAcCcaDA')
        assert.are.equal('daAcCaCAcCcaDA', removed)
    end)

    it('remove c', function()
        local removed = day05.remove('c','dabAcCaCBAcCcaDA')
        assert.are.equal('dabAaBAaDA', removed)
    end)

    it('remove d', function()
        local removed = day05.remove('d','dabAcCaCBAcCcaDA')
        assert.are.equal('abAcCaCBAcCcaA', removed)
    end)
end)
