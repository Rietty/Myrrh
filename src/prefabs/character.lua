-- Myrrh: Character Prefab
-- This prefab is used as the basis for creating entities for players, npcs and enemies in the game world.

-- Libraries:
local evolved = require "libs.ecs.evolved"

-- Fragments:
local position = require "fragments.position"
local sprite = require "fragments.sprite"
local health = require "fragments.health"

local character = evolved.builder()
    :prefab()
    :set(health.current, 100)
    :set(health.max, 100)
    :set(position.x, 0)
    :set(position.y, 0)
    :set(sprite.image)
    :set(sprite.animations)
    :spawn()

return character