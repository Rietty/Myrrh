-- Myrrh: Interactor Fragment
-- This fragment represents the fact that an entity can interact with other entities in the game world.

-- Libraries:
local evolved = require "libs.ecs.evolved"

local interactor = evolved.builder()
    :name('fragments.interactor')
    :tag()
    :spawn()

return interactor