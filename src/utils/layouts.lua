-- Myrrh: Map Layouts
-- These are essentially look up dictionaries that assign a key to specific tiles for a given expansion.

-- Libraries:
local layouts = {}

local function range(a, b)
    local r = {}
    for i = a, b do table.insert(r, i) end
    return r
end

local function coords(row, cols)
    local out = {}
    for _, col in ipairs(cols) do
        table.insert(out, {row=row, col=col})
    end
    return out
end

layouts.tilesets = {
    main = {
        floor = coords(30, range(1, 6))
    }
}

return layouts