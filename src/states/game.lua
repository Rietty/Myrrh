-- Myrrh: Game State

-- Libraries:
local fsm = require "libs.fsm.hump"
local evolved = require "libs.ecs.evolved"
local map = require "utils.map"

-- ECS Related Imports:
-- Entities:
local player = require "entities.player"
-- Groups:
local stages = require "groups.stages"
-- Systems:
require "systems.draw"
require "systems.physics"

-- Game State:
local game = {}

-- DELETE OR MOVE LATER:
local TILE_SIZE = 32
local TILESET_IMG = love.graphics.newImage("assets/Dungeon Archivist - Main Set/Tilesets/Tileset Gray.png")

local quads = {
    floor = {},
    wall = {},
}

local function generateQuads()
    for i = 0, 12 do
        table.insert(quads.floor, love.graphics.newQuad(
            i * TILE_SIZE, 25, TILE_SIZE, TILE_SIZE, TILESET_IMG
        ))
    end
end
-- END DELETE OR MOVE LATER

-- The following functions are called by the FSM when entering, updating, and drawing the Game state.
function game:enter()
    print("Entering Game State")
    -- Create a new player and use them.
    self.player = player:spawn()
    print("Player created with ID:", self.player)
    self.map = map.generateConnectedMap(80, 80, 30, 5, 15)
    generateQuads()

    for y, row in ipairs(self.map) do
        for x, tile in ipairs(row) do
            if tile == 1 then
                self.map[y][x] = "#"
            elseif tile == 0 then
                self.map[y][x] = "."
            end
        end
    end

    self.tile_variants = {}
    for y, row in ipairs(self.map) do
        self.tile_variants[y] = {}
        for x, tile in ipairs(row) do
            if tile == "." then
                self.tile_variants[y][x] = math.random(#quads.floor)
            end
        end
    end
end

function game:update(dt)
    evolved.process(stages.UPDATE)
end

function game:draw()
    for y, row in ipairs(self.map) do
        for x, tile in ipairs(row) do
            local drawX, drawY = (x - 1) * TILE_SIZE, (y - 1) * TILE_SIZE
            if tile == "." then
                local variant = self.tile_variants[y][x]
                love.graphics.draw(TILESET_IMG, quads.floor[variant], drawX, drawY)
            end
        end
    end
    evolved.process(stages.DRAW)
end

function game:leave()
    print("Leaving Game State")
end

return game
