-- Myrrh: Map Utilities
-- Map based utilities, including map generation and manipulation and more.
local map_utils = {}

local TILE_SIZE = 32

-- Generates a connected map with rooms.
-- Each room is represented by a rectangle filled with 0s, and walls are represented by 1s.
function map_utils.generateConnectedMap(width, height, roomCount, roomMinSize, roomMaxSize)
    -- We need a random seed to ensure different maps each time the function is called.
    math.randomseed(os.clock() * 100000000000)

    local map = {}
    for y = 1, height do
        map[y] = {}
        for x = 1, width do
            map[y][x] = 1
        end
    end

    local rooms = {}

    local function placeRoom(x, y, w, h)
        for i = y, y + h - 1 do
            for j = x, x + w - 1 do
                if i >= 1 and i <= height and j >= 1 and j <= width then
                    map[i][j] = 0
                end
            end
        end
    end

    local function connectRooms(x1, y1, x2, y2)
        if math.random() < 0.5 then
            for x = math.min(x1, x2), math.max(x1, x2) do map[y1][x] = 0 end
            for y = math.min(y1, y2), math.max(y1, y2) do map[y][x2] = 0 end
        else
            for y = math.min(y1, y2), math.max(y1, y2) do map[y][x1] = 0 end
            for x = math.min(x1, x2), math.max(x1, x2) do map[y2][x] = 0 end
        end
    end

    for _ = 1, roomCount do
        local w = math.random(roomMinSize, roomMaxSize)
        local h = math.random(roomMinSize, roomMaxSize)
        local x = math.random(2, width - w - 1)
        local y = math.random(2, height - h - 1)

        local failed = false
        for _, room in ipairs(rooms) do
            if x < room.x + room.w and x + w > room.x and y < room.y + room.h and y + h > room.y then
                failed = true
                break
            end
        end

        if not failed then
            placeRoom(x, y, w, h)
            local centerX = x + math.floor(w / 2)
            local centerY = y + math.floor(h / 2)

            if #rooms > 0 then
                local prev = rooms[#rooms]
                local prevX = prev.x + math.floor(prev.w / 2)
                local prevY = prev.y + math.floor(prev.h / 2)
                connectRooms(prevX, prevY, centerX, centerY)
            end

            table.insert(rooms, { x = x, y = y, w = w, h = h })
        end
    end

    return map
end

-- Post Processing function to ensure the map has correct tile values for walls.
-- Basically if the map has a tile such that the one below it is a 0, and this tile is a 1 then it should be marked 2 to be a wall.
function map_utils.postProcessMap(map)
    for y = 1, #map do
        for x = 1, #map[y] do
            if map[y][x] == 1 and (y < #map and map[y + 1][x] == 0) then
                map[y][x] = 2 -- Mark as wall
            end
        end
    end

    return map
end

-- Useful for debugging and visualization of the map before using it in the game.
function map_utils.printMap(map)
    for y = 1, #map do
        for x = 1, #map[y] do
            -- io.write(map[y][x] == 0 and "." or "#")
            io.write(map[y][x])
        end
        io.write("\n")
    end
end

-- Retrieves a quad for a given tile. I.e. the coordinates and dimensions of the tile in a tileset.
-- This can then be used to draw the tile on the screen as needed.
function map_utils.get_tile_quad(tile, image)
    return love.graphics.newQuad(
        (tile.col - 1) * TILE_SIZE,
        (tile.row - 1) * TILE_SIZE,
        TILE_SIZE, TILE_SIZE,
        image:getWidth(),
        image:getHeight()
    )
end

-- Retrieves a random tile quad from a specified category in a tileset.
function map_utils.random_tile_quad(tilesets, tileset_key, category, image)
    local tiles = tilesets[tileset_key][category]
    local tile = tiles[love.math.random(#tiles)]
    return map_utils.get_tile_quad(tile, image)
end

return map_utils
