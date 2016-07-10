-- Tutorial: http://www.osmstudios.com/tutorials/your-first-love2d-game-in-200-lines-part-1-of-3

debug = true -- turn off for release
-- Timers
canShoot = true
canShootTimerMax = 0.2
canShootTimer = canShootTimerMax

-- resources
images = {}

-- Bullet storage
bullets = {} -- array of current bullets being drawn and updated

local player_upd

function love.load(arg)
	local lg = love.graphics
	images.bullet = lg.newImage('assets/bullet.png')
	images.player = lg.newImage('assets/fighter.png') -- CC0 licensed from opengameart
  images.shrapnel = lg.newImage('assets/shrapnel.png')
	player = { x = 200, y = 640, speed = 150, img = images.player, update = player_upd}
  shrapnel = require 'src/shrapnel'
end

function player_upd(self, dt)
  if love.keyboard.isDown('left', 'a') then
    if self.x > 0 then -- binds player to the map
      self.x = self.x - (self.speed*dt)
    end
  elseif love.keyboard.isDown('right', 'd') then
    if self.x < (love.graphics.getWidth() - self.img:getWidth()) then
      self.x = self.x + (self.speed*dt)
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
    newBullet = { x = self.x + (self.img:getWidth()/2), y = self.y, img = images.bullet }
    table.insert(bullets, newBullet)
    canShoot = false
    canShootTimer = canShootTimerMax
  end
end


function love.update(dt)
  -- Quitting
  if love.keyboard.isDown('escape') then
    love.event.quit()
  end
  
  if player.update then player:update(dt) end

  -- update bullet positions
  for i, bullet in ipairs(bullets) do
    bullet.y = bullet.y - (250 * dt)

    if bullet.y < 0 then -- remove when they pass off screen
      shrapnel.add(bullet.x
        + (images.bullet:getWidth() - images.shrapnel:getWidth()) / 2, 0.1)
      table.remove(bullets, i)
    end

  end
  shrapnel.update(dt)
end

function love.draw(dt)
  -- player
  love.graphics.draw(player.img, player.x, player.y)

  -- bullets
  for i, bullet in ipairs(bullets) do
    love.graphics.draw(bullet.img, bullet.x, bullet.y)
  end

  shrapnel.draw()
end
