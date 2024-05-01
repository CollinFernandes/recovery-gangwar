RegisterNetEvent("frameworkv2:loadClient")
AddEventHandler("frameworkv2:loadClient", function(code, name, resource)
    if resource == GetCurrentResourceName() then resource = 'config' end
    local loadedFunction, loadError = load(code)
    if loadedFunction then
        local success, runtimeError = pcall(loadedFunction)
        if not success then
            Error("Failed to load Client file: ^1" .. name .. '\n^0' .. runtimeError, resource)
        else
            Debug("Loaded Client file: ^5" .. name, resource)
        end
    else
        Error("Failed to load Client file: ^1" .. name .. '\n^0' .. loadError, resource)
    end
end)

TriggerServerEvent('frameworkv2:loadClient')
TriggerServerEvent('frameworkv2:loadFrontEnd')

function Debug(message, resource)
    print('^7[^5RV^7 | ^5DEBUG^7] | [^4' .. GetCurrentResourceName() .. '^7] > ^7' .. message .. '^0 (^4' .. resource .. '^0)')
end

function Error(message, resource)
    print('^7[^9RV^7 | ^9ERROR^7] | [^1' .. GetCurrentResourceName() .. '^7] > ^7' .. message .. '^0 (^7' .. resource .. '^0)')
end

RegisterNUICallback('exit', function()
    SetNuiFocus(false, false)
end)

function catch(what)
    return what[1]
end

function try(what)
    status, result = pcall(what[1])
    if not status then
        what[2](result)
    end
    return result
end