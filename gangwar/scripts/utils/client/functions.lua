function createPed()
    local defaultModel = GetHashKey('mp_m_freemode_01')
    RequestModel(defaultModel)
    while not HasModelLoaded(defaultModel) do
        Wait(10)
    end
    SetPlayerModel(PlayerId(), defaultModel)
    SetModelAsNoLongerNeeded(defaultModel)
    SetEntityCoordsNoOffset(PlayerPedId(), vector3(-1.5, 19.2501, 71.1215))
    SetEntityHeading(PlayerPedId(), 0.0)
    ClearPlayerWantedLevel(ped)
    SetMaxWantedLevel(0)
    SetEntityMaxHealth(defaultModel, 199)
    ShutdownLoadingScreen()
    ShutdownLoadingScreenNui()
    DoScreenFadeIn(1000)
    ResurrectPed(PlayerPedId())
    SetPlayerTargetingMode(2)
    SetPedInfiniteAmmo(PlayerPedId(), true)
    RGW.PlayerData.ped = PlayerPedId()
    RGW.PlayerData.playerId = PlayerId()
    RGW.PlayerData.isSpawned = true
    loadTeams()
    loadVehicles()
end

function loadTeams()
    for k, v in pairs(Teams) do
        SendNUIMessage({
            action = 'loadTeam',
            data = {
                team = v
            }
        })
        addBlip(v.positions.spawn, 40, v.colors.blip, 0.8, v.label)
        createPeds('a_m_m_business_01', v.positions.garage.pos, 1.3)
        createPeds('a_m_m_business_01', v.positions.clothing, 1.4)
    end
    updateTeams()
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
end

function loadVehicles()
    local vehicles = {}
    for k, v in ipairs(Vehicles) do
        table.insert(vehicles, {
            name = v.name,
            label = v.label,
            icon = 'images/vehicles/' .. v.name .. '.png',
            isLocked = not (RGW.PlayerData.level >= v.level),
            level = v.level
        })
    end
    SendNUIMessage({
        action = 'setVehicles',
        data = {
            vehicles = vehicles
        }
    })
end

function updateTeams()
    for k, v in pairs(RGW.Teams) do
        SendNUIMessage({
            action = 'updateTeamCount',
            data = {
                team = k,
                count = v
            }
        })
    end
end

function addBlip(position, sprite, color, scale, name)
    local coords = type(position) == 'table' and vector3(position.x, position.y, position.z) or position
    local blip = AddBlipForCoord(coords)
    SetBlipSprite(blip, sprite)
    SetBlipColour(blip, color)
    SetBlipScale(blip, scale)
    SetBlipAsShortRange(blip, true)
    BeginTextCommandSetBlipName('STRING')
    AddTextComponentString('Fraktion: ' .. name)
    EndTextCommandSetBlipName(blip)
    return blip
end

function createPeds(model, position, offset)
    local modelHash = (type(model) == 'string' and GetHashKey(model)) or model
    loadModel(modelHash)
    local ped = CreatePed(0, modelHash, position.x, position.y, position.z - offset, 10.0, false, false)
    CreateThread(function()
        while not DoesEntityExist(ped) do
            Wait(0)
        end
        FreezeEntityPosition(ped, true)
        SetEntityInvincible(ped, true)
        SetBlockingOfNonTemporaryEvents(ped, true)
    end)
    return ped
end

function loadModel(model, cb)
    model = type(model) == 'string' and GetHashKey(model) or model
    if not HasModelLoaded(model) then
        RequestModel(model)
        while not HasModelLoaded(model) do
            Wait(0)
        end
    end
    if cb then
        cb()
    end
end

function addWeapons(loadout)
    RemoveAllPedWeapons(PlayerPedId(), true)
    for k, v in pairs(loadout) do
        local weaponHash = GetHashKey(k)
        GiveWeaponToPed(PlayerPedId(), weaponHash, v.ammo, true, false)
        if v.components and type(v.components) == 'table' and #v.components > 0 then
            for k, v in pairs(v.components) do
                GiveWeaponComponentToPed(PlayerPedId(), weaponHash, v.hash)
            end
        end
    end
