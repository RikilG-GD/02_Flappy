PlayState = Class{__includes = BaseState}

function PlayState:enter(lastState)
    self.scoreText = 'Score: '
    self.score = 0
    self.pipeSpawnTimer = 0
    self.bird = Bird()
    self.proceduralPipes = {}
    if lastState then
        self.score = lastState.score
        self.pipeSpawnTimer = lastState.pipeSpawnTimer
        self.bird = lastState.bird
        self.proceduralPipes = lastState.proceduralPipes
    end
end

function PlayState:update(dt)
    if love.keyboard.keysPressed['escape'] then
        gStateMachine:changeState('pause', {
            ['score'] = self.score,
            ['pipeSpawnTimer'] = self.pipeSpawnTimer,
            ['bird'] = self.bird,
            ['proceduralPipes'] = self.proceduralPipes,
        })
    end

    self.pipeSpawnTimer = self.pipeSpawnTimer + dt

    if self.pipeSpawnTimer > 2 then
        self.pipeSpawnTimer = 0
        table.insert(self.proceduralPipes, PipePair())
    end

    self.bird:update(dt)

    if self.bird.y < self.bird.height/2 - 10 or self.bird.y > WINDOW_HEIGHT then
        gStateMachine:changeState('score', self.score)
    end

    for k, pipe in pairs(self.proceduralPipes) do
        pipe:update(dt)
        if self.bird:collides(pipe.top) or self.bird:collides(pipe.bottom) then
            gStateMachine:changeState('score', self.score)
        end
        if not pipe.scored and pipe.top.x + pipe.top.width/2 < self.bird.x - self.bird.width/2 then
            self.score = self.score + 1
            pipe.scored = true
        end
        if pipe.remove then
            table.remove(self.proceduralPipes, k)
        end
    end
end

function PlayState:render()
    self.bird:render()
    for k, pipe in pairs(self.proceduralPipes) do
        pipe:render()
    end
    love.graphics.setFont(fonts['retroL'])
    love.graphics.print(self.scoreText .. tostring(self.score), 20, 20)
end

function PlayState:exit() end
