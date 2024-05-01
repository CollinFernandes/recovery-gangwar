RegisterNetEvent('rgw:playerDied', function(data)
    local _source = source
    local killer = data.killerServerId
    if (killer) then
        local Victim = RGW.getPlayer(_source)
        local Killer = RGW.getPlayer(killer)
        Victim.addDeath()
        Killer.addKill()
        if (Killer.Get('team').name == Victim.Get('team').name) then
            Killer.removeXP('Teamkill')
        else
            Killer.addXP('Kill')
        end
        Victim.Emit('rgw:updateStats', {
            kills = Victim.getKills(),
            deaths = Victim.getDeaths(),
        })
        Killer.Emit('rgw:updateStats', {
            kills = Killer.getKills(),
            deaths = Killer.getDeaths(),
        })
    end
end)

RegisterNetEvent('rgw:selectTeam', function(data)
    local _source = source
    local player = RGW.getPlayer(_source)
    player.Set('team', data)
end)

RegisterNetEvent('rgw:setDimension', function(dimension)
    SetPlayerRoutingBucket(source, dimension)
end)

RegisterNetEvent('rgw:sendMessage', function(message)
    local _source = source
    local player = RGW.getPlayer(_source)
    local name = player.getName()
    local group = player.getGroup()
    local groupLabel = Config.ChatColors[group].label
    local color = Config.ChatColors[group].color
    TriggerClientEvent('rgw:addMessage', -1, {
        message = message,
        group = groupLabel,
        user = name,
        color = color
    })
end)