end

function setClothes(skin)
    local skin = skin or RGW.PlayerData.clothes
    for k, v in pairs(skin) do
        if v.isDrop then
            SetPedPropIndex(RGW.PlayerData.ped, v.componentId, v.drawableId, v.textureId, 2)
        else
            if v.componentId == 11 then
                if isLongSleeve(v.drawableId) then
                    SetPedComponentVariation(RGW.PlayerData.ped, 3, 4, 0, 2)
                else
                    SetPedComponentVariation(RGW.PlayerData.ped, 3, 2, 0, 2)
                end
            end
            SetPedComponentVariation(
                RGW.PlayerData.ped,
                v.componentId,
                v.drawableId,
                v.textureId,
                2
            )
        end
    end
end

isClothing = false
clothCam = nil
function Loops()
    FreezeEntityPosition(RGW.PlayerData.ped, false)
    SetPedConfigFlag(RGW.PlayerData.ped, 35, false) -- PutOnMotorcycleHelmet
    SetCanAttackFriendly(RGW.PlayerData.ped, true, false)
    SetPlayerCanUseCover(RGW.PlayerData.playerId, false)
    StatSetInt(GetHashKey('MP0_SHOOTING_ABILITY'), 100, true)
    StatSetInt(GetHashKey('MP0_STEALTH_ABILITY'), 100, true)

    StatSetInt(GetHashKey('MP0_FLYING_ABILITY'), 100, true)
    StatSetInt(GetHashKey('MP0_WHEELIE_ABILITY'), 100, true)
    StatSetInt(GetHashKey('MP0_LUNG_CAPACITY'), 100, true)
    StatSetInt(GetHashKey('MP0_STRENGTH'), 100, true)
    StatSetInt(GetHashKey('MP0_STAMINA'), 100, true)
    SetPedSuffersCriticalHits(RGW.PlayerData.ped, false)
    StartAudioScene('CHARACTER_CHANGE_IN_SKY_SCENE')

    for k = 1, 9 do
        SetHudComponentPosition(k, 999999.0, 999999.0)
    end

    -- Player
    CreateThread(function()
        while RGW.PlayerData.isSpawned do
            SetPlayerWeaponDamageModifier(RGW.PlayerData.playerId, 0.45)

            RGW.PlayerData.ped = PlayerPedId()
            RGW.PlayerData.playerId = PlayerId()
            RGW.PlayerData.position = GetEntityCoords(RGW.PlayerData.ped)
            SetRunSprintMultiplierForPlayer(RGW.PlayerData.playerId, 1.1)

            if (IsPedInAnyVehicle(RGW.PlayerData.ped)) then
                RGW.PlayerData.vehicle = GetVehiclePedIsIn(RGW.PlayerData.ped, false)
            end

            local _, weapon = GetCurrentPedWeapon(RGW.PlayerData.ped, 0)
            RGW.PlayerData.weapon = weapon

            SetPedConfigFlag(RGW.PlayerData.ped, 35, false)
            SetCanAttackFriendly(RGW.PlayerData.ped, true, false)
            SetPlayerCanUseCover(RGW.PlayerData.ped, false)
            SetPedSuffersCriticalHits(RGW.PlayerData.ped, false)
            SetPedInfiniteAmmo(RGW.PlayerData.ped, true)

            SetWeatherTypePersist(RGW.Weather)
            SetWeatherTypeNow(RGW.Weather)
            SetWeatherTypeNowPersist(RGW.Weather)
            Wait(1500)
        end
    end)

    -- Speedo
    CreateThread(function()
        local sleep = 600
        while true do
            ResetPlayerStamina(RGW.PlayerData.ped)

            if IsPedInAnyVehicle(RGW.PlayerData.ped) then
                sleep = 90
                local speed = math.floor(GetEntitySpeed(RGW.PlayerData.vehicle) * 3.6)
                -- show speedo
            else
                sleep = 600
                -- hide speedo
            end
            Wait(sleep)
        end
    end)

    -- Weaponswitch
    CreateThread(function()
        while true do
            Wait(500)
            local _, weapon = GetCurrentPedWeapon(RGW.PlayerData.ped, 0)
            if (RGW.PlayerData.weapon ~= weapon) then
                RGW.PlayerData.weapon = weapon
                RefillAmmoInstantly(RGW.PlayerData.ped)
                SetCurrentPedWeapon(RGW.PlayerData.ped, RGW.PlayerData.weapon, true)
            end
        end
    end)

    -- Anti Weaponhit
    CreateThread(function()
        local DisableControlAction = DisableControlAction
        while true do
            if (IsPedArmed(RGW.PlayerData.ped, 6)) then
                DisableControlAction(0, 140, true)
                DisableControlAction(0, 142, true)
            end
            DisableControlAction(0, 199, true)
            Wait(500)
        end
    end)

    -- Ped Interactions
    CreateThread(function()
        local skinCoords = vector3(298.7876, -584.5391, 43.26081)
        local AddTextEntry = AddTextEntry
        local BeginTextCommandDisplayHelp = BeginTextCommandDisplayHelp
        local EndTextCommandDisplayHelp = EndTextCommandDisplayHelp
        local IsControlJustPressed = IsControlJustPressed
        while (true) do
            local sleep = 500
            local team = RGW.PlayerData.team
            local garage = GetDistanceBetweenCoords(RGW.PlayerData.position, team.positions.garage.pos, true)
            local clothing = GetDistanceBetweenCoords(RGW.PlayerData.position, team.positions.clothing, true)
            if (garage < 2.0 and not IsNuiFocused()) then
                sleep = 0
                AddTextEntry('HELP', 'Drücke ~INPUT_CONTEXT~ um das ~b~Garage~w~ Menü zu öffnen')
                BeginTextCommandDisplayHelp('HELP')
                EndTextCommandDisplayHelp(0, false, false, -1)
                if (IsControlJustPressed(0, 38)) then
                    SendNUIMessage({
                        action = 'ToggleGarage',
                        data = {
                            state = true,
                            vehicles = Vehicles
                        }
                    })
                    SetNuiFocus(true, true)
                end
            end
            if (clothing < 2.0 and not IsNuiFocused()) then
                sleep = 0
                AddTextEntry('HELP', 'Drücke ~INPUT_CONTEXT~ um das ~b~Clothing~w~ Menü zu öffnen')
                BeginTextCommandDisplayHelp('HELP')
                EndTextCommandDisplayHelp(0, false, false, -1)
                if (IsControlJustPressed(0, 38)) then
                    SendNUIMessage({
                        action = 'ToggleClothing',
                        data = {
                            state = true,
                        }
                    })
                    isClothing = true
                    SetNuiFocus(true, true)
                    EmitNet('rgw:setDimension', RGW.PlayerData.id)
                    SetEntityCoords(RGW.PlayerData.ped, -811.5412, 175.1593, 76.74533)
                    SetEntityHeading(RGW.PlayerData.ped, 109.7217)
                    clothCam = CreateCam('DEFAULT_SCRIPTED_CAMERA')
                    SetCamCoord(clothCam, GetOffsetFromEntityInWorldCoords(RGW.PlayerData.ped, 0.0, 2.0, -0.5))
                    PointCamAtEntity(clothCam, RGW.PlayerData.ped, 0.0, 0.0, 0.0, 0)
                    SetCamActive(clothCam, true)
                    RenderScriptCams(true, false, 500, true, true)
                end
            end
            Wait(sleep)
        end
    end)
