Pipe = Class{}

function Pipe:init()
    self.color = 'red'
    self.pipeColor = {
        ['red'] = love.graphics.newImage('assets/sprites/pipe/RedPipe.png'),
        ['blue'] = love.graphics.newImage('assets/sprites/pipe/BluePipe.png'),
        ['green'] = love.graphics.newImage('assets/sprites/pipe/GreenPipe.png'),
    }
end

function Pipe:setColor(color)
    assert(color == 'red' or color == 'blue' or color == 'green')
    self.color = color
end

function Pipe:update(dt)

end

function Pipe:render()

end
