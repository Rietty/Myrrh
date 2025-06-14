-- Myrrh: Game State

-- Libraries:
local evolved = require "libs.ecs.evolved"
local map = require "utils.map"
local layouts = require "utils.layouts"

-- ECS Related Imports:
-- Entities:
local player = require "entities.player"
local level = require "entities.level"

-- Prefabs:
local character = require "prefabs.character"

-- Fragments:
local deltatime = require "fragments.deltatime"
local position = require "fragments.position"

-- Groups:
local stages = require "groups.stages"

-- Systems:
require "systems.draw"
require "systems.physics"

-- Game State:
local game = {}

-- The following functions are called by the FSM when entering, updating, and drawing the Game state.
function game:enter()
    print("Entering Game State")

    self.level = level:spawn()
    self.map = map.generateConnectedMap(80, 80, 30, 5, 15)
    map.printMap(self.map)

    self.tileset_image = love.graphics.newImage("assets/Dungeon Archivist - Main Set/Tilesets/Tileset Blue.png")
    self.tile_quads = {}

    for y = 1, #map do
        self.tile_quads[y] = {}
        for x = 1, #map[y] do
            if map[y][x] == 0 then
                self.tile_quads[y][x] = map.random_tile_quad(layouts.tilesets, "main", "floor", self.tileset_image)
                print("Tile Quad for (" .. x .. ", " .. y .. "): " .. tostring(self.tile_quads[y][x]))
            end
        end
    end
end

function game:update(dt)
    -- Update the delta time fragment so systems can use it as they see fit.
    evolved.set(self.level, deltatime, dt)
    -- Process all systems with an update.
    evolved.process(stages.UPDATE)
end

function game:draw()
    -- Draw all systems that require being able to print to screen.
    evolved.process(stages.DRAW)
    for y = 1, #map do
        for x = 1, #map[y] do
            if map[y][x] == 0 then
                love.graphics.draw(self.tileset_image, self.tile_quads[y][x], (x - 1) * 32, (y - 1) * 32)
            end
        end
    end
end

function game:leave()
    print("Leaving Game State")
end

return game
