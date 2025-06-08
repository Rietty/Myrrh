-- Myrrh: Position Fragment
-- This fragment is used to indicate the two dimensional position of an object in the game world.
-- The separated X and Y coordinates can be accessed and processed either independently or together as a vector using the vector library.

-- Libraries:
local evolved = require "libs.ecs.evolved"

local x = evolved.builder()
    :name('fragments.position.x')
    :default(0)
    :spawn()

local y = evolved.builder()
    :name('fragments.position.y')
    :default(0)
    :spawn()
    
return {
    x = x,
    y = y,
}