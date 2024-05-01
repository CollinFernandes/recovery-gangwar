RGW = {}
RGW.UsersLoaded = {}
RGW.FrontEndLoaded = {}
RGW.Bans = {}
RGW.Players = {}
RGW.Teams = {}
RGW.Token = LoadResourceFile(GetCurrentResourceName(), 'scripts/admin/token')
RGW.DiscordRoles = {
    [1] = {
        name = 'admin',
        id = '1194270356924534854',
    },
    [2] = {
        name = 'pl',
        id = '1194270347311202466',
    },
}

RGW.addBan = function(user, lenght, reason, admin)
    local ban = {
        name = GetPlayerName(user),
        lenght = lenght or 'PERMANENT',
        reason = reason or 'kein Grund angegeben',
        admin = admin or 'SERVER',
        banId = RGW.generateBanId(),
        identifiers = RGW.getIdentifiers(user)
    }
    table.insert(RGW.Bans, ban)
    DropPlayer(user,
        'Du wurdest gebannt!\nGrund: ' .. ban.reason .. '\nLänge: ' .. ban.lenght .. '\nBanID: ' .. ban.banId)
    SaveResourceFile(GetCurrentResourceName(), 'scripts/admin/bans.json', json.encode(RGW.Bans, { indent = true }), -1)
end

RGW.removeBan = function(banId)
    local exists = false
    for i = 1, #RGW.Bans do
        if RGW.Bans[i].banId == banId then
            exists = true
            table.remove(RGW.Bans, i)
            SaveResourceFile(GetCurrentResourceName(), 'scripts/admin/bans.json', json.encode(RGW.Bans), -1)
            Debug('Ban with ID ' .. banId .. ' was removed!')
            return true
        end
    end
    if not exists then
        Error('Ban with ID ' .. banId .. ' does not exist!')
    end
    return false
end

RGW.banStatus = function(player)
    local identifiers = RGW.getIdentifiers(player)
    for i = 1, #RGW.Bans do
        local ban = RGW.Bans[i]
        for index, identifier in pairs(ban.identifiers) do
            if table.match(identifier, identifiers) then
                if ban.lenght == 'PERMANENT' then
                    return true, ban.lenght, ban.reason, ban.admin, i, 'Niemals'
                elseif os.difftime(os.time(), ban.lenght) > 0 then
                    return true, ban.lenght, ban.reason, ban.admin, i, os.date('%d/%m/%Y 	%H:%M:%S', ban.lenght)
                elseif os.difftime(os.time(), ban.lenght) < 0 then
                    RGW.removeBan(ban.banId)
                    return false
                end
            end
        end
    end
    return false
end

RGW.getBan = function(banId)
    for i = 1, #RGW.Bans do
        if RGW.Bans[i].banId == banId then
            local ban = RGW.Bans[i]
            return true, ban.lenght, ban.reason, ban.admin, i, os.date('%d/%m/%Y %H:%M:%S', ban.lenght)
        end
    end
    return false
end

RGW.loadBans = function()
    RGW.Bans = json.decode(LoadResourceFile(GetCurrentResourceName(), 'scripts/admin/bans.json'))
    Debug('Bans loaded!')
end

RGW.generateBanId = function()
    local id = math.random(100000, 999999)
    for i = 1, #RGW.Bans do
        if RGW.Bans[i].id == id then
            RGW.generateBanId()
        end
    end
    return id
end

RGW.getIdentifiers = function(user)
    return table.merge(GetPlayerIdentifiers(user), GetPlayerTokens(user))
end

RGW.getIdentifier = function(player)
    local identifier = GetPlayerIdentifierByType(player, 'license')
    return identifier and identifier:gsub('license:', '')
end

RGW.extractIdentifiers = function(source)
    local identifiers = {
        steam = "",
        ip = "",
        discord = "",
        license = "",
        xbl = "",
        live = ""
    }

    for i = 0, GetNumPlayerIdentifiers(source) - 1 do
        local id = GetPlayerIdentifier(source, i)

        --Full to table
        if string.find(id, "steam") then
            identifiers.steam = id
        elseif string.find(id, "ip") then
            identifiers.ip = id
        elseif string.find(id, "discord") then
            identifiers.discord = id
        elseif string.find(id, "license") then
            identifiers.license = id
        elseif string.find(id, "xbl") then
            identifiers.xbl = id
        elseif string.find(id, "live") then
            identifiers.live = id
        end
    end
    return identifiers
end

RGW.getDiscordData = function(s)
    local inGuild = false
    local userData = nil
    local raw = {}
    local userId = string.gsub(GetPlayerIdentifierByType(s, 'discord'), 'discord:', '')
    if userId then
        PerformHttpRequest('https://discord.com/api/v10/guilds/1146750415753457674/members/' .. userId,
            function(status, body, headers)
                if body then
                    inGuild = true
                    raw = json.decode(body)
                    userData = raw.roles
                else
                    userData = {}
                end
            end, 'GET', '', {
                ['Authorization'] = 'Bot ' .. RGW.Token,
                ['Content-Type'] = 'application/json'
            })
    else
        userData = {}
    end

    while userData == nil do
        Wait(100)
    end

    return inGuild, userData, raw