end

function playerKilled(killerServerId, killerClientId, deathCause)
    local victimCoords = GetEntityCoords(PlayerPedId())
    local killerCoords = GetEntityCoords(GetPlayerPed(killerClientId))
    local distance = GetDistanceBetweenCoords(victimCoords, killerCoords, true)
    local data = {
        victimCoords = { x = math.round(victimCoords.x, 1), y = math.round(victimCoords.y, 1), z = math.round(victimCoords.z, 1) },
        killerCoords = { x = math.round(killerCoords.x, 1), y = math.round(killerCoords.y, 1), z = math.round(killerCoords.z, 1) },

        killedByPlayer = true,
        deathCause = deathCause,
        distance = math.round(distance, 1),

        killerServerId = killerServerId,
        killerClientId = killerClientId
    }

    TriggerEvent('rgw:playerDied', data)
    TriggerServerEvent('rgw:playerDied', data)
    return data
end

function playerDied(deathCause)
    local playerPed = PlayerPedId()
    local victimCoords = GetEntityCoords(playerPed)
    local data = {
        victimCoords = { x = math.round(victimCoords.x, 1), y = math.round(victimCoords.y, 1), z = math.round(victimCoords.z, 1) },

        killedByPlayer = false,
        deathCause = deathCause
    }

    TriggerEvent('rgw:playerDied', data)
    TriggerServerEvent('rgw:playerDied', data)
