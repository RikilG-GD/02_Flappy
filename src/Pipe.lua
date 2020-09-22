Pipe = Class{}

PIPE_IMAGE = {
    ['red'] = love.graphics.newImage('assets/sprites/pipe/RedPipe.png'),
    ['blue'] = love.graphics.newImage('assets/sprites/pipe/BluePipe.png'),
    ['green'] = love.graphics.newImage('assets/sprites/pipe/GreenPipe.png'),
}

function Pipe:init(offset, isTop)
    self.color = 'blue'
    self.isTop = isTop or false
    self.width = PIPE_IMAGE[self.color]:getWidth()
    self.height = PIPE_IMAGE[self.color]:getHeight()
    self.dx = -300
    self.x = WINDOW_WIDTH + self.width/2 + 10
    self.y = WINDOW_HEIGHT/2 + offset
    if self.isTop then
        self.y = self.y - self.height/2
    else
        self.y = self.y + self.height/2
    end
end

function Pipe:setColor(color)
    assert(color == 'red' or color == 'blue' or color == 'green')
    self.color = color
end

function Pipe:update(dt)
    self.x = self.x + self.dx * dt
end

function Pipe:render()
    if self.isTop then
        love.graphics.draw(PIPE_IMAGE[self.color], self.x - self.width/2, self.y + self.height/2, 0, 1.1, -1)
    else
        love.graphics.draw(PIPE_IMAGE[self.color], self.x - self.width/2, self.y - self.height/2, 0, 1.1, 1)
    end
end
