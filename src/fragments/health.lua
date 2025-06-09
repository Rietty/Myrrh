-- Myrrh: Health Fragment
-- This fragment is used to indicate the health of an entity in the game.

-- Libraries:
local evolved = require "libs.ecs.evolved"

local max = evolved.builder()
    :name('fragments.health.max')
    :default(0)
    :spawn()

local current = evolved.builder()
    :name('fragments.health.current')
    :default(0)
    :spawn()
    
return {
    max = max,
    current = current
}