-- Myrrh: Game State

-- Libraries:
local fsm = require "libs.fsm.hump"
local evolved = require "libs.ecs.evolved"

-- Include the entities for creating a given entity as required.
local player = require "entities.player"

-- Game State:
local game = {}

-- The following functions are called by the FSM when entering, updating, and drawing the Game state.
function game:enter() 
    print("Entering Game State")
    -- Create a new player and use them.
    self.player = player:spawn()
    print("Player created with ID:", self.player)
end

function game:update(dt)
    -- Update.
end

function game:draw()
    -- Draw.
end

function game:leave()
    print("Leaving Game State")
end

return game