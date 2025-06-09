-- Myrrh: Draw System

-- Libraries:
local evolved = require("libs.ecs.evolved")

-- ECS Related Imports:
local stages = require("groups.stages")
local position = require("fragments.position")

return evolved.builder()
    :name("system.draw")
    :group(stages.DRAW)
    :include(position.x, position.y)
    :execute(function(chunk, entity_list, entity_count)
        local px, py = chunk:components(
            position.x, position.y
        )

        for i = 1, entity_count do
            love.graphics.circle('fill', px[i], py[i], 10)
        end
    end):spawn()
