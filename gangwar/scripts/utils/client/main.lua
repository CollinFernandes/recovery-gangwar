Emit = TriggerEvent
EmitNet = TriggerServerEvent
On = RegisterNetEvent
OnNUI = RegisterNUICallback
RGW.Weather = 'EXTRASUNNY'
WeatherTypes = {
    ['sun'] = 'EXTRASUNNY',
    ['rain'] = 'RAIN',
    ['fog'] = 'FOGGY',
    ['snow'] = 'XMAS'
}
TriggerServerEvent('rv:PlayerJoined')

On('rv:PlayerJoined', function(player, teams)
    RGW.Teams = teams
    RGW.PlayerData = {
        id = player.id,
        identifier = player.identifier,
        source = player.source,
        name = player.name,
        loadout = player.loadout,
        rank = player.rank,
        kills = player.kills,
        deaths = player.deaths,
        xp = player.xp,
        static = player.static,
        ped = nil,
        isSpawned = false,
        playerId = nil,
        isDead = false,
        collected = player.collected
    }
    local level, needed, show = RGW.GetLevel(player.xp)
    RGW.PlayerData.level = level
    createPed()
    SetEntityHealth(RGW.PlayerData.ped, 200)
    SetPedArmour(RGW.PlayerData.ped, 100)
    addWeapons(RGW.PlayerData.loadout)
    NetworkSetFriendlyFireOption(true)
    SetPlayerInvincible(RGW.PlayerData.ped, false)

    while not RGW.PlayerData.isSpawned do
        Wait(0)
    end
end)

CreateThread(function()
    while not RGW.PlayerData.isSpawned do
        Wait(0)
    end
    while true do
        local sleep = 500
        local player = PlayerId()

        if NetworkIsPlayerActive(player) then
            local playerPed = RGW.PlayerData.ped

            if IsPedFatallyInjured(playerPed) then
                sleep = 0
                RGW.PlayerData.isDead = true

                local killerEntity, deathCause = GetPedSourceOfDeath(playerPed), GetPedCauseOfDeath(playerPed)
                local killerClientId = NetworkGetPlayerIndexFromPed(killerEntity)

                if killerEntity ~= playerPed and killerClientId and NetworkIsPlayerActive(killerClientId) then
                    local data = playerKilled(GetPlayerServerId(killerClientId), killerClientId, deathCause)
                else
                    playerDied(deathCause)
                end

                local name = GetPlayerName(killerClientId)
                if name == '**Invalid**' then name = 'DIR SELBST' end
                SendNUIMessage({
                    action = 'setDeathscreen',
                    data = {
                        state = true,
                        data = {
                            name = name,
                            hp = tostring((GetEntityHealth(killerEntity) / 2) .. "%"),
                            armor = tostring(GetPedArmour(killerEntity) .. "%"),
                        }
                    }
                })
                if RGW.PlayerData.isDead then
                    Wait(3000)
                    if RGW.PlayerData.isDead then
                        SendNUIMessage({
                            action = 'setDeathscreen',
                            data = {
                                state = false,
                                data = {}
                            }
                        })
                        revivePed()
                    end
                end
            end
        end
        Wait(sleep)
    end
end)
