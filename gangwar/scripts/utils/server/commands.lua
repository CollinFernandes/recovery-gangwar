RGW.registerCommand('save', Config.Perms['all'], function(source, args)
    if (args[1]) then
        RGW.savePlayer(RGW.getPlayer(tonumber(args[1])), false)
    else
        Error('/save <PLAYERID>')
    end
end)

RGW.registerCommand('saveall', Config.Perms['all'], function(source, args)
    RGW.savePlayers()
end)

RGW.registerCommand('setgroup', Config.Perms['all'], function(source, args)
    local Target = tonumber(args[1])
    local Player = RGW.getPlayer(Target)
    if (Target) then
        Player.setGroup(args[2])
    end
end)

RGW.registerCommand('giveweapon', Config.Perms['weapon'], function(source, args)
    local Target = tonumber(args[1])
    local Player = RGW.getPlayer(Target)
    if (Target) then
        if (args[2]) then
            Player.addWeapon(args[2]:upper(), false)
        else
            Error('/giveweapon <ID> <WEAPON>')
        end
    end
end)

RGW.registerCommand('givecomponent', Config.Perms['weapon'], function(source, args)
    local Target = tonumber(args[1])
    local Player = RGW.getPlayer(Target)
    if (Target) then
        if (args[2] and args[3]) then
            Player.addComponent(args[2], args[3])
        else
            Error('/givecomponent <ID> <WEAPON> <COMPONENT>')
        end
    end
end)

RGW.registerCommand('bf', Config.Perms['vehicle'], function(source, args)
    print(source)
    TriggerClientEvent('rgw:spawnBf', source)
end)