Bird = Class{}

BIRD_SPRITE = love.graphics.newImage('assets/sprites/birdSmall.png')
GRAVITY = 15

function Bird:init()
    self.width = BIRD_SPRITE:getWidth()
    self.height = BIRD_SPRITE:getHeight()
    self.x = WINDOW_WIDTH/2 - self.width/2
    self.y = WINDOW_HEIGHT/2 - self.height/2
    self.dy = 0
end

function Bird:collides(obj)
    -- some variable bounds for better understanding
    ballLeft = self.x - self.width/2 + 10
    ballRight = self.x + self.width/2 - 10
    ballTop = self.y - self.height/2 + 10
    ballBottom = self.y + self.height/2 - 10
    objLeft = obj.x - obj.width/2
    objRight = obj.x + obj.width/2
    objTop = obj.y - obj.height/2
    objBottom = obj.y + obj.height/2

    if ballLeft <= objRight and ballRight >= objLeft and ballTop <= objBottom and ballBottom >= objTop then
        return true
    else
        return false
    end
end

function Bird:update(dt)
    self.dy = self.dy + GRAVITY * dt
    self.y = self.y + self.dy

    if love.keyboard.keysPressed['up'] or love.keyboard.keysPressed['space'] or love.keyboard.keysPressed['enter'] or love.keyboard.keysPressed['return'] then
        sounds['jump']:play()
        self.dy = -8
    end
end

function Bird:render()
    love.graphics.draw(BIRD_SPRITE, self.x - self.width/2, self.y - self.height/2)
end
