local helper = require('src.helper')

describe('helpers', function()
    it('true', function()
        assert.are.truthy(helper.table_contains({ a = 1, b = 2, c = 1, d = 1 }, 2))
    end)
    it('true', function()
        assert.are.truthy(helper.table_contains({ a = 1, b = 1, c = 1, d = 3 }, 3))
    end)
    it('false', function()
        assert.are.falsy(helper.table_contains({ a = 1, b = 1, c = 1, d = 1 }, 2))
    end)

end)
