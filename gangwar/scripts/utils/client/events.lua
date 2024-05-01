RegisterNetEvent('rgw:updateStats', function(data)
    RGW.PlayerData.kills = data.kills
    RGW.PlayerData.deaths = data.deaths
    SendNUIMessage({
        action = 'updateStats',
        data = {
            kills = data.kills,
            deaths = data.deaths,
        }
    })
end)

RegisterNetEvent('rgw:addMessage', function(data)
    print(json.encode(data))
    SendNUIMessage({
        action = 'appendToChat',
        data = {
            message = data
        }
    })
end)

RegisterNetEvent('rgw:spawnBf', function()
    local playerCoords = GetEntityCoords(RGW.PlayerData.ped)
    local ModelHash = 'bf400'
    if not IsModelInCdimage(ModelHash) then return end
    RequestModel(ModelHash)            -- Request the model
    while not HasModelLoaded(ModelHash) do -- Waits for the model to load
        Wait(0)
    end
    local vehicle = CreateVehicle(ModelHash, playerCoords, GetEntityHeading(RGW.PlayerData.ped), true, false)
    SetPedIntoVehicle(RGW.PlayerData.ped, vehicle, -1)
    SetModelAsNoLongerNeeded(ModelHash)
end)