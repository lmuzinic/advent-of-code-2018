local day06 = require('src.day06')
local input = [[1, 1
1, 6
8, 3
3, 4
5, 5
8, 9
]]

describe('day06 part one', function()
    it('calculates largest area', function()
        assert.are.equal(17, day06.largest_area(input))
    end)

    describe('manhattan distance', function()
        it('calculates same point', function()
            local manhattan = day06.manhattan({ x = 0, y = 0 }, { x = 0, y = 0 })

            assert.are.equal(0, manhattan.distance)
            assert.are.same({ x = 0, y = 0 }, manhattan.point)
        end)

        it('calculates distance to 1,1', function()
            local manhattan = day06.manhattan({ x = 0, y = 0 }, { x = 1, y = 1 })

            assert.are.equal(2, manhattan.distance)
            assert.are.same({ x = 1, y = 1 }, manhattan.point)
        end)

        it('calculates distance from 0,5', function()
            local manhattan = day06.manhattan({ x = 0, y = 0 }, { x = 0, y = 5 })

            assert.are.equal(5, manhattan.distance)
            assert.are.same({ x = 0, y = 5 }, manhattan.point)
        end)

        it('calculates distance between points', function()
            local manhattan = day06.manhattan({ x = 10, y = 10 }, { x = 5, y = 5 })

            assert.are.equal(10, manhattan.distance)
            assert.are.same({ x = 5, y = 5 }, manhattan.point)
        end)

        it('calculates distance between points', function()
            local manhattan = day06.manhattan({ x = 0, y = 0 }, { x = 5, y = 1 })

            assert.are.equal(6, manhattan.distance)
            assert.are.same({ x = 5, y = 1 }, manhattan.point)
        end)

        it('calculates distance between points', function()
            local manhattan = day06.manhattan({ x = 4, y = 9 }, { x = 8, y = 9 })

            assert.are.equal(4, manhattan.distance)
            assert.are.same({ x = 8, y = 9 }, manhattan.point)
        end)
    end)

    describe('bounding box', function()
        it('returns top left, bottom right', function()
            local top_left, bottom_right = day06.bounding_box({
                { x = 1, y = 1 },
                { x = 1, y = 6 },
                { x = 8, y = 3 },
                { x = 3, y = 4 },
                { x = 5, y = 5 },
                { x = 8, y = 9 },
            })

            assert.are.same({ x = 1, y = 1 }, top_left)
            assert.are.same({ x = 8, y = 9 }, bottom_right)
        end)

        it('returns top left, bottom right', function()
            local top_left, bottom_right = day06.bounding_box({
                { x = 1, y = 2 },
                { x = 10, y = 3 },
                { x = 3, y = 5 },
                { x = 1, y = 11 },
            })

            assert.are.same({ x = 1, y = 2 }, top_left)
            assert.are.same({ x = 10, y = 11 }, bottom_right)
        end)
    end)
end)

describe('day06 part two', function()
    it('calculates largest region', function()
        assert.are.equal(16, day06.largest_region(input, 32))
    end)

end)
