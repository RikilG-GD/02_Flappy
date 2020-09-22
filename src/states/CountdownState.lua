CountdownState = Class{__includes = BaseState}

function CountdownState:enter()
    self.count = 3
    self.timeout = 0.75
    self.timer = 0
end

function CountdownState:update(dt)
    self.timer = self.timer + dt
    if self.timer > self.timeout then
        self.timer = self.timer - self.timeout
        self.count = self.count - 1
    end

    if self.count == 0 then
        gStateMachine:changeState('play')
    end
end

function CountdownState:render()
    love.graphics.setFont(fonts['retroXL'])
    love.graphics.print(tostring(self.count), WINDOW_WIDTH/2-fonts['retroXL']:getWidth(tostring(self.count))/2, WINDOW_HEIGHT/2-fonts['retroXL']:getHeight(tostring(self.count))/2)
end

function CountdownState:exit() end
