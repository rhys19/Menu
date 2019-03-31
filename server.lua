RegisterServerEvent('commandEnabled')
AddEventHandler('commandEnabled', function(commandEnabled)
	commandEnabled = commandEnabled
end)

RegisterServerEvent('getkey')
AddEventHandler('getkey', function(MenuKey)
	MenuKey = MenuKey
end)

RegisterServerEvent('getTitle')
AddEventHandler('getTitle', function(title)
	title = title
end)

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
    TriggerClientEvent('chatMessage', -1, 'Toolbox', {255, 255, 255},'Officer ^2' .. GetPlayerName(_source) .. ' ^7Has pushed their panic button. Location: ' .. street)
	TriggerClientEvent('panicButtonSound', -1)
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

-- Threads

-- Functions

-- Version Checker do not remove --

local CurrentVersion = '2.4.5'
local GithubResourceName = 'Menu'
local versionurl = "https://raw.githubusercontent.com/rhys19/Menu-Stuff/master/VERSION"
local changesurl = "https://raw.githubusercontent.com/rhys19/Menu-Stuff/master/CHANGES"

PerformHttpRequest(versionurl, function(Error, NewestVersion, Header)
	PerformHttpRequest(changesurl, function(Error, Changes, Header)
		print('\n')
		print('====================================================================')
		print('')
		print('Admin Script')
		print('')
		print('Current Version: ' .. CurrentVersion)
		print('Newest Version: ' .. NewestVersion)
		io.write("")
		print('Changelog: \n' .. Changes)
		print('')
		if CurrentVersion ~= NewestVersion then
			print('====================================================================')
		else
			print('===================')
			print('=== Up to date! ===')
			print('===================')
		end
		print('\n')
end)