end

function revivePed()
    local ped = RGW.PlayerData.ped
    local coords = RGW.PlayerData.team.positions.spawn
    local heading = GetEntityHeading(ped)
    NetworkResurrectLocalPlayer(coords, heading, true, false)
    SetPlayerInvincible(PlayerId(), false)
    SetEntityInvincible(PlayerId(), false)
    ClearPedBloodDamage(ped)
    ResurrectPed(ped)
    SetEntityHealth(ped, 200)
    SetPedArmour(ped, 100)
    TriggerEvent('rgw:playerRevived')
    TriggerServerEvent('rgw:playerRevived')
    RGW.PlayerData.isDead = false
    CreateThread(function()
        while not IsControlJustPressed(0, 32) and
            not IsControlJustPressed(0, 33) and
            not IsControlJustPressed(0, 34) and
            not IsControlJustPressed(0, 22) and
            not IsControlJustPressed(0, 37) and
            not IsControlJustPressed(0, 35)
        do
            SetLocalPlayerAsGhost(true)
            SetGhostedEntityAlpha(128)
            SetEntityAlpha(ped, 128, false)
            Wait()
        end
        ResetEntityAlpha(ped)
        SetLocalPlayerAsGhost(false)
    end)
end

function createVehicle(model, plate, position, heading)
    local model = type(model) == 'string' and GetHashKey(model) or model
    loadModel(model)
    local heading = heading or GetEntityHeading(RGW.PlayerData.ped)
    local position = position or GetEntityCoords(RGW.PlayerData.ped)
    local vehicle = CreateVehicle(model, position.x, position.y, position.z, heading, true, false)
    RequestCollisionAtCoord(position)
    while not HasCollisionLoadedAroundEntity(vehicle) do
        Wait()
    end
    TaskWarpPedIntoVehicle(RGW.PlayerData.ped, vehicle, -1)
    SetVehicleDirtLevel(vehicle, 0)
    SetVehicleFuelLevel(vehicle, 100.0)
    SetEntityAsMissionEntity(vehicle, true, true)
    SetVehicleModKit(vehicle, 0)
    SetVehicleMod(vehicle, 11, 3, false)
    SetVehicleMod(vehicle, 12, 2, false)
    SetVehicleMod(vehicle, 13, 2, false)
    SetVehicleMod(vehicle, 15, 3, false)
    SetVehicleMod(vehicle, 16, 4, false)
    ToggleVehicleMod(vehicle, 18, true)
    local rgb = { r = 55, g = 140, b = 191 }
    if plate ~= 'RECOVERY' then
        rgb = RGW.PlayerData.team.colors.rgb
    end
    SetVehicleCustomPrimaryColour(vehicle, rgb.r, rgb.g, rgb.b)
    SetVehicleCustomSecondaryColour(vehicle, rgb.r, rgb.g, rgb.b)
    SetVehicleNumberPlateText(vehicle, tostring(plate))
    SetVehicleNumberPlateTextIndex(vehicle, 1)
    return vehicle
end

function loadModel(model, cb)
    model = type(model) == 'string' and GetHashKey(model) or model
    if not HasModelLoaded(model) then
        RequestModel(model)
        while not HasModelLoaded(model) do Wait() end
    end
    if cb then
        cb()
    end
end

function string.starts(String,Start)
    return string.sub(String,1,string.len(Start))==Start
end