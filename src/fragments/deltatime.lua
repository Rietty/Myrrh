-- Myrrh: DeltaTime Fragment
-- This fragment holds the delta time value for the current frame.

-- Libraries:
local evolved = require "libs.ecs.evolved"

local deltatime = evolved.builder()
    :name('fragments.deltatime')
    :default(0)
    :spawn()

return deltatime