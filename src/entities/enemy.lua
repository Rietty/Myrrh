-- Myrrh: Enemy Entity
-- This entity represents a basic enemy in the game world with all related fragments.

-- Libraries:
local evolved = require "libs.ecs.evolved"

-- Fragments:
local velocity = require "fragments.velocity"

-- Player Entity:
local enemy = evolved.builder()
    :name("entities.enemy")
    :set(velocity.x, 0)
    :set(velocity.y, 0)

-- We will need to do a :clone(prefab) to actually spawn a unique entity.
return enemy