--[[

-------------------------------------------------------
Coded By Rhys19 © 2018
Functions are not copied they are off a gta5 animation site functions are built together from docs.fivem.net & the Native Reference
Lock Code By Knobs!
Radar By Rhys19 (Coming Soon)
Fix is very simple to create!
Door controls by rhys19 -- they are simple to code aswell!
-------------------------------------------------------

--]]

-- Variables

-- Commands

-- Events
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
AddEventHandler('seatServer', function(closestID, veh)
	TriggerClientEvent('seatClient', closestID, veh)
end)
RegisterServerEvent('unSeatServer')
AddEventHandler('unSeatServer', function(closestID)
	TriggerClientEvent('unSeatClient', closestID)
end)

RegisterServerEvent('putInServer')
AddEventHandler('putInServer', function(closestID)
	TriggerClientEvent('putInClient', closestID)
end)

RegisterNetEvent('panicServer')
AddEventHandler('panicServer', function(street)
	_source = source
    TriggerClientEvent('chatMessage', -1, 'Police System', {255, 255, 255},'Officer ^2' .. GetPlayerName(_source) .. ' ^7Has pushed their panic button. Location: ' .. street)
end)

RegisterServerEvent('showIDServer')
AddEventHandler('showIDServer', function(closestID, sourceid)
	TriggerClientEvent('showIDClient', closestID, sourceid)
end)

RegisterServerEvent('showIDMessage')
AddEventHandler('showIDMessage', function(id)
	TriggerClientEvent('chatMessage', -1, 'ID', {255, 255, 255}, 'Name: ' .. id)
end)

-- Threads

-- Functions

	---------------------------------- USEFUL
	--[[
	function mysplit(inputstr, sep)
		if sep == nil then
			sep = "%s"
		end
		local t={} ; i=1
		for str in string.gmatch(inputstr, "([^"..sep.."]+)") do
			t[i] = str
			i = i + 1
		end
		return t
	end
	
	
	local verFile = LoadResourceFile(GetCurrentResourceName(), "version.json")
	local curVersion = json.decode(verFile).version
	local updatePath = "/rhys19/Menu"
	local resourceName = "Menu ("..GetCurrentResourceName()..")"
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
	checkVersionHTTPRequest()--]]
end)
