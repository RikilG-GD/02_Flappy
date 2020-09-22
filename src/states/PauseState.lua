PauseState = Class{}

function PauseState:enter(playState)
    parallax:pause()
    self.playState = playState
    self.text = 'PAUSED!'
    self.textX = WINDOW_WIDTH/2 - fonts['retroXL']:getWidth(self.text)/2
    self.textY = WINDOW_HEIGHT/2 - fonts['retroXL']:getHeight(self.text)/2
end

function PauseState:update(dt)
    if love.keyboard.keysPressed['escape'] then
        gStateMachine:changeState('play', self.playState)
    end
end

function PauseState:render()
    self.playState.bird:render()
    for k, pipe in pairs(self.playState.proceduralPipes) do
        pipe:render()
    end

    love.graphics.setFont(fonts['retroXL'])
    love.graphics.print(self.text, self.textX, self.textY)
end

function PauseState:exit()
    parallax:play()
end
