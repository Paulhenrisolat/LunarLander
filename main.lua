io.stdout:setvbuf('no')

local Lander = {}
Lander.x = 0
Lander.y = 0
Lander.rotation = math.rad(-90)
Lander.velocityX = 0
Lander.velocityY = 0
Lander.speed = 1
Lander.img = love.graphics.newImage("images/ship.png")
Lander.img2 = love.graphics.newImage("images/engine.png")
Lander.imgW = Lander.img:getWidth()
Lander.imgH = Lander.img:getHeight()
Lander.img2W = Lander.img2:getWidth()
Lander.img2H = Lander.img2:getHeight()
Lander.engineOn = false

function input(dt)
  if love.keyboard.isDown("right") then
    Lander.rotation = Lander.rotation + 2 * dt
  end
  if love.keyboard.isDown("left") then
    Lander.rotation = Lander.rotation - 2 * dt
  end
  if love.keyboard.isDown("up") then
    Lander.engineOn = true
    
    local forceX = math.cos(Lander.rotation) * (Lander.speed * dt)
    local forceY = math.sin(Lander.rotation) * (Lander.speed * dt)
    Lander.velocityX = Lander.velocityX + forceX
    Lander.velocityY = Lander.velocityY + forceY
  else
    Lander.engineOn = false
  end
end
function love.load()
  screenW = love.graphics.getWidth()
  screenH = love.graphics.getHeight()
  
  Lander.x = screenW/2
  Lander.y = screenH/2
  print("pos:"..Lander.x.."|"..Lander.y.." wh:"..Lander.imgW.."|"..Lander.imgH.." screen:"..screenW.."|"..screenH)
end
function love.update(dt)
  input(dt)
  Lander.velocityY = Lander.velocityY + (0.6 * dt)
  
  Lander.x = Lander.x + Lander.velocityX
  Lander.y = Lander.y + Lander.velocityY
end
function love.draw()
  love.graphics.draw(Lander.img, Lander.x, Lander.y, Lander.rotation,1,1,Lander.imgW/2,Lander.imgH/2)
  
  if Lander.engineOn == true then
    love.graphics.draw(Lander.img2, Lander.x, Lander.y, Lander.rotation,1,1,Lander.img2W/2,Lander.img2H/2)
  end
end