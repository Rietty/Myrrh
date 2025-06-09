-- Myrrh: Player Entity
-- This entity represents a player in the game world with all related fragments.

-- Libraries:
local evolved = require "libs.ecs.evolved"

-- Fragments:
local controllable = require "fragments.controllable"
local focus = require "fragments.focus"
local health = require "fragments.health"
local interactor = require "fragments.interactor"
local position = require "fragments.position"
local sprite = require "fragments.sprite"
local velocity = require "fragments.velocity"

-- Player Entity:
local player = evolved.builder()
    :name('entities.player')
    :set(controllable)
    :set(focus)
    :set(health.current, 100)
    :set(health.max, 100)
    :set(interactor)
    :set(position.x, 0)
    :set(position.y, 0)
    :set(sprite.animations)
    :set(sprite.image)
    :set(velocity.x, 0)
    :set(velocity.y, 0)
    
return player