-- Myrrh: Player Entity
-- This entity represents a player in the game world with all related fragments.

-- Libraries:
local evolved = require "libs.ecs.evolved"

-- Fragments:
local controllable = require "fragments.controllable"
local focus = require "fragments.focus"
local interactor = require "fragments.interactor"
local velocity = require "fragments.velocity"

-- Player Entity:
local player = evolved.builder()
    :name("player")
    :set(controllable)
    :set(focus)
    :set(interactor)
    :set(velocity.x, 0)
    :set(velocity.y, 0)

-- We will need to do a :clone(prefab) to actually spawn a unique entity.
return player