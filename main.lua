-- Tutorial: http://www.osmstudios.com/tutorials/your-first-love2d-game-in-200-lines-part-1-of-3

debug = true -- turn off for release
-- Timers
canShoot = true
canShootTimerMax = 0.2
canShootTimer = canShootTimerMax

-- Image init, later change to a table?
-- tutorial says we'll declare that object with each bullet created
bulletImg = nil

-- Bullet storage
bullets = {} -- array of current bullets being drawn and updated

player = { x = 200, y = 710, speed = 150, img = nil }

function love.load(arg)
  player.img = love.graphics.newImage('assets/fighter.png') -- CC0 licensed from opengameart
  bulletImg = love.graphics.newImage('assets/bullet.png')
end

function love.update(dt)
  -- Quitting
  if love.keyboard.isDown('escape') then
    love.event.quit()
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

  -- Timing how far apart our shots can be
  canShootTimer = canShootTimer - (1 * dt)
  if canShootTimer < 0 then
    canShoot = true
  end

  -- Firing
  if love.keyboard.isDown('space', ' ', 'rctrl', 'lctrl', 'ctrl') and canShoot then
    -- Create some bullets
    newBullet = { x = player.x + (player.img:getWidth()/2), y = player.y, img = bulletImg }
    table.insert(bullets, newBullet)
    canShoot = false
    canShootTimer = canShootTimerMax
  end

  -- update bullet positions
  for i, bullet in ipairs(bullets) do
    bullet.y = bullet.y - (250 * dt)

    if bullet.y < 0 then -- remove when they pass off screen
      table.remove(bullets, i)
    end
  end
end

function love.draw(dt)
  -- player
  love.graphics.draw(player.img, player.x, player.y)

  -- bullets
  for i, bullet in ipairs(bullets) do
    love.graphics.draw(bullet.img, bullet.x, bullet.y)
  end
end
