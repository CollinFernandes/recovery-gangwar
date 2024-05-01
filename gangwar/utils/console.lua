function Debug(message)
    print('^7[^5RV^7 | ^5DEBUG^7] | [^4' .. GetCurrentResourceName() .. '^7] → ^7' .. message .. '^0')
end

function Error(message)
    print('^7[^8RV^7 | ^8ERROR^7] | [^1' .. GetCurrentResourceName() .. '^7] → ^7' .. message .. '^0')
end

function Warning(message)
    print('^7[^3RV^7 | ^3ERROR^7] | [^3' .. GetCurrentResourceName() .. '^7] → ^7' .. message .. '^0')
end

function Success(message)
    print('^7[^5RV^7 | ^2SUCCESS^7] | [^4' .. GetCurrentResourceName() .. '^7] → ^7' .. message .. '^0')
end

function Info(message)
    print('^7[^5RV^7 | ^3INFO^7] | [^4' .. GetCurrentResourceName() .. '^7] → ^7' .. message .. '^0')
end

function Load(message) 
    print('^7[^5RV^7 | ^9LOAD^7] | [^4' .. GetCurrentResourceName() .. '^7] → ^7' .. message .. '^0')
end