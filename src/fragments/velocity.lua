-- Myrrh: Velocity Fragment
-- This fragment is used to indicate the two dimensional velocity of an object in the game world.

-- Libraries:
local evolved = require "libs.ecs.evolved"

local x = evolved.builder()
    :name('fragments.velocity.x')
    :default(0)
    :spawn()

local y = evolved.builder()
    :name('fragments.velocity.y')
    :default(0)
    :spawn()
    
return {
    x = x,
    y = y
}