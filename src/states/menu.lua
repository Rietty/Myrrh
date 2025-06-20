-- Myrrh: Menu State

-- Libraries:
local fsm = require "libs.fsm.hump"
local game = require "states.game"

-- Menu State:
local menu = {}

-- The following functions are called by the FSM when entering, updating, and drawing the menu state.
function menu:enter() 
    print("Entering Menu State")
end

function menu:update(dt)
    -- Update.
end

function menu:draw()
    -- Draw.
end

function menu:leave()
    print("Leaving Menu State")
end

function menu:keypressed(key)
    if key == "return" then
        fsm.switch(game)  -- Transition to the game state when the return key is pressed.
    end
end

return menu