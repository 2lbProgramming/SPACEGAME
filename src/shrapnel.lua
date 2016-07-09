local shrapnel = {} -- module object

local entities = {} -- shrapnel from bullets hitting edge of screen

function shrapnel.add(x, duration)
  newShrapnel = {x = x, duration = duration}
  table.insert(entities, newShrapnel)
end

function shrapnel.update(dt)
  for i, entity in ipairs(entities) do
    entity.duration = entity.duration - dt
    if entity.duration < 0 then
      table.remove(entities, i)
    end
  end
end

function shrapnel.draw()
  for i, entity in ipairs(entities) do
    love.graphics.draw(images.shrapnel, entity.x, 0)
  end
end

return shrapnel
