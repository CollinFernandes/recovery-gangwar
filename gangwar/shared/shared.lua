RGW = {}
RGW.PlayerData = {}
RGW.Teams = {}
RGW.Resource = GetCurrentResourceName()

RGW.GetLevel = function(xp)
    for i = 1, #Levels.List do
        local needed = Levels.List[i]
        if xp >= needed and (Levels.List[i + 1] ~= nil and (Levels.List[i + 1] > xp)) then
            return i, Levels.List[i + 1] - needed, xp - needed
        end
    end
    return 0, Levels.List[1], xp
end

isLongSleeve = function(draw)
	for _, i in pairs({
		96, 107, 108, 111, 117, 134, 141, 154, 171,
		172, 182, 257, 273, 305, 308, 332,
	}) do
		if i == draw then
			return true
		end
	end
    return false
end