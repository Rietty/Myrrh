-- Myrrh: Game State

-- Libraries:
local fsm = require "libs.fsm.hump"

-- Game State:
local game = {}

-- The following functions are called by the FSM when entering, updating, and drawing the Game state.
function game:enter() 
    print("Entering Game State")
end

function game:update(dt)
    print("Updating Game State")
end

function game:draw()
    print("Drawing Game State")
end

function game:leave()
    print("Leaving Game State")
end

return game