Class = require 'class'

-- add require '' files here
require 'Parallax'
require 'Bird'

WINDOW_WIDTH = 1280
WINDOW_HEIGHT = 720

fonts = {
    ['retroS'] = love.graphics.newFont('assets/fonts/Retro_Gaming.ttf', 16),
    ['retroL'] = love.graphics.newFont('assets/fonts/Retro_Gaming.ttf', 26),
    ['retroXL'] = love.graphics.newFont('assets/fonts/Retro_Gaming.ttf', 42)
}

--[[
sounds = {
    ['paddleHit'] = love.audio.newSource('assets/sounds/PaddleHit.wav', 'static'),
    ['wallHit'] = love.audio.newSource('assets/sounds/WallHit.wav', 'static'),
    ['background'] = love.audio.newSource('assets/sounds/Background.mp3', 'static'),
    ['death'] = love.audio.newSource('assets/sounds/Death.wav', 'static'),
    ['powerUp'] = love.audio.newSource('assets/sounds/PowerUp.wav', 'static'),
    ['gameOver'] = love.audio.newSource('assets/sounds/GameOver.wav', 'static'),
    ['menuOpen'] = love.audio.newSource('assets/sounds/MenuOpen.wav', 'static'),
    ['menuOption'] = love.audio.newSource('assets/sounds/MenuOption.wav', 'static')
}
]]

function love.keypressed(key)
    love.keyboard.keysPressed[key] = true
end

function love.mousepressed(x, y, button)
    love.mouse.buttonsPressed[button] = true
end

function love.load()
    love.graphics.setDefaultFilter('nearest', 'nearest')
    love.window.setTitle('Flappy')
    math.randomseed(os.time())
    -- set window properties
    love.window.setMode(WINDOW_WIDTH, WINDOW_HEIGHT, {
        fullscreen = false,
        resizable = false,
        vsync = true
    })

    love.graphics.setFont(fonts.retroS)
    love.keyboard.keysPressed = {}
    love.mouse.buttonsPressed = {}

    parallax = Parallax()
    bird = Bird()
end

function love.update(dt)
    parallax:update(dt)

    love.keyboard.keysPressed = {}
    love.mouse.buttonsPressed = {}
end

function love.draw()
    parallax:render()
    bird:render()
end
