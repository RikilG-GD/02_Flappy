Bird = Class{}

BIRD_SPRITE = love.graphics.newImage('assets/sprites/birdSmall.png')

function Bird:init()
    self.width = BIRD_SPRITE:getWidth()
    self.height = BIRD_SPRITE:getHeight()
    self.x = WINDOW_WIDTH/2 - self.width/2
    self.y = WINDOW_HEIGHT/2 - self.height/2
end

function Bird:update(dt)

end

function Bird:render()
    love.graphics.draw(BIRD_SPRITE, self.x, self.y)
end
