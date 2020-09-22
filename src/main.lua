Class = require 'class'

-- add require '' files here
require 'Parallax'
require 'Bird'
require 'Pipe'
require 'PipePair'

require 'StateMachine'
require 'states/PlayState'
require 'states/PauseState'
require 'states/ScoreState'
require 'states/CountdownState'
require 'states/TitleScreenState'

WINDOW_WIDTH = 1280
WINDOW_HEIGHT = 720

fonts = {
    ['retroS'] = love.graphics.newFont('assets/fonts/Retro_Gaming.ttf', 16),
    ['retroL'] = love.graphics.newFont('assets/fonts/Retro_Gaming.ttf', 26),
    ['retroXL'] = love.graphics.newFont('assets/fonts/Retro_Gaming.ttf', 50)
}

sounds = {
    ['background'] = love.audio.newSource('assets/sounds/Background.mp3', 'static'),
    ['jump'] = love.audio.newSource('assets/sounds/Jump.wav', 'static'),
    ['death'] = love.audio.newSource('assets/sounds/Death.wav', 'static'),
}

gStateMachine = StateMachine{
    ['play'] = PlayState(),
    ['pause'] = PauseState(),
    ['title'] = TitleScreenState(),
    ['countdown'] = CountdownState(),
    ['score'] = ScoreState(),
}

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
    love.window.setMode(WINDOW_WIDTH, WINDOW_HEIGHT, {
        fullscreen = false,
        resizable = false,
        vsync = true
    })

    love.graphics.setFont(fonts.retroS)
    love.keyboard.keysPressed = {}
    love.mouse.buttonsPressed = {}
    sounds['background']:setLooping(true)
    sounds['background']:play()
    gStateMachine:changeState('title')
    parallax = Parallax()
end

function love.update(dt)
    parallax:update(dt)
    gStateMachine:update(dt)

    love.keyboard.keysPressed = {}
    love.mouse.buttonsPressed = {}
end

function love.draw()
    parallax:render()
    gStateMachine:render()
end
