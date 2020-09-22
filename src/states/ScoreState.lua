ScoreState = Class{}

function ScoreState:enter(score)
    sounds['death']:play()
    parallax:pause()
    self.score = 'Score: ' .. tostring(score)
    self.scoreX = WINDOW_WIDTH/2 - fonts['retroXL']:getWidth(self.score)/2
    self.scoreY = WINDOW_HEIGHT/4 - fonts['retroXL']:getHeight(self.score)/2
    self.info = 'Press <ENTER> to return to Title Screen or <SPACE> to restart!'
    self.infoX = WINDOW_WIDTH/2 - fonts['retroL']:getWidth(self.info)/2
    self.infoY = 3*WINDOW_HEIGHT/4 - fonts['retroL']:getHeight(self.info)/2
end

function ScoreState:update(dt)
    if love.keyboard.keysPressed['enter'] or love.keyboard.keysPressed['return'] then
        gStateMachine:changeState('title')
    elseif love.keyboard.keysPressed['space'] then
        gStateMachine:changeState('countdown')
    end
end

function ScoreState:render()
    love.graphics.setFont(fonts['retroXL'])
    love.graphics.print(self.score, self.scoreX, self.scoreY)
    love.graphics.setFont(fonts['retroL'])
    love.graphics.print(self.info, self.infoX, self.infoY)
end

function ScoreState:exit()
    parallax:play()
end
