Parallax = Class{}

local BackSkyScrollSpeed = 1
local MountBackScrollSpeed = 2
local MountFrontScrollSpeed = 4
-- local BackMainScrollSpeed = 4

local BackSkyScrollX = 0
local MountBackScrollX = 0
local MountFrontScrollX = 0
-- local BackMainScrollX = 0

local ParallaxBounds = 1788

function Parallax:init()
    self.isMoving = true
    self.color = 'blue'
    self.background = {
        ['blue'] = {
            ['BackSky'] = love.graphics.newImage('assets/sprites/parallax/blue/BackSky.png'),
            ['MountBack'] = love.graphics.newImage('assets/sprites/parallax/blue/MountBack.png'),
            ['MountFront'] = love.graphics.newImage('assets/sprites/parallax/blue/MountFront.png'),
            -- ['BackMain'] = love.graphics.newImage('assets/sprites/parallax/blue/BackMain.png')
        },
        ['red'] = {
            ['BackSky'] = love.graphics.newImage('assets/sprites/parallax/red/BackSky.png'),
            ['MountBack'] = love.graphics.newImage('assets/sprites/parallax/red/MountBack.png'),
            ['MountFront'] = love.graphics.newImage('assets/sprites/parallax/red/MountFront.png'),
            -- ['BackMain'] = love.graphics.newImage('assets/sprites/parallax/red/BackMain.png')
        }
    }
end

function Parallax:setColor(color)
    assert(color == 'red' or color == 'blue')
    self.color = color
end

function Parallax:pause()
    self.isMoving = false
end

function Parallax:play()
    self.isMoving = true
end

function Parallax:update(dt)
    if self.isMoving then
        BackSkyScrollX = (BackSkyScrollX + BackSkyScrollSpeed) % ParallaxBounds
        MountBackScrollX = (MountBackScrollX + MountBackScrollSpeed) % ParallaxBounds
        MountFrontScrollX = (MountFrontScrollX + MountFrontScrollSpeed) % ParallaxBounds
        -- BackMainScrollX = (BackMainScrollX + BackMainScrollSpeed) % ParallaxBounds
    end
end

function Parallax:render()
    love.graphics.draw(self.background[self.color].BackSky, -BackSkyScrollX, 0)
    love.graphics.draw(self.background[self.color].MountBack, -MountBackScrollX, 100)
    love.graphics.draw(self.background[self.color].MountFront, -MountFrontScrollX, 200)
    -- love.graphics.draw(self.background[self.color].BackMain, -BackMainScrollX, 0)
end
