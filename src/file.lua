local file = {}

function file.read(path)
    local pointer = assert(io.open(path, 'r'))
    local content = pointer:read('*all')

    pointer:close()

    return content
end
return file