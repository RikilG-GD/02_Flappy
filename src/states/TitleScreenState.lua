TitleScreenState = Class{__includes = BaseState}

function TitleScreenState:enter()
    self.title = 'FLAPPY!'
    self.titleX = WINDOW_WIDTH/2 - fonts['retroXL']:getWidth(self.title)/2
    self.titleY = WINDOW_HEIGHT/4 - fonts['retroXL']:getHeight(self.title)/2
    self.info = 'Press <ENTER> to start game, <ESC> or <Q> to quit'
    self.infoX = WINDOW_WIDTH/2 - fonts['retroL']:getWidth(self.info)/2
    self.infoY = 3*WINDOW_HEIGHT/4 - fonts['retroL']:getHeight(self.info)/2
end

function TitleScreenState:update(dt)
    if love.keyboard.keysPressed['enter'] or love.keyboard.keysPressed['return'] then
        gStateMachine:changeState('countdown')
    end
    if love.keyboard.keysPressed['escape'] or love.keyboard.keysPressed['q'] then
        love.event.quit()
    end
end

function TitleScreenState:render()
    love.graphics.setFont(fonts['retroXL'])
    love.graphics.print(self.title, self.titleX, self.titleY)
    love.graphics.setFont(fonts['retroL'])
    love.graphics.print(self.info, self.infoX, self.infoY)
end

function TitleScreenState:exit() end
