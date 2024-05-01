local customizedOutfit = {}
local firstTime = true
RegisterNuiCallback('selectFaction', function(data)
    local Team = Teams[data.name]
    SetPedDefaultComponentVariation(RGW.PlayerData.ped)
    for i = 0, 2 do
        ClearPedProp(RGW.PlayerData.ped, i)
    end
    SetNuiFocus(false, false)
    SendNUIMessage({
        action = 'ToggleHUD',
        data = {
            state = true
        }
    })
    SendNUIMessage({
        action = 'TogglePick',
        data = {
            state = false
        }
    })
    RGW.PlayerData.team = Team
    local kvp = GetResourceKvpString(RGW.PlayerData.team.name .. '_clothing')
    if (kvp) then
        RGW.PlayerData.clothes = json.decode(kvp)
    else
        RGW.PlayerData.clothes = Team.defaultClothes
    end
    setClothes()
    SetEntityCoords(RGW.PlayerData.ped, Team.positions.spawn)
    FreezeEntityPosition(RGW.PlayerData.ped, false)
    SendNUIMessage({
        action = 'setClothingTypes',
        data = {
            clothingTypes = Config.ClothingTypes
        }
    })
    SendNUIMessage({
        action = 'setClothes',
        data = {
            clothes = RGW.PlayerData.team.clothes
        }
    })
    if firstTime then
        SendNUIMessage({
            action = 'updateId',
            data = {
                id = RGW.PlayerData.id
            }
        })
        firstTime = false
        Loops()
    end
end)

RegisterNuiCallback('parkOut', function(data)
    SendNUIMessage({
        action = 'ToggleGarage',
        data = {
            state = false
        }
    })
    SetNuiFocus(false, false)
    local spawns = RGW.PlayerData.team.positions.garage.spawns
    local spawn = spawns[math.random(1, #spawns)]
    RGW.PlayerData.vehicle = createVehicle(data.name, RGW.PlayerData.id, vector3(spawn.x, spawn.y, spawn.z), spawn.w)
    while not DoesEntityExist(RGW.PlayerData.vehicle) do Wait() end
    SetVehicleMod(RGW.PlayerData.vehicle, 0, GetNumVehicleMods(RGW.PlayerData.vehicle, 0) - 1, false)   -- Spoiler
    SetVehicleMod(RGW.PlayerData.vehicle, 1, GetNumVehicleMods(RGW.PlayerData.vehicle, 1) - 1, false)   -- Stoßstange
    SetVehicleMod(RGW.PlayerData.vehicle, 2, GetNumVehicleMods(RGW.PlayerData.vehicle, 2) - 1, false)   -- Rück Stoßstange
    SetVehicleMod(RGW.PlayerData.vehicle, 3, GetNumVehicleMods(RGW.PlayerData.vehicle, 3) - 1, false)   -- Skirts
    SetVehicleMod(RGW.PlayerData.vehicle, 4, GetNumVehicleMods(RGW.PlayerData.vehicle, 4) - 1, false)   -- Auspuff
    SetVehicleMod(RGW.PlayerData.vehicle, 11, GetNumVehicleMods(RGW.PlayerData.vehicle, 11) - 1, false) -- modEngine
    SetVehicleMod(RGW.PlayerData.vehicle, 12, GetNumVehicleMods(RGW.PlayerData.vehicle, 12) - 1, false) -- modBrakes
    SetVehicleMod(RGW.PlayerData.vehicle, 13, GetNumVehicleMods(RGW.PlayerData.vehicle, 13) - 1, false) -- modTransmission
    SetVehicleMod(RGW.PlayerData.vehicle, 15, GetNumVehicleMods(RGW.PlayerData.vehicle, 15) - 1, false) -- modSuspension
    SetVehicleMod(RGW.PlayerData.vehicle, 16, GetNumVehicleMods(RGW.PlayerData.vehicle, 16) - 1, false) -- modArmor
    ToggleVehicleMod(RGW.PlayerData.vehicle, 18, true)                                                  -- modTurbo
    SetVehicleMod(RGW.PlayerData.vehicle, 23, GetNumVehicleMods(RGW.PlayerData.vehicle, 23) - 1, false) -- Front Wheels
    SetVehicleMod(RGW.PlayerData.vehicle, 48, GetNumVehicleMods(RGW.PlayerData.vehicle, 48) - 1, false)
    SetVehicleWheelType(RGW.PlayerData.vehicle, 11)
    local pearlescentColor, wheelColor = GetVehicleExtraColours(RGW.PlayerData.vehicle)
    SetVehicleExtraColours(RGW.PlayerData.vehicle, pearlescentColor, 12)
    SetVehicleLivery(RGW.PlayerData.vehicle, 1)
end)

RegisterNuiCallback('close', function()
    SetNuiFocus(false, false)
    if (isClothing) then
        RenderScriptCams(0)
        DestroyCam(clothCam, true)
        SetEntityCoords(RGW.PlayerData.ped, RGW.PlayerData.team.positions.spawn)
        TriggerServerEvent('rgw:setDimension', 0)

        for category, data in pairs(customizedOutfit) do
            for _, cloth in pairs(RGW.PlayerData.clothes) do
                if cloth.componentId == data.componentId then
                    local dropping = cloth.isDrop
                    if dropping == nil then dropping = false end
                    if (dropping == data.isDrop) then
                        RGW.PlayerData.clothes[_] = data
                        goto continue
                    end
                end
            end
            ::continue::
        end
        setClothes()
        SetResourceKvp(RGW.PlayerData.team.name .. '_clothing', json.encode(RGW.PlayerData.clothes))
        customizedOutfit = {}
        isClothing = false
    end
end)

RegisterNuiCallback('selectPiece', function(data)
    local clothType = data.type
    local piece = data.piece
    local isDrop = (clothType == 'earrings' or clothType == 'glasses' or clothType == 'hat')
    customizedOutfit[clothType] = {
        componentId = Config.ClothingTypes[clothType].Component,
        drawableId = piece.drawable,
        textureId = piece.texture,
        isDrop = isDrop
    }
    if isDrop then
        SetPedPropIndex(RGW.PlayerData.ped, Config.ClothingTypes[clothType].Component, piece.drawable, piece.texture, 2)
    else
        SetPedComponentVariation(RGW.PlayerData.ped, Config.ClothingTypes[clothType].Component, piece.drawable,
            piece.texture, 2)
    end
end)

RegisterNuiCallback('sendMessage', function(data)
    SetNuiFocus(false, false)
    if (string.starts(data.message, '/')) then
        ExecuteCommand(data.message:gsub('/', ''))
    else
        TriggerServerEvent('rgw:sendMessage', data.message)
    end
end)