-- Myrrh: Game State

-- Libraries:
local fsm = require "libs.fsm.hump"
local evolved = require "libs.ecs.evolved"
local map = require "utils.map"

-- ECS Related Imports:
-- Entities:
local player = require "entities.player"
local level = require "entities.level"
-- Fragments:
local deltatime = require "fragments.deltatime"
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
    self.level = level:spawn()
    self.map = map.generateConnectedMap(80, 80, 30, 5, 15)
    map.printMap(self.map)
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
end

function game:leave()
    print("Leaving Game State")
end

return game
