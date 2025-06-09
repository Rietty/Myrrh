-- Myrrh: Player Entity
-- This entity represents a player in the game world with all related fragments.

-- Libraries:
local evolved = require "libs.ecs.evolved"

-- Fragments:
local position = require "fragments.position"
local velocity = require "fragments.velocity"

-- Player Entity:
local player = evolved.builder()
    :name('entities.player')
    :set(position.x, 0)
    :set(position.y, 0)
    :set(velocity.x, 0)
    :set(velocity.y, 0)

return player