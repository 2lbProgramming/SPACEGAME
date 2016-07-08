-- Tutorial: http://www.osmstudios.com/tutorials/your-first-love2d-game-in-200-lines-part-1-of-3

debug = true -- turn off for release

playerImg = nil -- for storage

function love.load(arg)
  playerImg = love.graphics.newImage('assets/fighter.png') -- CC0 licensed from opengameart
end

function love.update(dt)

end

function love.draw(dt)
  love.graphics.draw(playerImg, 100, 100)
end
