-- Tutorial: http://www.osmstudios.com/tutorials/your-first-love2d-game-in-200-lines-part-1-of-3

debug = true -- turn off for release

player = { x = 200, y = 710, speed = 150, img = nil }

function love.load(arg)
  player.img = love.graphics.newImage('assets/fighter.png') -- CC0 licensed from opengameart
end

function love.update(dt)
  -- Quitting
  if love.keyboard.isDown('escape') then
    love.event.push('quit')
  end

  if love.keyboard.isDown('left', 'a') then
    if player.x > 0 then -- binds player to the map
      player.x = player.x - (player.speed*dt)
    end
  elseif love.keyboard.isDown('right', 'd') then
    if player.x < (love.graphics.getWidth() - player.img:getWidth()) then
      player.x = player.x + (player.speed*dt)
    end
  end
end

function love.draw(dt)
  love.graphics.draw(player.img, player.x, player.y)
end
