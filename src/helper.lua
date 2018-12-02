local helper = {}

function helper.table_contains(table, checking_value)
    for _, current_value in pairs(table) do
        if checking_value == current_value then
            return true
        end
    end

    return false
end

return helper