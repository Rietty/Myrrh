-- Myrrh: General Groups
-- The following groups are used to define stages in the game, i.e. rendering and updating and other global level system groupings.
-- Every system must belong to one and only one of these groups.

-- Libraries:
local evolved = require("libs.ecs.evolved")

local UPDATE = evolved.builder()
    :name("stages.update")
    :spawn()

local DRAW = evolved.builder()
    :name("stages.draw")
    :spawn()

return {
    UPDATE = UPDATE,
    DRAW = DRAW,
}