AddEventHandler("onResourceStart", function(r)
    if r == GetCurrentResourceName() then
        local ascii = [[
^7 ______     ______     ______     ______     __   __   ______     ______     __  __
/\  == \   /\  ___\   /\  ___\   /\  __ \   /\ \ / /  /\  ___\   /\  == \   /\ \_\ \
\ \  __<   \ \  __\   \ \ \____  \ \ \/\ \  \ \ \'/   \ \  __\   \ \  __<   \ \____ \
^9 \ \_\ \_\  \ \_____\  \ \_____\  \ \_____\  \ \__|    \ \_____\  \ \_\ \_\  \/\_____\
  \/_/ /_/   \/_____/   \/_____/   \/_____/   \/_/      \/_____/   \/_/ /_/   \/_____/
        ]]

        print("")
        print('^5' .. ascii)
        local start = os.time()
        for k, v in pairs(scandir('resources/gangwar/config')) do
            if v == '.' then
            elseif v == '..' then
            else
                local code = LoadResourceFile(GetCurrentResourceName(), '/config/' .. v)
                if code then
                    local loadedFunction, loadError = load(code)
                    if loadedFunction then
                        local success, runtimeError = pcall(loadedFunction)
                        if not success then
                            print(runtimeError)
                        else
                            Debug("Loaded Config file: ^5" .. v)
                        end
                    else
                        Error("Failed to load Config file: ^1" .. v .. '\n^0' .. loadError)
                    end
                end
            end
        end

        for k, v in pairs(scandir('resources/gangwar/scripts')) do
            if v == '.' then
            elseif v == '..' then
            else
                for k1, v1 in pairs(scandir('resources/gangwar/scripts/' .. v)) do
                    if v1 == '.' then
                    elseif v1 == '..' then
                    else
                        if v1 == 'server' then
                            for k2, v2 in pairs(scandir('resources/gangwar/scripts/' .. v .. '/' .. v1)) do
                                if v2 == '.' then
                                elseif v2 == '..' then
                                else
                                    local code = LoadResourceFile(GetCurrentResourceName(),
                                        'scripts/' .. v .. '/' .. v1 .. '/' .. v2)
                                    if code then
                                        local loadedFunction, loadError = load(code)
                                        if loadedFunction then
                                            local success, runtimeError = pcall(loadedFunction)
                                            if not success then
                                                print(runtimeError)
                                            else
                                                Debug("Loaded Server file: ^5" .. v2 .. ' (' .. v .. ')')
                                            end
                                        else
                                            Error("Failed to load Server file: ^1" .. v2 .. '\n^0' .. loadError)
                                        end
                                    end
                                end
                            end
                        end
                    end
                end
            end
        end

        local bans = LoadResourceFile(GetCurrentResourceName(), 'scripts/admin/bans.json')
        Debug('loading bans...')
        if not bans then
            Warning('no bans.json found!')
            Debug('creating a new one')
            SaveResourceFile(GetCurrentResourceName(), 'scripts/admin/bans.json', '[]', -1)
            Debug('created a new bans.json')
        else
            RGW.Bans = json.decode(bans)
            Debug('loaded ' .. #RGW.Bans .. ' bans!')
        end
        Debug('loaded in ' .. os.time() - start .. ' seconds!')

        RGW.LogValidation()
    end
end)

function scandir(directory)
    local i, t, popen = 0, {}, io.popen
    local pfile = popen('ls -a "' .. directory .. '"')
    if pfile then -- Check if the popen command executed successfully
        for filename in pfile:lines() do
            if filename ~= '.' and filename ~= '..' then -- Exclude '.' and '..' directories
                i = i + 1
                t[i] = filename
            end
        end
        pfile:close()
    else
        print('Failed to execute popen command for directory: ' .. directory)
    end
    return t
end

RegisterNetEvent('frameworkv2:loadClient', function()
    if not RGW.UsersLoaded[source] then
        for k, v in pairs(scandir('resources/gangwar/config')) do
            if v == '.' then
            elseif v == '..' then
            else
                local code = LoadResourceFile(GetCurrentResourceName(), '/config/' .. v)
                if code then
                    TriggerClientEvent('frameworkv2:loadClient', source, code, v,
                        GetCurrentResourceName())
                end
            end
        end

        for k, v in pairs(scandir('resources/gangwar/scripts')) do
            if v == '.' then
            elseif v == '..' then
            else
                for k1, v1 in pairs(scandir('resources/gangwar/scripts/' .. v)) do
                    if v1 == '.' then
                    elseif v1 == '..' then
                    else
                        if v1 == 'client' then
                            for k2, v2 in pairs(scandir('resources/gangwar/scripts/' .. v .. '/' .. v1)) do
                                if v2 == '.' then
                                elseif v2 == '..' then
                                else
                                    local code = LoadResourceFile(GetCurrentResourceName(),
                                        'scripts/' .. v .. '/' .. v1 .. '/' .. v2)
                                    if code then
                                        TriggerClientEvent('frameworkv2:loadClient', source, code, v2,
                                            v)
                                    end
                                end
                            end
                        end
                    end
                end
            end
        end
    else
        Debug("User ^5" .. source .. "^7 tried to load client files again.")
        DropPlayer(source, 'tried to load client files again')
    end
end)

RegisterNetEvent('esx:playerLoaded')
AddEventHandler('esx:playerLoaded', function(source)
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
end)

AddEventHandler('playerDropped', function()
    RGW.FrontEndLoaded[source] = nil
    RGW.UsersLoaded[source] = nil
end)
