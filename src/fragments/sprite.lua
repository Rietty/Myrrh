-- Myrrh: Sprite Fragment
-- This fragment is for holding the image associated with a given entity.

-- Libraries:
local evolved = require "libs.ecs.evolved"

local image = evolved.builder()
    :name('fragments.sprite.image')
    :default(nil)
    :spawn()

local animations = evolved.builder()
    :name('fragments.sprite.animations')
    :default({})
    :spawn()

return {
    image = image,
    animations = animations,
}