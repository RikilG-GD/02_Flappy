StateMachine = Class{}

function StateMachine:init(states)
    self.emptyState = {
        init = function() end,
        enter = function() end,
        update = function() end,
        render = function() end,
        exit = function() end,
    }
    self.currentState = self.emptyState
    self.states = states or {}
end

function StateMachine:changeState(stateName, params)
    assert(self.states[stateName]) -- state must exist
    self.currentState:exit()
    self.currentState = self.states[stateName]
    self.currentState:enter(params)
end

function StateMachine:update(dt)
    self.currentState:update(dt)
end

function StateMachine:render()
    self.currentState:render()
end
