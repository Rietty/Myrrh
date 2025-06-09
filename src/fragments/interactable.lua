-- Myrrh: Interactable Fragment
-- This fragment represents the fact that an entity can be interacted with and thus cause something to happen.

-- Libraries:
local evolved = require "libs.ecs.evolved"

local interactable = evolved.builder()
    :name('fragments.interactable')
    :tag()
    :spawn()

return interactable