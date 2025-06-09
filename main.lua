-- Myrrh: Main Entrypoint

-- Disable requirement to include "src" when importing game states, components, etc.
love.filesystem.setRequirePath(love.filesystem.getRequirePath() .. ";src/?.lua")

-- Libraries:
local fsm = require "libs.fsm.hump"
local evolved = require "libs.ecs.evolved"

-- Enable debugging features for various libraries.
evolved.debug_mode(true)

-- States:
-- An FSM state machine is used to manage the game states, we need to include/import each state that we will be using.
local splash = require "states.splash"

-- Initalize the game.
function love.load()
    fsm.registerEvents() -- Register all events to be processed by the FSM.
    fsm.switch(splash)     -- Switch to the initial state, which is the splash state.
end

-- There is no need to use love.update or love.draw here, as the FSM will handle those calls automatically based on the current state.