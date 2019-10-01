-- Commands

-- Events

RegisterServerEvent('seatme')
AddEventHandler('seatme', function(closestID, veh)
	TriggerClientEvent('seatp', closestID, veh)
end)

RegisterServerEvent('unseatme')
AddEventHandler('unseatme', function(closestID)
	TriggerClientEvent('unseatp', closestID)
end)

RegisterServerEvent('cuffServer')
AddEventHandler('cuffServer', function(closestID)
	TriggerClientEvent('cuffClient', closestID)
end)

RegisterServerEvent('unCuffServer')
AddEventHandler('unCuffServer', function(closestID)
	TriggerClientEvent('unCuffClient', closestID)
end)

RegisterServerEvent('dragServer')
AddEventHandler('dragServer', function(closestID)
	TriggerClientEvent('dragClient', closestID, source)
end)

RegisterServerEvent('unDragServer')
AddEventHandler('unDragServer', function(closestID)
	TriggerClientEvent('unDragClient', closestID)
end)

RegisterServerEvent('seatServer')
AddEventHandler('seatServer', function(t, veh)
	TriggerClientEvent('seatClient', t, veh)
end)

RegisterServerEvent('unSeatServer')
AddEventHandler('unSeatServer', function(t)
	TriggerClientEvent('unSeatClient', t)
end)

RegisterServerEvent('putInServer')
AddEventHandler('putInServer', function(closestID)
	TriggerClientEvent('putInClient', closestID)
end)

RegisterNetEvent('panicServer')
AddEventHandler('panicServer', function(street)
	_source = source
    TriggerClientEvent('chatMessage', -1, 'Toolbox', {255, 255, 255},'Officer ^2' .. GetPlayerName(_source) .. ' ^7Has pushed their panic button. Location: ' .. street)
	TriggerClientEvent('panicButtonSound', -1)
end)

RegisterNetEvent('unrackmsg')
AddEventHandler('unrackmsg', function()
	_source = source
    TriggerClientEvent('chatMessage', -1, 'Toolbox', {255, 255, 255},'' .. GetPlayerName(_source) .. 'Has unracked their rifle!')
end)

RegisterNetEvent('rackmsg')
AddEventHandler('rackmsg', function()
	_source = source
    TriggerClientEvent('chatMessage', -1, 'Toolbox', {255, 255, 255},'' .. GetPlayerName(_source) .. 'Has racked their rifle!')
end)


RegisterServerEvent('showIDServer')
AddEventHandler('showIDServer', function(closestID, sourceid)
	TriggerClientEvent('showIDClient', closestID, sourceid)
end)

RegisterServerEvent('showIDMessage')
AddEventHandler('showIDMessage', function(id)
	TriggerClientEvent('chatMessage', -1, 'ID', {255, 255, 255}, 'Name: ' .. id)
end)

RegisterServerEvent('police:spikes')
AddEventHandler('police:spikes', function(currentVeh, peeps)
	TriggerClientEvent("police:dietyres", peeps, currentVeh)
        TriggerClientEvent("police:dietyres2", peeps)
end)

-- Threads

-- Functions

-- Threads

-- Functions

--[[
	---------------------------------- USEFUL
	local verFile = LoadResourceFile(GetCurrentResourceName(), "version.json")
	local curVersion = json.decode(verFile).version
	local updatePath = "/rhys19/Menu-stuff"
	local resourceName = GetCurrentResourceName()
	function checkVersion(err,response, headers)
		local data = json.decode(response)
		
		
		if curVersion ~= data.version and tonumber(curVersion) < tonumber(data.version) then
			print("\n--------------------------------------------------------------------------")
			print("\n"..resourceName.." is outdated.\nCurrent Version: "..data.version.."\nYour Version: "..curVersion.."\nPlease update it from https://github.com"..updatePath.."")
			print("\nUpdate Changelog:\n"..data.changelog)
			print("\n--------------------------------------------------------------------------")
		elseif tonumber(curVersion) > tonumber(data.version) then
			print("Your version of "..resourceName.." seems to be higher than the current version.")
		else
			print(resourceName.." is up to date!")
		end
		local nativeuitest = LoadResourceFile("NativeUI", "__resource.lua")
		if not nativeuitest then
			print("\n--------------------------------------------------------------------------")
			print("\nNativeUI is not installed on this Server, this means that EasyAdmin will not work *at all*, please download and install it from:")
			print("\nhttps://github.com/FrazzIe/NativeUILua")
			print("\n--------------------------------------------------------------------------")
		else
			SaveResourceFile("NativeUI", "__resource.lua", nativeuitest, -1)
		end
		SetTimeout(3600000, checkVersionHTTPRequest)
	end
	
	function checkVersionHTTPRequest()
		PerformHttpRequest("https://raw.githubusercontent.com/rhys19/Menu/master/version.json", checkVersion, "GET")
	end
	
	---------------------------------- END USEFUL
	checkVersionHTTPRequest()
--]]
	local ace_perm = "admin"
local debug = false

function ProcessAces()
    if GetNumPlayerIndices() > 0 then -- don't do it when there aren't any players
        for i=0, GetNumPlayerIndices()-1 do -- loop through all players
            player = tonumber(GetPlayerFromIndex(i))
            Citizen.Wait(0)
            if IsPlayerAceAllowed(player, ace_perm) then
                TriggerClientEvent("sendAcePermissionToClient", player, true)
                if debug then print("[DEBUG][" .. GetCurrentResourceName() .. "] ^5Syncronising player aces, sending to client...^0") end
            end
        end
    end
end

Citizen.CreateThread(function()
    while true do
        ProcessAces()
        Citizen.Wait(10000) -- lets check every minute
    end
end)
