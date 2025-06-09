-- Myrrh: Focus Fragment
-- This fragment is used to indicate that the camera system follow the associated entity and centers on them.

-- Libraries:
local evolved = require "libs.ecs.evolved"

local focus = evolved.builder()
    :name('fragments.focus')
    :tag()
    :spawn()

return focus