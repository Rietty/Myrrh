-- Myrrh: Physics System

-- Libraries:
local evolved = require("libs.ecs.evolved")

-- ECS Related Imports:
local stages = require("groups.stages")
local position = require("fragments.position")

return evolved.builder()
    :name("system.physics")
    :group(stages.UPDATE)
    :include(position.x, position.y)
    :execute(function(chunk, entity_list, entity_count)
        local px, py = chunk:components(
            position.x, position.y
        )

        for i = 1, entity_count do
            px[i] = px[i] + 1
            py[i] = py[i] + 1
        end
    end):spawn()
