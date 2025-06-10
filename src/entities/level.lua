-- Myrrh: Level Entity
-- This entity represents a level and it's specific properties.
-- Mainly for global properties that are not specific to something else but need to be accessed in a system.

-- Libraries:
local evolved = require "libs.ecs.evolved"

-- Fragments:
local deltatime = require "fragments.deltatime"

-- Level Entity:
local level = evolved.builder()
    :name('entities.level')
    :include(deltatime)

return level