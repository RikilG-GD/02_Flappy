PipePair = Class{}

function PipePair:init()
    self.gapWidth = math.random(140, 210)
    self.shift = math.random(-200, 200)
    self.remove = false
    self.scored = false
    self.top = Pipe(-self.gapWidth/2+self.shift/2, true)
    self.bottom = Pipe(self.gapWidth/2+self.shift/2)
end

function PipePair:update(dt)
    self.top:update(dt)
    self.bottom:update(dt)
    if self.bottom.x + self.bottom.width/2 + 5 < 0 then
        self.remove = true
    end
end

function PipePair:render()
    self.top:render()
    self.bottom:render()
end
