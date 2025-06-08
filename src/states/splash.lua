-- Myrrh: Splash State
-- The purpose of this state is to display a splash screen or logo before transitioning to the main menu.

-- Libraries:
local fsm = require "libs.fsm.hump"
local menu = require "states.menu"

-- Splash State:
local splash = {}

-- Functions called by the FSM on behalf of the splash state:
function splash:enter() 
    print("Entering Splash State")
end

function splash:update(dt)
    print("Updating Splash State")
end

function splash:draw()
    print("Drawing Splash State")
end

function splash:leave()
    print("Leaving Splash State")
end

function splash:keypressed(key)
    if key == "return" then
        fsm.switch(menu)  -- Transition to the menu state when the return key is pressed.
    end
end

return splash