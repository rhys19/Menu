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
-- useful

-- Version Checker do not remove --

local CurrentVersion = '2.4.4'
local GithubResourceName = 'Menu'

PerformHttpRequest('https://raw.githubusercontent.com/rhys19/Menu-stuff/master/VERSION', function(Error, NewestVersion, Header)
	PerformHttpRequest('https://raw.githubusercontent.com/rhys19/Menu-stuff/master/CHANGES', function(Error, Changes, Header)
		print('\n')
		print('--------------------------------------------------------------------')
		print('')
		print('Admin Script')
		print('')
		print('Current Version: ' .. CurrentVersion)
		print('Newest Version: ' .. NewestVersion)
		io.write("")
		print(' Changelog: ' .. Changes)
		print('')
		if CurrentVersion ~= NewestVersion then
			print('--------------------------------------------------------------------')
		else
			print('-- Up to date!')
			print('--------------')
		end
		print('\n')
end)
end)
