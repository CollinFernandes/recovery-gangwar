RegisterKeyMapping('team', 'Switch Team', 'keyboard', 'F1')
RegisterCommand('team', function()
    SendNUIMessage({
        action = 'ToggleHUD',
        data = {
            state = false
        }
    })
    SendNUIMessage({
        action = 'TogglePick',
        data = {
            state = true
        }
    })
    SetNuiFocus(true, true)
end)

RegisterKeyMapping('chat', 'Open Chat', 'keyboard', 'T')
RegisterCommand('chat', function()
    SendNUIMessage({
        action = 'ToggleChat',
        data = {
            state = true
        }
    })
    SetNuiFocus(true, true)
end)

RegisterKeyMapping('config', 'Open Gameconfig', 'keyboard', 'F2')
RegisterCommand('config', function()
    SendNUIMessage({
        action = 'ToggleConfig',
        data = {
            state = true
        }
    })
    SetNuiFocus(true, true)
end)