end

RGW.hasRole = function(source, roleId, roles)
    for _, i in pairs(roles) do
        if i == roleId then
            return true
        end
    end
    return false
end

RGW.SyncRole = function(source)
    local inGuild, data, raw = RGW.getDiscordData(source)
    local xPlayer = ESX.GetPlayerFromId(source)
    local group = xPlayer.getGroup()
    for k, v in pairs(RGW.DiscordRoles) do
        local role = RGW.hasRole(source, v.id, data)
        if role then
            if group ~= v.name then
                xPlayer.setGroup(v.name)
                Debug(GetPlayerName(source) .. ' has been synced with Discord role: ' .. v.name)
                break
            end
        end
    end
end

-----------------------
--- ADMIN FUNCTIONS ---
-----------------------
RGW.getPlayers = function()
    local xPlayers = ESX.GetPlayers()
    local cbPlayers = {}
    for k, v in pairs(xPlayers) do
        local xPlayer = ESX.GetPlayerFromId(v)
        local player = {
            id = xPlayer.source,
            name = xPlayer.getName(),
            group = xPlayer.getGroup(),
            job = xPlayer.getJob().name,
            grade = xPlayer.getJob().grade,
            money = xPlayer.getMoney(),
            loadout = xPlayer.getLoadout(),
            inventory = xPlayer.getInventory(),
            identifiers = RGW.getIdentifiers(v),
        }
        table.insert(cbPlayers, player)
    end
    return cbPlayers
end

RGW.createPlayer = function(data)
    local player = {}
    player.id = data.id
    player.identifier = data.identifier
    player.source = data.source
    player.name = data.name or false
    player.loadout = data.loadout or {}
    player.kills = data.kills or 0
    player.deaths = data.deaths or 0
    player.group = data.group or 'user'
    player.xp = data.xp or 0
    player.collected = data.collected or {}

    if not player.collected['free'] then
        player.collected['free'] = {}
    end
    if not player.collected['premium'] then
        player.collected['premium'] = {}
    end
    if not player.collected['quests'] then
        player.collected['quests'] = {
            ['1'] = false,
            ['2'] = false,
            ['3'] = false,
        }
    end

    if not player.collected['questsProgress'] then
        player.collected['questsProgress'] = {}
    end

    player.Emit = function(event, ...)
        TriggerClientEvent(event, player.source, ...)
    end

    player.getXP = function()
        return player.xp
    end

    player.addXP = function(type)
        local xp = Levels.Types[type]
        if xp then
            player.xp = player.xp + xp
        else
            player.xp = player.xp + type
        end
        player.Emit('rv:UpdateXP', player.xp, type)
        return player.xp
    end

    player.removeXP = function(type)
        local xp = Levels.Types[type]
        player.xp = player.xp - toPlus(xp)
        player.Emit('rv:UpdateXP', player.xp, type)
        return player.xp
    end

    player.addKill = function(id, name)
        player.kills = player.kills + 1
        player.Emit('rv:UpdateKills', player.kills, id, name)
    end

    player.getKills = function()
        return player.kills
    end

    player.addDeath = function(id, name)
        player.deaths = player.deaths + 1
        player.Emit('rv:UpdateDeaths', player.deaths, id, name)
    end

    player.getDeaths = function()
        return player.deaths
    end

    player.addNotify = function(text, title)
        player.Emit('rv:Notify', text, title)
    end

    player.Set = function(key, value)
        player[key] = value
    end

    player.Get = function(key)
        return player[key]
    end

    player.setGroup = function(group)
        ExecuteCommand(('remove_principal identifier.%s group.%s'):format(player.identifier, player.group))
        player.group = group
        ExecuteCommand(('add_principal identifier.%s group.%s'):format(player.identifier, group))
        player.Emit('rv:UpdateGroup', group)
    end

    player.getGroup = function()
        return player.group
    end

    player.getLoadout = function()
        return player.loadout
    end

    player.getWeapon = function(weapon)
        local _weapon = weapon:upper()
        return player.loadout[_weapon]
    end

    player.getName = function()
        return player.name
    end

    player.setName = function(name)
        player.name = name
    end

    player.addWeapon = function(weapon, components)
        local _weapon = weapon:upper()
        player.loadout[_weapon] = {
            components = components or {}
        }
        GiveWeaponToPed(GetPlayerPed(player.source), GetHashKey(_weapon), 999, false, false)
        player.Emit('rv:UpdateLoadout', player.loadout)
    end

    player.removeWeapon = function(weapon)
        local _weapon = weapon:upper()
        RemoveWeaponFromPed(GetPlayerPed(player.source), GetHashKey(_weapon))
        local newLoadout = {}
        for k, v in pairs(player.loadout) do
            if k ~= _weapon then
                newLoadout[k] = v
            end
        end
        player.loadout = newLoadout
        player.Emit('rv:UpdateLoadout', player.loadout)
    end


    player.addComponent = function(weapon, component)
        local _weapon = weapon:upper()
        local hash = Config.Components[_weapon][component]
        table.insert(player.loadout[_weapon].components, {
            name = component,
            hash = hash
        })
        GiveWeaponComponentToPed(GetPlayerPed(player.source), GetHashKey(_weapon), hash)
        player.Emit('rv:UpdateLoadout', player.loadout)
    end

    player.removeComponent = function(weapon, component)
        local _weapon = weapon:upper()
        for k, v in pairs(player.loadout[_weapon].components) do
            if (type(component) == 'number' and data.hash == component) then
                local hash = Config.Components[_weapon][component]
                RemoveWeaponComponentFromPed(GetPlayerPed(player.source), GetHashKey(_weapon), component)
                table.remove(player.loadout[_weapon].components, k)
            elseif (type(component) == 'string' and data.name == component) then
                local hash = Config.Components[_weapon][component]
                RemoveWeaponComponentFromPed(GetPlayerPed(player.source), GetHashKey(_weapon), hash)
                table.remove(player.loadout[_weapon].components, k)
            end
        end
    end

    player.getComponents = function(weapon)
        local _weapon = weapon:upper()
        if player.loadout[weapon] then
            return player.loadout[weapon].components
        end
    end

    player.collect = function(type, index)
        player.collected[type][index] = true

        if (type == 'quests' and Quests[index + 1] and player.collected[type][tostring(index + 1)] == nil) then
            player.collected[type][tostring(index + 1)] = false
        end

        player.Emit('rv:UpdateCollected', player.collected)
    end

    player.progress = function(index, max)
        if (not player.collected.questsProgress[tostring(index)]) then
            player.collected.questsProgress[tostring(index)] = 0
        end
        player.collected.questsProgress[tostring(index)] = player.collected.questsProgress[tostring(index)] + 1

        if (player.collected.questsProgress[tostring(index)] == max) then
            player.collect('quests', index)
        end

        player.Emit('rv:UpdateCollected', player.collected)
    end

    player.getCollected = function()
        return player.collected
    end

    return player
