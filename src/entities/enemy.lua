-- Myrrh: Enemy Entity
-- This entity represents an enemy in the game world with all related fragments.

-- Libraries:
local evolved = require "libs.ecs.evolved"

-- Fragments:
local health = require "fragments.health"
local position = require "fragments.position"
local sprite = require "fragments.sprite"
local velocity = require "fragments.velocity"

-- enemy Entity:
local enemy = evolved.builder()
    :name('entities.enemy')
    :set(health.current, 100)
    :set(health.max, 100)
    :set(position.x, 0)
    :set(position.y, 0)
    :set(sprite.animations)
    :set(sprite.image)
    :set(velocity.x, 0)
    :set(velocity.y, 0)
    
return enemy