Class = require 'class'

-- add require '' files here

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

end

function love.mousepressed(key)

end

function love.load()
    -- set love's default to "nearest-neighbour" which means there will be no filtering of pixels for a better 2D look
    love.graphics.setDefaultFilter('nearest', 'nearest')
    -- set the title of our application window
    love.window.setTitle('Flappy')
    -- set random seed for random number
    math.randomseed(os.time())
    -- set window properties
    love.window.setMode(WINDOW_WIDTH, WINDOW_HEIGHT, {
        fullscreen = false,
        resizable = false,
        vsync = true
    })

    love.graphics.setFont(fonts.retroS)
end

function love.update(dt)

end

function love.draw()

end