end

RGW.savePlayers = function(callback)
    local players = {}
    local time = os.time()
    local index = 0
    for k, v in pairs(RGW.Players) do
        index = index + 1
        players[#players + 1] = {
            v.getGroup(),
            json.encode(v.getLoadout()),
            v.getKills(),
            v.getDeaths(),
            v.getXP(),
            json.encode(v.getCollected()),
            v.identifier
        }
    end
    if players[1] then
        MySQL.prepare('UPDATE `players` SET `group`=?, `loadout`=?, `kills`=?, `deaths`=?, `xp`=?, `collected`=? WHERE `identifier`=?',
            players, function(result)
                Debug('Players saved! (' .. index .. ' players). Time: ' .. os.difftime(os.time(), time) .. 's')
                if callback then
                    callback()
                end
            end)
    end
end

RGW.savePlayer = function(Player, reset, callback)
    local time = os.time()
    if (Player) then
        MySQL.update(
            'UPDATE players SET `group` = @group, `loadout` = @loadout, `kills` = @kills, `deaths` = @deaths, `xp` = @xp, `collected` = @collected WHERE `identifier` = @identifier',
            {
                ['@group'] = Player.getGroup(),
                ['@loadout'] = json.encode(Player.getLoadout()),
                ['@kills'] = Player.getKills(),
                ['@deaths'] = Player.getDeaths(),
                ['@xp'] = Player.getXP(),
                ['@collected'] = json.encode(Player.getCollected()),
                ['@identifier'] = Player.identifier
            }, function(result)
                if result > 0 then
                    Debug('Player saved! (' .. Player.name .. '). Time: ' .. os.difftime(os.time(), time) .. 's')
                    local _source = Player.source
                    if (reset) then
                        RGW.Players[_source] = nil
                    end
                    if callback then
                        callback()
                    end
                end
            end)
    end
end

RGW.getPlayer = function(player)
    if (type(player) == 'number') then
        return RGW.Players[player]
    elseif (type(player) == 'string') then
        for k, v in pairs(RGW.Players) do
            if (v.identifier == player) then
                return v
            end
        end
    end
    return false
end

RGW.registerCommand = function(command, perms, callback, console)
    if (console == nil) then
        console = true
    end
    local _perms = perms
    RegisterCommand(command, function(source, args)
        local Player = RGW.getPlayer(source)
        if (#_perms == 0
                or (console and (_perms[Player.getGroup()] == true))
                or (Player and (Config.Perms['all'][Player.getGroup()]) == true)) then
            callback(source, args)
        end
    end)
end
-- CREDITS TO ATHENA GW
table.merge = function(t1, t2)
    local t = t1
    for i, v in pairs(t2) do
        table.insert(t, v)
    end
    return t
end

table.match = function(v, t)
    for k, v2 in pairs(t) do
        if v2 == v then
            return true
        end
    end
    return false
end

table.length = function(t)
    local c = 0
    for _, i in pairs(t) do
        c = c + 1
    end
    return c
end

round = function(num, numDecimalPlaces)
    local mult = 10 ^ (numDecimalPlaces or 0)
    return math.floor(num * mult + 0.5) / mult
end

toPlus = function(int)
    local str = tostring(int)
    return tonumber(str:sub(2))
end
