Roblox Server Hop

local ServerList = {}

for i, v in ipairs(game:GetService("HttpService"):JSONDecode(game:HttpGetAsync("https://games.roblox.com/v1/games/" .. game.PlaceId .. "/servers/Public?sortOrder=Asc&limit=100")).data) do

   if type(v) == "table" and v.maxPlayers > v.playing and v.id ~= game.JobId then

      ServerList[#ServerList + 1] = v.id

   end

end

if #ServerList > 0 then

   game:GetService("TeleportService"):TeleportToPlaceInstance(game.PlaceId, ServerList[math.random(1, #ServerList)])

else

   return warn("Couldn't find a server.")

end

