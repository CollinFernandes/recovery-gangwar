RegisterNetEvent('rv:PlayerJoined', function()
    local _source = source
    local name = GetPlayerName(_source)
    local identifier = RGW.getIdentifier(_source)
    MySQL.query("SELECT * FROM players WHERE identifier = ?", { identifier }, function(result)
        if #result > 0 then
            local _result = result[1]
            local player = RGW.createPlayer({
                id = tostring(_result.id),
                identifier = identifier,
                source = _source,
                name = _result.name,
                loadout = json.decode(_result.loadout),
                kills = _result.kills,
                deaths = _result.deaths,
                group = _result.group,
                xp = _result.xp,
                collected = json.decode(_result.collected),
            })
            RGW.Players[_source] = player
            player.Emit('rv:PlayerJoined', player, RGW.Teams)
        else
            MySQL.insert('INSERT INTO players (name, identifier) VALUES (?, ?)', { name, identifier }, function(r)
                local Player = RGW.createPlayer({
                    id = tostring(r),
                    identifier = identifier,
                    source = _source,
                    name = name,
                    loadout = Config.StartWeapons,
                    kills = 0,
                    deaths = 0,
                    group = false,
                    xp = 0,
                    collected = {},
                })
                RGW.Players[_source] = Player
                Player.Emit('rv:PlayerJoined', Player, RGW.Teams)
            end)
        end
    end)
end)
