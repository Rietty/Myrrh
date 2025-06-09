-- Myrrh: Controllable Fragment
-- This fragment represents the fact that an entity can be controlled by the player.

-- Libraries:
local evolved = require "libs.ecs.evolved"

local controllable = evolved.builder()
    :name('fragments.controllable')
    :tag()
    :spawn()

return controllable