AddEventHandler('playerConnecting', function(name, _, defferals)
    RGW.Log(('%s'):format(RGW.Logs.Join.text:format(name)), '', RGW.Logs.Join.url)
end)

AddEventHandler('playerDropped', function(reason)
    RGW.Log(('%s *Reason: ```%s```*'):format(RGW.Logs.Leave.text:format(GetPlayerName(source)), reason), '', RGW.Logs.Leave.url)
end)