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

-- The following functions are called by the FSM when entering, updating, and drawing the Game state.
function game:enter()
    print("Entering Game State")
    -- Create a new player and use them.
    self.player = player:spawn()
    self.map = map.generateConnectedMap(80, 80, 30, 5, 15)
    map.printMap(self.map)
end

function game:update(dt)
    evolved.process(stages.UPDATE)
end

function game:draw()
    evolved.process(stages.DRAW)
end

function game:leave()
    print("Leaving Game State")
end

return game
