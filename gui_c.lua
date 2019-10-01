-- ADMIN SHIT --
local isAdmin = false
--[[ isAdmin = false

RegisterNetEvent("sendAdminPermissionToClient")
AddEventHandler("sendAdminPermissionToClient", function(state)
    isAdmin = state
end)--]]

local control = 244 -- set to whatever key you want key ids below
local title = "Toolbox"

-- need key ids? get them here: https://rhys19.life/ or https://docs.fivem.net/

--[[-----------------------------------------------------
Coded By Rhys19 © 2018
Functions are not copied they are off a gta5 animation site functions are built together from docs.fivem.net & the Native Reference
Lock code Removed -- Making my own.
Radar By Rhys19 (Coming Soon)
Fix is very simple to create!
Door controls by rhys19 -- your litterally just checking if the car has the door and setting it as opened lol.
-------------------------------------------------------
]]

--[[ 
Key IDS {
	ESC = 322,
	F1 = 288,
	F2 = 289,
	F3 = 170,
	F5 = 166,
	F6 = 167,
	F7 = 168,
	F8 = 169,
	F9 = 56,
	F10 = 57,
	~ = 243,
	1 = 157,
	2 = 158,
	3 = 160,
	4 = 164,
	5 = 165,
	6 = 159,
	7 = 161,
	8 = 162,
	9 = 163,
	- = 84 ,
	= = 83,
	BACKSPACE = 177,
	TAB = 37,
	Q = 44,
	W = 32,
	E = 38,
	R = 45,
	T = 245,
	Y = 246,
	U = 303,
	P = 199,
	[ = 39,
	] = 40,
	ENTER = 18,
	CAPS = 137,
	A = 34,
	S = 8,
	D = 9,
	F = 23,
	G = 47,
	H = 74,
	K = 311,
	L = 182,
	LEFTSHIFT = 21,
	Z = 20,
	X = 73,
	C = 26,
	V = 0,
	B = 29,
	N = 249,
	M = 244,
	, = 82,
	. = 81,
	LEFTCTRL = 36,	
	LEFTALT = 19,
	SPACE = 22,
	RIGHTCTRL = 70,
	HOME = 213,
	PAGEUP = 10,
	PAGEDOWN = 11,
	DELETE = 178,
	LEFT = 174,
	RIGHT = 175,
	TOP = 27,
	DOWN = 173,
	NENTER = 201,
	N4 = 108,
	N5 = 60,
	N6 = 107,
	N+ = 96,
	N- = 97,
	N7 = 117,
	N8 = 61,
	N9 = 118
	},
]]

--isAdmin = false

_menuPool = NativeUI.CreatePool()
mainMenu = NativeUI.CreateMenu(title, "~b~Main Menu") -- menu name appears at top of menu
_menuPool:Add(mainMenu)
_menuPool:MouseControlsEnabled(false)
_menuPool:ControlDisablingEnabled(false)
local fe = false

function AddMenuVeh(menu)
    local submenu = _menuPool:AddSubMenu(menu, "Vehicle")
    for i = 1, 1 do
    	local Item = NativeUI.CreateItem("Lock", "Locks your car!, ~r~Not working yet!")
		Item.Activated = function(ParentMenu, SelectedItem)
    		--Do stuff
    		ShowNotification('~r~Not working yet!')
    	end
		local Item2 = NativeUI.CreateItem("Unlock", "Unlocks your car!, ~r~Not working yet!")
		Item2.Activated = function(ParentMenu, SelectedItem)
    		--Do stuff
    		ShowNotification('~r~Not working yet!')
    	end
		local Item3 = NativeUI.CreateItem("Roll Windows Front", "Roll Front Windows Up And Down")
		Item3.Activated = function(ParentMenu, SelectedItem)
    		--Do stuff
    		TriggerEvent('frontWindow')
    	end
		local Item4 = NativeUI.CreateItem("Roll Rear Windows", "Roll Rear Windows Up And Down")
		Item4.Activated = function(ParentMenu, SelectedItem)
    		--Do stuff
    		TriggerEvent('rearWindow')
    	end
		local Item5 = NativeUI.CreateItem("Save Vehicle", "Save the vehicle!, ~r~Not working yet!")
		Item5.Activated = function(ParentMenu, SelectedItem)
    		--Do stuff
    		ShowNotification('~r~Not working yet!')
    	end
		local Item6 = NativeUI.CreateItem("Engine", "Toggle Your Engine!")
		Item6.Activated = function(ParentMenu, SelectedItem)
    		--Do stuff
    		EngineToggle()
    	end
		local Item7 = NativeUI.CreateItem("Repair", "Repair Your Vehicle!")
		Item7.Activated = function(ParentMenu, SelectedItem)
    		--Do stuff
    		TriggerEvent('fixveh')
    	end
		local Item8 = NativeUI.CreateItem("~r~Delete~r~", "~r~Delete your Vehicle!")
		Item8.Activated = function(ParentMenu, SelectedItem)
    		--Do stuff
    		TriggerEvent('deleteVehicle')
    	end
    local extra2 = {0,1,2,3,4,5,6,7,8,9}
    local newitem2 = NativeUI.CreateListItem("Livery", extra2, 1, false)
   -- menu:AddItem(newitem2)
	
	submenu.OnListChange = function(sender, item, index)
		if item == newitem2 then
		quantity = item:IndexToItem(index)
		ShowNotification("~g~ Success: ~w~Livery Changed to ~y~#".. quantity)
		local Veh = GetVehiclePedIsIn(GetPlayerPed(-1))
		SetVehicleLivery(Veh, quantity)
	end
end
        submenu:AddItem(Item)
		submenu:AddItem(Item2)
		submenu:AddItem(Item3)
		submenu:AddItem(Item4)
		submenu:AddItem(Item5)
		submenu:AddItem(Item6)
		submenu:AddItem(Item7)
		submenu:AddItem(Item8)
		submenu:AddItem(newitem2)
		_menuPool:MouseControlsEnabled(false)
		_menuPool:ControlDisablingEnabled(false)
    end
end

function AddMenuleo(menu)
    local submenu = _menuPool:AddSubMenu(menu, "LEO")
	for i = 1, 1 do
		--if isAdmin then
    	local Item = NativeUI.CreateItem("Cuff", "")
		Item.Activated = function(ParentMenu, SelectedItem)
    		--Do stuff
    		TriggerEvent('cuff')
    	end
		local Item2 = NativeUI.CreateItem("Drag", "")
		Item2.Activated = function(ParentMenu, SelectedItem)
    		--Do stuff
    		TriggerEvent('grabNear')
    	end
		local Item3 = NativeUI.CreateItem("Put In Vehicle", "")
		Item3.Activated = function(ParentMenu, SelectedItem)
    		--Do stuff
    		TriggerEvent('seat')
    	end
		local Item4 = NativeUI.CreateItem("Take Out Of Vehicle", "")
		Item4.Activated = function(ParentMenu, SelectedItem)
    		--Do stuff
    		TriggerEvent('unseat')
    	end
		local Item5 = NativeUI.CreateItem("Uncuff", "")
		Item5.Activated = function(ParentMenu, SelectedItem)
    		--Do stuff
    		TriggerEvent('cuff')
    	end
		local Item6 = NativeUI.CreateItem("Undrag", "")
		Item6.Activated = function(ParentMenu, SelectedItem)
    		--Do stuff
    		TriggerEvent('grabNear')
    	end
		local Item7 = NativeUI.CreateItem("unrack", "unrack your carbine")
		Item7.Activated = function(ParentMenu, SelectedItem)
    		--Do stuff
    		TriggerEvent('unrack')
    	end
		local Item8 = NativeUI.CreateItem("rack", "rack your carbine")
		Item8.Activated = function(ParentMenu, SelectedItem)
    		--Do stuff
    		TriggerEvent('rack')
			end
		local Item9 = NativeUI.CreateItem("Deploy Spikes", "Deploy Spikes")
		Item9.Activated = function(ParentMenu, SelectedItem)
    		--Do stuff
    		spikes()
			end
		local Item10 = NativeUI.CreateItem("Remove Spikes", "Remove Spikes")
		Item10.Activated = function(ParentMenu, SelectedItem)
    		--Do stuff
    		delspike()
			end
		local Item11 = NativeUI.CreateItem("Radar", "Toggle the Radar Menu")
		Item11.Activated = function(ParentMenu, SelectedItem)
    		--Do stuff
    		TriggerEvent('wk:radarRC')
			ToggleMenu()
    	end
		local Item12 = NativeUI.CreateItem("Police Megaphone", "")
		Item12.Activated = function(ParentMenu, SelectedItem)
    		--Do stuff
    		TriggerEvent('polspeak:openMenu')
			ToggleMenu()
    	end
		local Item13 = NativeUI.CreateItem("Exit", "")
		Item13.Activated = function(ParentMenu, SelectedItem)
    		--Do stuff
    		ToggleMenu()
		end
        submenu:AddItem(Item)
		submenu:AddItem(Item2)
		submenu:AddItem(Item3)
		submenu:AddItem(Item4)
		submenu:AddItem(Item5)
		submenu:AddItem(Item6)
		submenu:AddItem(Item7)
		submenu:AddItem(Item8)
		submenu:AddItem(Item9)
		submenu:AddItem(Item10)
		submenu:AddItem(Item11)
		submenu:AddItem(Item12)
		submenu:AddItem(Item13)
		_menuPool:MouseControlsEnabled(false)
		_menuPool:ControlDisablingEnabled(false)
			--else
				--ShowNotification("~R~Insufficient Permissions")
	--end
    end
end

RegisterNetEvent('police:toggleDrag')
AddEventHandler('police:toggleDrag', function(t)
	if(handCuffed) then
		drag = not drag
		officerDrag = t
	end
end)

function GetPlayers()
    local players = {}

    for i = 0, 255 do
        if NetworkIsPlayerActive(i) then
            table.insert(players, i)
        end
    end

    return players
end

function GetClosestPlayer()
	local players = GetPlayers()
	local closestDistance = -1
	local closestPlayer = -1
	local ply = PlayerPedId()
	local plyCoords = GetEntityCoords(ply, 0)
	
	for index,value in ipairs(players) do
		local target = GetPlayerPed(value)
		if(target ~= ply) then
			local targetCoords = GetEntityCoords(GetPlayerPed(value), 0)
			local distance = Vdist(targetCoords["x"], targetCoords["y"], targetCoords["z"], plyCoords["x"], plyCoords["y"], plyCoords["z"])
			if(closestDistance == -1 or closestDistance > distance) then
				closestPlayer = value
				closestDistance = distance
			end
		end
	end
	
	return closestPlayer, closestDistance
end

--[[ seat me start ]]

RegisterNetEvent('seat')
AddEventHandler('seat',function()
	local t, distance = GetClosestPlayer()
	if(distance ~= -1 and distance < 3) then
		TriggerServerEvent("seatServer", GetPlayerServerId(t))
	else
    	ShowNotification("There is no nearby player to seat")
	end
end)

RegisterNetEvent('unseat')
AddEventHandler('unseat',function()
	local t, distance = GetClosestPlayer()
	if(distance ~= -1 and distance < 2) then
		TriggerServerEvent("unSeatServer", GetPlayerServerId(t))
	else
    	ShowNotification("There is no nearby player to unseat")
	end
end)

RegisterNetEvent('seatClient')
AddEventHandler('seatClient', function(veh)
		local pos = GetEntityCoords(PlayerPedId())
		local entityWorld = GetOffsetFromEntityInWorldCoords(PlayerPedId(), 0.0, 20.0, 0.0)

		local rayHandle = CastRayPointToPoint(pos.x, pos.y, pos.z, entityWorld.x, entityWorld.y, entityWorld.z, 10, PlayerPedId(), 0)
		local _, _, _, _, vehicleHandle = GetRaycastResult(rayHandle)

		if vehicleHandle ~= nil then
			if(IsVehicleSeatFree(vehicleHandle, 1)) then
				SetPedIntoVehicle(PlayerPedId(), vehicleHandle, 1)
			else 
				if(IsVehicleSeatFree(vehicleHandle, 2)) then
					SetPedIntoVehicle(PlayerPedId(), vehicleHandle, 2)
			end
		end
	end
end)

RegisterNetEvent('unSeatClient')
AddEventHandler('unSeatClient', function(t)
	local ped = GetPlayerPed(t)        
	ClearPedTasksImmediately(ped)
	plyPos = GetEntityCoords(PlayerPedId(),  true)
	local xnew = plyPos.x+2
	local ynew = plyPos.y+2
   
	SetEntityCoords(PlayerPedId(), xnew, ynew, plyPos.z)
end)

--[[seat me end]]

function AddMenudoorctrl(menu)
    local submenu = _menuPool:AddSubMenu(menu, "Doors")
    for i = 1, 1 do
    	local Item = NativeUI.CreateItem("Toggle Left Front Door", "")
		Item.Activated = function(ParentMenu, SelectedItem)
    		--Do stuff
    		TriggerEvent('frontLeft')
    	end
		local Item2 = NativeUI.CreateItem("Toggle Left Rear Door", "")
		Item2.Activated = function(ParentMenu, SelectedItem)
    		--Do stuff
    		TriggerEvent('rearLeft')
    	end
		local Item3 = NativeUI.CreateItem("Toggle Right Front Door", "")
		Item3.Activated = function(ParentMenu, SelectedItem)
    		--Do stuff
    		TriggerEvent('frontRight')
    	end
		local Item4 = NativeUI.CreateItem("Toggle Right Rear Door", "")
		Item4.Activated = function(ParentMenu, SelectedItem)
    		--Do stuff
    		TriggerEvent('rearRight')
    	end
		local Item5 = NativeUI.CreateItem("Open All Doors", "")
		Item5.Activated = function(ParentMenu, SelectedItem)
    		--Do stuff
    		TriggerEvent('frontLeft')
			TriggerEvent('rearLeft')
			TriggerEvent('frontRight')
			TriggerEvent('rearRight')
			TriggerEvent('openHood')
			TriggerEvent('openTrunk')
    	end
		local Item6 = NativeUI.CreateItem("Close All Doors", "")
		Item6.Activated = function(ParentMenu, SelectedItem)
    		--Do stuff
    		TriggerEvent('frontLeft')
			TriggerEvent('rearLeft')
			TriggerEvent('frontRight')
			TriggerEvent('rearRight')
			TriggerEvent('openHood')
			TriggerEvent('openTrunk')
    	end
		local Item7 = NativeUI.CreateItem("Toggle Hood", "")
		Item7.Activated = function(ParentMenu, SelectedItem)
    		--Do stuff
    		TriggerEvent('openHood')
    	end
		local Item8 = NativeUI.CreateItem("Toggle Trunk", "")
		Item8.Activated = function(ParentMenu, SelectedItem)
    		--Do stuff
    		TriggerEvent('openTrunk')
    	end
        submenu:AddItem(Item)
		submenu:AddItem(Item2)
		submenu:AddItem(Item3)
		submenu:AddItem(Item4)
		submenu:AddItem(Item5)
		submenu:AddItem(Item6)
		submenu:AddItem(Item7)
		submenu:AddItem(Item8)
		_menuPool:MouseControlsEnabled(false)
		_menuPool:ControlDisablingEnabled(false)
    end
end

function AddMenuciv(menu)
    local submenu = _menuPool:AddSubMenu(menu, "Civ")
    for i = 1, 1 do
    	local Item = NativeUI.CreateItem("Handsup", "")
		Item.Activated = function(ParentMenu, SelectedItem)
    		--Do stuff
    		TriggerEvent('Handsup2')
    	end
		local Item2 = NativeUI.CreateItem("Kneel", "")
		Item2.Activated = function(ParentMenu, SelectedItem)
    		--Do stuff
    		TriggerEvent('KneelHU2')
		end
		local Item3 = NativeUI.CreateItem("Set RP Name", "Set your roleplay name!")
		Item3.Activated = function(ParentMenu, SelectedItem)
    		--Do stuff
    		TriggerEvent('rpname')
		end
		local Item4 = NativeUI.CreateItem("Show ID", "Show your roleplay name!")
		Item4.Activated = function(ParentMenu, SelectedItem)
    		--Do stuff
    		TriggerEvent('rpnameshow')
    	end
		local Item5 = NativeUI.CreateItem("Cancel Emote", "Cancel your current emote/animation")
		Item5.Activated = function(ParentMenu, SelectedItem)
    		--Do stuff
    		TriggerEvent('cancelEmote')
    	end
        submenu:AddItem(Item)
		submenu:AddItem(Item2)
		submenu:AddItem(Item3)
		submenu:AddItem(Item4)
		submenu:AddItem(Item5)
		_menuPool:MouseControlsEnabled(false)
		_menuPool:ControlDisablingEnabled(false)
    end
end

function AddMenuloadout(menu)
    local submenu = _menuPool:AddSubMenu(menu, "Loadouts")
    for i = 1, 1 do
    	local Item = NativeUI.CreateItem("PD loadout", "Equip the PD Loadout")
		Item.Activated = function(ParentMenu, SelectedItem)
    		--Do stuff
    		TriggerEvent('leoloadout')
    	end
		local Item2 = NativeUI.CreateItem("Sheriff Loadout", "Equip the Sheriff Loadout")
		Item2.Activated = function(ParentMenu, SelectedItem)
    		--Do stuff
    		TriggerEvent('bcloadout')
		end
		local Item3 = NativeUI.CreateItem("Highway loadout", "Equip the Highway Loadout")
		Item3.Activated = function(ParentMenu, SelectedItem)
    		--Do stuff
    		TriggerEvent('leoloadout')
		end
		local Item4 = NativeUI.CreateItem("SRU/Swat Loadout", "Equip the SRU/Swat Loadout")
		Item4.Activated = function(ParentMenu, SelectedItem)
    		--Do stuff
    		TriggerEvent('swatloadout')
		end
		local NewItem5 = NativeUI.CreateCheckboxItem("Equip Fire Extinguisher", fe, "Equip your Fire Extinguisher!")
		NewItem5.OnCheckboxChange = function(sender, item, checked_)
			if item == NewItem5 then
				fe = checked_
				ShowNotification("~r~Added Fire Extinguisher ~b~")
				TriggerEvent("Equip_Fire_Extinguisher")
			end
		end
        submenu:AddItem(Item)
		submenu:AddItem(Item2)
		submenu:AddItem(Item3)
		submenu:AddItem(Item4)
		submenu:AddItem(NewItem5)
		_menuPool:MouseControlsEnabled(false)
		_menuPool:ControlDisablingEnabled(false)
    end
end

local emotes = {
	"Smoke",
	"Party",
	"Drink",
	"Pushups",
	"Phone",
	"Weed",
	"Coffee",
	"Photo",
	"Binoculars",
	"Situps",
	"Film",
	"Weights",
	"Flex",
	"Stance",
	"Investigate",
	"Citation",
	"Notes",
	"Weld",
	"Traffic",
	"Medic",
}

function AddMenuEmotes(menu)
    local submenu = _menuPool:AddSubMenu(menu, "Emotes")
    for i = 1, 1 do
		local Item = NativeUI.CreateListItem("Emotes", emotes, 1)
		menu.OnListChange = function(sender, item, index)
			if item == Item then
				emotes = item:IndexToItem(index)
				ShowNotification("~r~WIP")
				TriggerEvent(emotes)
			end
		end
        submenu:AddItem(Item)
		_menuPool:MouseControlsEnabled(false)
		_menuPool:ControlDisablingEnabled(false)
    end
end

AddMenuleo(mainMenu)
AddMenuciv(mainMenu)
AddMenuVeh(mainMenu)
AddMenuloadout(mainMenu)
AddMenudoorctrl(mainMenu)
AddMenuEmotes(mainMenu)
_menuPool:RefreshIndex()

function ToggleMenu()
	_menuPool:CloseAllMenus()
end

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)
        _menuPool:ProcessMenus()
        if IsControlJustPressed(1, control) and GetLastInputMethod( 0 ) then
            mainMenu:Visible(not mainMenu:Visible())
        end
    end
end)

RegisterNetEvent("Equip_Fire_Extinguisher")
AddEventHandler("Equip_Fire_Extinguisher", function()
	local ped = GetPlayerPed(PlayerId())
	GiveWeaponToPed(GetPlayerPed(-1), GetHashKey("weapon_fireextinguisher"), 1000, false)
	TriggerServerEvent("unrackmsg")
end)

RegisterNetEvent("unrack")
AddEventHandler("unrack", function()
	local ped = GetPlayerPed(PlayerId())
	GiveWeaponToPed(GetPlayerPed(-1), GetHashKey("WEAPON_CARBINERIFLE"), 1000, false)
	GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_CARBINERIFLE"), GetHashKey("COMPONENT_CARBINERIFLE_CLIP_02")) -- Carbine - Extended Clip
	GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_CARBINERIFLE"), GetHashKey("COMPONENT_AT_AR_FLSH")) -- carbine flashlight
	--GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_CARBINERIFLE"), GetHashKey("COMPONENT_AT_SCOPE_MEDIUM")) -- carbine scope
	GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_CARBINERIFLE"), GetHashKey("COMPONENT_AT_AR_AFGRIP")) -- carbine grip
	TriggerServerEvent("unrackmsg")
end)

RegisterNetEvent("rack")
AddEventHandler("rack", function()
	local ped = GetPlayerPed(PlayerId())
	RemoveWeaponFromPed(GetPlayerPed(-1), GetHashKey("WEAPON_CARBINERIFLE"))
	--TriggerEvent('chatMessage', 'Toolbox', {255, 255, 255}, ''..GetPlayerName(sourceID)..' Has racked their carbine rifle')
	TriggerServerEvent("rackmsg")
end)

RegisterNetEvent("leoloadout")
AddEventHandler("leoloadout", function()
    local ped = PlayerPedId()
	GiveWeaponToPed(GetPlayerPed(-1), GetHashKey("WEAPON_COMBATPISTOL"), 1000, false) -- equip the combat pistol
	GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_COMBATPISTOL"), GetHashKey("COMPONENT_AT_PI_FLSH")) -- equip the flashlight attachment!
	GiveWeaponToPed(GetPlayerPed(-1), GetHashKey("WEAPON_BZGAS"), 1000, false) -- equip BZ Gas
	GiveWeaponToPed(GetPlayerPed(-1), GetHashKey("WEAPON_FLARE"), 1000, false) -- Equip Flare
	GiveWeaponToPed(GetPlayerPed(-1), GetHashKey("WEAPON_NIGHTSTICK"), 1000, false) -- Equip NightStick
	GiveWeaponToPed(GetPlayerPed(-1), GetHashKey("WEAPON_FLASHLIGHT"), 1000, false) -- Equip Flashlight
	GiveWeaponToPed(GetPlayerPed(-1), GetHashKey("WEAPON_STUNGUN"), 1000, false) -- Equip Tazer
	GiveWeaponToPed(GetPlayerPed(-1), GetHashKey("WEAPON_PUMPSHOTGUN "), 1000, false) -- Equip Shotgun
	GiveWeaponToPed(GetPlayerPed(-1), GetHashKey("WEAPON_HANDCUFFS "), 1000, false) -- Equip Handcuffs 
	GiveWeaponToPed(GetPlayerPed(-1), GetHashKey("WEAPON_CARBINERIFLE"), 1000, false)
	GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_CARBINERIFLE"), GetHashKey("0x91109691")) -- Carbine - Extended Clip
	GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_CARBINERIFLE"), GetHashKey("0x7BC4CDDC")) -- carbine flashlight
	GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_CARBINERIFLE"), GetHashKey("0xA0D89C42")) -- carbine scope
	GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_CARBINERIFLE"), GetHashKey("0xC164F53")) -- carbine grip
    drawNotification("~g~Your LEO loadout has been equipped!")	
end)

RegisterNetEvent("bcloadout")
AddEventHandler("bcloadout", function()
    local ped = PlayerPedId()
	GiveWeaponToPed(GetPlayerPed(-1), GetHashKey("WEAPON_COMBATPISTOL"), 1000, false) -- equip the combat pistol
	GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_COMBATPISTOL"), GetHashKey("COMPONENT_AT_PI_FLSH")) -- equip the flashlight attachment!
	GiveWeaponToPed(GetPlayerPed(-1), GetHashKey("WEAPON_BZGAS"), 1000, false) -- equip BZ Gas
	GiveWeaponToPed(GetPlayerPed(-1), GetHashKey("WEAPON_FLARE"), 1000, false) -- Equip Flare
	GiveWeaponToPed(GetPlayerPed(-1), GetHashKey("WEAPON_NIGHTSTICK"), 1000, false) -- Equip NightStick
	GiveWeaponToPed(GetPlayerPed(-1), GetHashKey("WEAPON_FLASHLIGHT"), 1000, false) -- Equip Flashlight
	GiveWeaponToPed(GetPlayerPed(-1), GetHashKey("WEAPON_STUNGUN"), 1000, false) -- Equip Tazer
	GiveWeaponToPed(GetPlayerPed(-1), GetHashKey("WEAPON_PUMPSHOTGUN"), 1000, false) -- Equip Shotgun
	GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_PUMPSHOTGUN"), GetHashKey("COMPONENT_AT_AR_FLSH"))
	GiveWeaponToPed(GetPlayerPed(-1), GetHashKey("WEAPON_HANDCUFFS "), 1000, false) -- Equip Handcuffs 
	GiveWeaponToPed(GetPlayerPed(-1), GetHashKey("WEAPON_CARBINERIFLE"), 1000, false)
	GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_CARBINERIFLE"), GetHashKey("0x91109691")) -- Carbine - Extended Clip
	GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_CARBINERIFLE"), GetHashKey("0x7BC4CDDC")) -- carbine flashlight
	GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_CARBINERIFLE"), GetHashKey("0xA0D89C42")) -- carbine scope
	GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_CARBINERIFLE"), GetHashKey("0xC164F53")) -- carbine grip
    drawNotification("~g~Your Sheriff loadout has been equipped!")	
end)

RegisterNetEvent("fdloadout")
AddEventHandler("fdloadout", function()
    local ped = PlayerPedId()
	GiveWeaponToPed(GetPlayerPed(-1), GetHashKey("WEAPON_FLARE"), 1000, false) -- Equip Flare
	GiveWeaponToPed(GetPlayerPed(-1), GetHashKey("WEAPON_FLASHLIGHT"), 1000, false) -- equip Flashlight
	GiveWeaponToPed(GetPlayerPed(-1), GetHashKey("WEAPON_STUNGUN"), 1000, false) -- equip stungun
	GiveWeaponToPed(GetPlayerPed(-1), GetHashKey("WEAPON_FLAREGUN"), 1000, false) -- equip flaregun
	GiveWeaponToPed(GetPlayerPed(-1), GetHashKey("WEAPON_MOLOTOV"), 1000, false) -- equip molotov
	GiveWeaponToPed(GetPlayerPed(-1), GetHashKey("WEAPON_FIREEXTINGUISHER"), 1000, false) -- equip fire Extinguisher
    drawNotification("~g~Your Fire Department loadout has been equipped!")	
end)

RegisterNetEvent("emsloadout")
AddEventHandler("emsloadout", function()
    local ped = PlayerPedId()
	GiveWeaponToPed(GetPlayerPed(-1), GetHashKey("WEAPON_FLASHLIGHT"), 1000, false) -- equip flashlight
	GiveWeaponToPed(GetPlayerPed(-1), GetHashKey("WEAPON_STUNGUN"), 1000, false) -- equip stungun
	GiveWeaponToPed(GetPlayerPed(-1), GetHashKey("WEAPON_GARBAGEBAG"), 1000, false) -- equip bag 
    drawNotification("~g~Your EMS loadout has been equipped!")	
end)

RegisterNetEvent("swatLoadout")
AddEventHandler("swatLoadout", function()
    local ped = PlayerPedId()
	GiveWeaponToPed(GetPlayerPed(-1), GetHashKey("WEAPON_COMBATPISTOL"), 1000, false) -- equip the combat pistol
	GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_COMBATPISTOL"), GetHashKey("COMPONENT_AT_PI_FLSH")) -- equip the flashlight attachment!
	GiveWeaponToPed(GetPlayerPed(-1), GetHashKey("WEAPON_CARBINERIFLE"), 1000, false)
	GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_CARBINERIFLE"), GetHashKey("0x91109691")) -- Carbine - Extended Clip
	GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_CARBINERIFLE"), GetHashKey("0x7BC4CDDC")) -- carbine flashlight
	GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_CARBINERIFLE"), GetHashKey("0xA0D89C42")) -- carbine scope
	GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_CARBINERIFLE"), GetHashKey("0xC164F53")) -- carbine grip
	GiveWeaponToPed(GetPlayerPed(-1), GetHashKey("WEAPON_BZGAS"), 1000, false) -- equip BZ Gas
	GiveWeaponToPed(GetPlayerPed(-1), GetHashKey("WEAPON_FLARE"), 1000, false) -- Equip Flare
	GiveWeaponToPed(GetPlayerPed(-1), GetHashKey("WEAPON_NIGHTSTICK"), 1000, false) -- Equip NightStick
	GiveWeaponToPed(GetPlayerPed(-1), GetHashKey("WEAPON_FLASHLIGHT"), 1000, false) -- Equip Flashlight
	GiveWeaponToPed(GetPlayerPed(-1), GetHashKey("WEAPON_STUNGUN"), 1000, false) -- Equip Tazer
    drawNotification("~g~Your SWAT loadout has been equipped!")	
end)

-------------- FUNCTIONS --------------------

---------------- Put your hands up ----------------

RegisterNetEvent("Handsup2")
AddEventHandler("Handsup2", function()
	local lPed = GetPlayerPed(-1)
	if DoesEntityExist(lPed) then
		Citizen.CreateThread(function()
			RequestAnimDict("random@arrests")
			while not HasAnimDictLoaded("random@arrests") do
				Citizen.Wait(100)
			end

			if IsEntityPlayingAnim(lPed, "random@arrests", "idle_2_hands_up", 3) then
				ClearPedSecondaryTask(lPed)
				SetEnableHandcuffs(lPed, false)
			else
				TaskPlayAnim(lPed, "random@arrests", "idle_2_hands_up", 8.0, -8, -1, 49, 0, 0, 0, 0)
				SetEnableHandcuffs(lPed, true)
			end
		end)
	end
end)

---------------- Put your hands up ----------------

--------------- Kneel with hands up ----------------

function loadAnimDict( dict )
    while ( not HasAnimDictLoaded( dict ) ) do
        RequestAnimDict( dict )
        Citizen.Wait( 5 )
    end
end 

RegisterNetEvent( 'KneelHU2' )
AddEventHandler( 'KneelHU2', function()
    local player = GetPlayerPed( -1 )
	if ( DoesEntityExist( player ) and not IsEntityDead( player )) then 
        loadAnimDict( "random@arrests" )
		loadAnimDict( "random@arrests@busted" )
		if ( IsEntityPlayingAnim( player, "random@arrests", "kneeling_arrest_idle", 3 ) ) then 
			TaskPlayAnim( player, "random@arrests@busted", "exit", 8.0, 1.0, -1, 2, 0, 0, 0, 0 )
			Wait (3000)
            TaskPlayAnim( player, "random@arrests", "kneeling_arrest_get_up", 8.0, 1.0, -1, 128, 0, 0, 0, 0 )
        else
            TaskPlayAnim( player, "random@arrests", "idle_2_hands_up", 8.0, 1.0, -1, 2, 0, 0, 0, 0 )
			Wait (4000)
            TaskPlayAnim( player, "random@arrests", "kneeling_arrest_idle", 8.0, 1.0, -1, 2, 0, 0, 0, 0 )
			--[[Wait (500)
			TaskPlayAnim( player, "random@arrests@busted", "enter", 8.0, 1.0, -1, 2, 0, 0, 0, 0 )
			Wait (1000)
			TaskPlayAnim( player, "random@arrests@busted", "idle_a", 8.0, 1.0, -1, 9, 0, 0, 0, 0 )--]]
        end     
    end
end )

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(0)
		if IsEntityPlayingAnim(GetPlayerPed(PlayerId()), "random@arrests@busted", "idle_a", 3) then
			DisableControlAction(1, 140, true)
			DisableControlAction(1, 141, true)
			DisableControlAction(1, 142, true)
			DisableControlAction(0, 21, true)
		end
	end
end)

---------------- Kneel with hands up ----------------


function drawNotification(text) --Just Don't Edit!
    SetNotificationTextEntry("STRING")
    AddTextComponentString(text)
    DrawNotification(false, false)
end

-- Front Windows Start

local windowup = true
RegisterNetEvent("frontWindow")
AddEventHandler('frontWindow', function()
    local playerPed = GetPlayerPed(-1)
    if IsPedInAnyVehicle(playerPed, false) then
        local playerCar = GetVehiclePedIsIn(playerPed, false)
		if ( GetPedInVehicleSeat( playerCar, -1 ) == playerPed ) then 
            SetEntityAsMissionEntity( playerCar, true, true )
		
			if ( windowup ) then
				RollDownWindow(playerCar, 0)
				RollDownWindow(playerCar, 1)
				drawNotification("You rolled down your front windows.")
				windowup = false
			else
				RollUpWindow(playerCar, 0)
				RollUpWindow(playerCar, 1)
				drawNotification("You rolled up your front windows.")
				windowup = true
			end
		end
	end
end )

-- Front Windows End

-- Rear Windows Start

local windowup = true
RegisterNetEvent("rearWindow")
AddEventHandler('rearWindow', function()
    local playerPed = GetPlayerPed(-1)
    if IsPedInAnyVehicle(playerPed, false) then
        local playerCar = GetVehiclePedIsIn(playerPed, false)
		if ( GetPedInVehicleSeat( playerCar, -1 ) == playerPed ) then 
            SetEntityAsMissionEntity( playerCar, true, true )
		
			if ( windowup ) then
				RollDownWindow(playerCar, 2)
				RollDownWindow(playerCar, 3)
				drawNotification("~w~You rolled down your rear windows.")
				windowup = false
			else
				RollUpWindow(playerCar, 2)
				RollUpWindow(playerCar, 3)
				drawNotification("~w~You rolled up your rear windows.")
				windowup = true
			end
		end
	end
end )

-- Rear Windows End

--[LEO Animations Start]

-- Hand on Radio Start

RegisterNetEvent('Radio')
AddEventHandler('Radio', function()

local ped = GetPlayerPed( -1 )
    
if ( DoesEntityExist( ped ) and not IsEntityDead( ped ) ) then 

Citizen.CreateThread( function()
	RequestAnimDict( "random@arrests" )
	   while ( not HasAnimDictLoaded( "random@arrests" ) ) do 
                Citizen.Wait( 100 )
            end
				if IsEntityPlayingAnim(ped, "random@arrests", "generic_radio_chatter", 3) then
				ClearPedSecondaryTask(ped)
				SetCurrentPedWeapon(ped, GetHashKey("GENERIC_RADIO_CHATTER"), true)
				else
				TaskPlayAnim(ped, "random@arrests", "generic_radio_chatter", 8.0, 2.5, -1, 49, 0, 0, 0, 0 )
				SetCurrentPedWeapon(ped, GetHashKey("GENERIC_RADIO_CHATTER"), true)
            end 
        end )
    end 
end )

-- Hand on Radio End

-- Hand on Radio W/ Gun Start

function loadAnimDict( dict )
    while ( not HasAnimDictLoaded( dict ) ) do
        RequestAnimDict( dict )
        Citizen.Wait( 5 )
    end
end

RegisterNetEvent( 'RadioGunPoint' )
AddEventHandler( 'RadioGunPoint', function()
	local ped = GetPlayerPed( -1 )
    if ( DoesEntityExist( ped ) and not IsEntityDead( ped )) then
        loadAnimDict( "random@arrests" )
        if ( IsEntityPlayingAnim( ped, "random@arrests", "radio_chatter", 3 ) ) then
				ClearPedSecondaryTask(ped)
				SetEnableHandcuffs(ped, false)
				SetCurrentPedWeapon(ped, GetHashKey("WEAPON_UNARMED"), true)
        else
				TaskPlayAnim(ped, "random@arrests", "radio_chatter", 8.0, 2.5, -1, 49, 0, 0, 0, 0 )
				SetCurrentPedWeapon(ped, GetHashKey("WEAPON_PISTOL"), true)
        end    
    end
end )
 
Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)
        if IsEntityPlayingAnim(GetPlayerPed(PlayerId()), "random@arrests", "radio_chatter", 3) then
            DisableControlAction(0, 21, true)
			DisableControlAction(1, 140, true)
            DisableControlAction(1, 141, true)
            DisableControlAction(1, 142, true)
        end
    end
end)

-- Hand on Radio W/ Gun End

-- LEO Stance Start

RegisterNetEvent('Stance')
AddEventHandler('Stance', function()

local ped = GetPlayerPed( -1 )
    if ( DoesEntityExist( ped ) and not IsEntityDead( ped ) ) then 
	TaskStartScenarioInPlace(PlayerPedId(), "WORLD_HUMAN_COP_IDLES", 0, true);
	Citizen.Wait(15000)
        ClearPedTasksImmediately(GetPlayerPed(-1))
    end 
end )

-- LEO Stance End

-- Investigate Start

RegisterNetEvent('Investigate')
AddEventHandler('Investigate', function()

local ped = GetPlayerPed( -1 )
    if ( DoesEntityExist( ped ) and not IsEntityDead( ped ) ) then 
	TaskStartScenarioInPlace(PlayerPedId(), "WORLD_HUMAN_GUARD_STAND", 0, true);
	Citizen.Wait(15000)
        ClearPedTasksImmediately(GetPlayerPed(-1))
    end 
end )

-- Investigate End

-- Holster Start

RegisterNetEvent( 'Holster' )
AddEventHandler( 'Holster', function()
	local ped = GetPlayerPed( -1 )
    if ( DoesEntityExist( ped ) and not IsEntityDead( ped )) then
        loadAnimDict( "move_m@intimidation@cop@unarmed" )
        if ( IsEntityPlayingAnim( ped, "move_m@intimidation@cop@unarmed", "idle", 3 ) ) then
				ClearPedSecondaryTask(ped)
				SetEnableHandcuffs(ped, false)
				SetCurrentPedWeapon(ped, GetHashKey("WEAPON_UNARMED"), true)
        else
				TaskPlayAnim(ped, "move_m@intimidation@cop@unarmed", "idle", 8.0, 2.5, -1, 49, 0, 0, 0, 0 )
				SetEnableHandcuffs(ped, true)
				SetCurrentPedWeapon(ped, GetHashKey("WEAPON_UNARMED"), true)
        end    
    end
end )
 
Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)
        if IsEntityPlayingAnim(GetPlayerPed(PlayerId()), "move_m@intimidation@cop@unarmed", "idle", 3) then
            DisableControlAction(0, 21, true)
			DisableControlAction(1, 140, true)
            DisableControlAction(1, 141, true)
            DisableControlAction(1, 142, true)
        end
    end
end)

-- Holster End

-- Citation Start


RegisterNetEvent('Citation')
AddEventHandler('Citation', function()

local ped = GetPlayerPed( -1 )
    if ( DoesEntityExist( ped ) and not IsEntityDead( ped ) ) then 
	TaskStartScenarioInPlace(PlayerPedId(), "CODE_HUMAN_MEDIC_TIME_OF_DEATH", 0, true);
	Citizen.Wait(9999999000)
        ClearPedTasksImmediately(GetPlayerPed(-1))
    end 
end )

-- Citation End

-- Take Notes Start


RegisterNetEvent('Notes')
AddEventHandler('Notes', function()

local ped = GetPlayerPed( -1 )
    if ( DoesEntityExist( ped ) and not IsEntityDead( ped ) ) then 
	TaskStartScenarioInPlace(PlayerPedId(), "WORLD_HUMAN_CLIPBOARD", 0, true);
	Citizen.Wait(9999999000)
        ClearPedTasksImmediately(GetPlayerPed(-1))
    end 
end )

-- Take Notes End


-- Welding Start

RegisterNetEvent('Weld')
AddEventHandler('Weld', function()

local ped = GetPlayerPed( -1 )
    if ( DoesEntityExist( ped ) and not IsEntityDead( ped ) ) then 
	TaskStartScenarioInPlace(PlayerPedId(), "WORLD_HUMAN_WELDING", 0, true);
	Citizen.Wait(9999999000)
        ClearPedTasksImmediately(GetPlayerPed(-1))
    end 
end )

-- Welding End

-- Direct Traffic Start


RegisterNetEvent('Traffic')
AddEventHandler('Traffic', function()

local ped = GetPlayerPed( -1 )
    if ( DoesEntityExist( ped ) and not IsEntityDead( ped ) ) then 
	TaskStartScenarioInPlace(PlayerPedId(), "WORLD_HUMAN_CAR_PARK_ATTENDANT", 0, true);
	Citizen.Wait(9999999000)
        ClearPedTasksImmediately(GetPlayerPed(-1))
    end 
end )

-- Direct Traffic End

-- Medic Observe Start


RegisterNetEvent('Medic')
AddEventHandler('Medic', function()

local ped = GetPlayerPed( -1 )
    if ( DoesEntityExist( ped ) and not IsEntityDead( ped ) ) then 
	TaskStartScenarioInPlace(PlayerPedId(), "CODE_HUMAN_MEDIC_KNEEL", 0, true);
	Citizen.Wait(9999999000)
        ClearPedTasksImmediately(GetPlayerPed(-1))
    end 
end )

-- Medic Observe End

-- Cancel Emote

RegisterNetEvent('cancelEmote')
AddEventHandler('cancelEmote', function()
	local ped = GetPlayerPed(-1)
    if (DoesEntityExist(ped) and not IsEntityDead(ped)) then
	    ClearPedTasksImmediately(ped)
		ClearPedTasks(ped)
		ClearPedSecondaryTask(ped)
        SetCurrentPedWeapon(ped, GetHashKey("WEAPON_UNARMED"), true)  
    end
end )

--[LEO Animations End]

-- Drop Weapon

function dropweap()
    local ped = PlayerPedId()
            local wep = GetSelectedPedWeapon(ped)
            SetPedDropsWeaponsWhenDead(ped, true)
            RequestAnimDict("mp_weapon_drop")
            if DoesEntityExist(ped) and not IsEntityDead(ped) and not IsPedInAnyVehicle(ped, true) and not IsPauseMenuActive() and IsPedArmed(ped, 7) then -- INPUT_DROP_WEAPON (F7)
            TaskPlayAnim(ped, "mp_weapon_drop", "drop_bh", 8.0, 2.0, -1, 0, 2.0, 0, 0, 0 )
            SetPedDropsInventoryWeapon(ped, wep, 0, 2.0, 0, -1)
            SetCurrentPedWeapon(ped, GetHashKey("WEAPON_UNARMED"), true)
			drawNotification("~r~You dropped your weapon.")
        end
end

function GetPlayers()
    local players = {}

    for i = 0, 255 do
        if NetworkIsPlayerActive(i) then
            table.insert(players, i)
        end
    end

    return players
end

function GetClosestPlayer()
	local players = GetPlayers()
	local closestDistance = -1
	local closestPlayer = -1
	local ply = GetPlayerPed(-1)
	local plyCoords = GetEntityCoords(ply, 0)
	
	for index,value in ipairs(players) do
		local target = GetPlayerPed(value)
		if(target ~= ply) then
			local targetCoords = GetEntityCoords(GetPlayerPed(value), 0)
			local distance = Vdist(targetCoords["x"], targetCoords["y"], targetCoords["z"], plyCoords["x"], plyCoords["y"], plyCoords["z"])
			if(closestDistance == -1 or closestDistance > distance) then
				closestPlayer = value
				closestDistance = distance
			end
		end
	end
	
	return closestPlayer, closestDistance
end

function drawNotification(text)
	SetNotificationTextEntry("STRING")
	AddTextComponentString(text)
	DrawNotification(false, false)
end

-------------------------------------]

---------------- LEO Functions ----------------

function GetPlayers()
    local players = {}

    for i = 0, 255 do
        if NetworkIsPlayerActive(i) then
            table.insert(players, i)
        end
    end

    return players
end

function GetClosestPlayer()
	local players = GetPlayers()
	local closestDistance = -1
	local closestPlayer = -1
	local ply = GetPlayerPed(-1)
	local plyCoords = GetEntityCoords(ply, 0)

	for index,value in ipairs(players) do
		local target = GetPlayerPed(value)
		if(target ~= ply) then
			local targetCoords = GetEntityCoords(GetPlayerPed(value), 0)
			local distance = Vdist(targetCoords["x"], targetCoords["y"], targetCoords["z"], plyCoords["x"], plyCoords["y"], plyCoords["z"])
			if(closestDistance == -1 or closestDistance > distance) then
				closestPlayer = value
				closestDistance = distance
			end
		end
	end

	return closestPlayer, closestDistance
end

RegisterNetEvent('cuff')
AddEventHandler('cuff',function()
	closest, distance = GetClosestPlayer()
	if distance ~= -1 and distance < 2 then
		local closestID = GetPlayerServerId(closest)
		TriggerServerEvent("cuffServer", GetPlayerServerId(t))
	else
    	ShowNotification("~r~ ERROR: ~w~There is no nearby player to cuff")
	end
end)

RegisterNetEvent('uncuff')
AddEventHandler('uncuff',function()
	closest, distance = GetClosestPlayer()
	if distance ~= -1 and distance < 2 then
		local closestID = GetPlayerServerId(closest)
		TriggerServerEvent("unCuffServer", GetPlayerServerId(closestID))
	else
    	ShowNotification("~r~ ERROR: ~w~There is no nearby player to uncuff")
	end
end)

RegisterNetEvent('cuffClient')
AddEventHandler('cuffClient', function()
		closest, distance = GetClosestPlayer()
		if closest ~= nil and DoesEntityExist(GetPlayerPed(closest)) then
			if distance ~= -1 and distance < 3 then
				ShowNotification("~g~ SUCCESS: ~w~You have cuffed("..GetPlayerName(closest)..")")
				local closestID = GetPlayerServerId(closest)
				TriggerServerEvent('cuffServer', closestID)
			else
				ShowNotification("~r~ ERROR: ~w~There is no nearby player to Cuff!")
		end
	end
end)

RegisterNetEvent('unCuffClient')
AddEventHandler('unCuffClient', function()
		closest, distance = GetClosestPlayer()
		if closest ~= nil and DoesEntityExist(GetPlayerPed(closest)) then
			if distance ~= -1 and distance < 3 then
				drawNotification('~g~SUCCESS: ~w~You uncuffed the nearest player.  (' .. GetPlayerName(closest) .. ')')
				local closestID = GetPlayerServerId(closest)
				TriggerServerEvent('unCuffServer', closestID)
				else
					ShowNotification("~r~ ERROR: ~w~There is no nearby player to Uncuff!")	
			
		end
	end
end)

RegisterNetEvent('dragp')
AddEventHandler('dragp', function(source)
		closest, distance = GetClosestPlayer()
		if closest ~= nil and DoesEntityExist(GetPlayerPed(closest)) then
			if distance ~= -1 and distance < 3 then
				local closestID = GetPlayerServerId(closest)
				local pP = GetPlayerPed(-1)
				drawNotification('~g~SUCCESS: ~w~You are dragging the nearest player.  (' .. GetPlayerName(closest) .. ')')
				TriggerServerEvent('dragServer', closestID)
			else
				drawNotification('~r~ERROR: ~w~No player nearby able to drag!')
		end
	end
end)

RegisterNetEvent('undragp')
AddEventHandler('undragp', function()
		closest, distance = GetClosestPlayer()
		if closest ~= nil and DoesEntityExist(GetPlayerPed(closest)) then
			if distance ~= -1 and distance < 3 then
			drawNotification('~g~SUCCESS: ~w~You are no longer dragging the nearest player.  (' .. GetPlayerName(closest) .. ')')
				local closestID = GetPlayerServerId(closest)
				TriggerServerEvent('unDragServer', closestID)
			else
				TriggerEvent('chatMessage', 'Toolbox', {255, 255, 255}, 'Nearest player is too far away.')
		end
	end
end)

RegisterNetEvent('panicButtonSound', function()
	SendNUIMessage({
		playpanicbutton = true,
		panicbuttonvolume = volume
	})
end)

RegisterNetEvent('showIDClient')
AddEventHandler('showIDClient', function()
	TriggerEvent('chatMessage', 'ID', {255, 255, 255}, GetPlayerName(sourceID) .. ' has showed you their ID.')
end)

-- Functions
function GetPlayers()
    local players = {}

    for i = 0, 255 do
        if NetworkIsPlayerActive(i) then
            table.insert(players, i)
        end
    end

    return players
end

function GetClosestPlayer()
    local players = GetPlayers()
    local closestDistance = -1
    local closestPlayer = -1
    local ply = GetPlayerPed(-1)
    local plyCoords = GetEntityCoords(ply, 0)

    for index,value in ipairs(players) do
        local target = GetPlayerPed(value)
        if(target ~= ply) then
            local targetCoords = GetEntityCoords(GetPlayerPed(value), 0)
            local distance = GetDistanceBetweenCoords(targetCoords['x'], targetCoords['y'], targetCoords['z'], plyCoords['x'], plyCoords['y'], plyCoords['z'], true)
            if(closestDistance == -1 or closestDistance > distance) then
                closestPlayer = value
                closestDistance = distance
            end
        end
    end

    return closestPlayer, closestDistance
end


-- Events
RegisterNetEvent('rpname')
AddEventHandler('rpname', function()
	_menuPool:CloseAllMenus()
	local id = KeyboardInput('Roleplay Name', '', 120)
end)

function KeyboardInput(TextEntry, ExampleText, MaxStringLenght)
    AddTextEntry('FMMC_KEY_TIP1', TextEntry .. ':')
    DisplayOnscreenKeyboard(1, 'FMMC_KEY_TIP1', '', ExampleText, '', '', '', MaxStringLenght)
    blockinput = true

    while UpdateOnscreenKeyboard() ~= 1 and UpdateOnscreenKeyboard() ~= 2 do
        Citizen.Wait(0)
    end
        
    if UpdateOnscreenKeyboard() ~= 2 then
        local result = GetOnscreenKeyboardResult()
        Citizen.Wait(500)
        blockinput = false
        return result
    else
        Citizen.Wait(500)
        blockinput = false
        return nil
    end
end

RegisterNetEvent('rpnameshow')
AddEventHandler('rpnameshow', function()
    closest = GetClosestPlayer()
    if closest ~= nil and DoesEntityExist(GetPlayerPed(closest)) then
		local closestID = GetPlayerServerId(closest)
		TriggerEvent('chatMessage', -1, 'ID', {255, 255, 255}, 'Name: ' .. result)

		else
		DrawNotification('~r~ERROR: ~w~No one nearby to show your id!')
    end
end)

function getEntityPlayerAimingAt(player)
	local result, target = GetEntityPlayerIsFreeAimingAt(player)
	return target
end

-- [Credit to Monty Piper]

local hwaycop = GetHashKey("s_m_y_hwaycop_01")
local cop = GetHashKey("s_m_y_cop_01")
local sheriff = GetHashKey("s_m_y_sheriff_01")
local fireman = GetHashKey("s_m_y_fireman_01")
local medic = GetHashKey("s_m_m_paramedic_01")


hat = false

  RegisterNetEvent( 'haton' )
AddEventHandler( 'haton', function()
	hat = not hat
	if(GetEntityModel(PlayerPedId()) == hwaycop) then
		if hat then
			SetPedPropIndex(PlayerPedId(), 0, 01, 0, 2)
		else
			ClearPedProp(PlayerPedId(), 0)
		end
	elseif(GetEntityModel(PlayerPedId()) == cop) then
		if hat then
			SetPedPropIndex(PlayerPedId(), 0, 0, 0, 2)
		else
			ClearPedProp(PlayerPedId(), 0)
		end
	elseif(GetEntityModel(PlayerPedId()) == sheriff) then
		if hat then
			SetPedPropIndex(PlayerPedId(), 0, 0, 0, 2)
		else
			ClearPedProp(PlayerPedId(), 0)
		end
	elseif (GetEntityModel(PlayerPedId()) == fireman) then
		if hat then
			SetPedPropIndex(PlayerPedId(), 0, 0, 0, 2)
		else
			ClearPedProp(PlayerPedId(), 0)
		end
	elseif (GetEntityModel(PlayerPedId()) == medic) then
		if hat then
			SetPedPropIndex(PlayerPedId(), 0, 0, 0, 2)
		else
			ClearPedProp(PlayerPedId(), 0)
		end
	end
end)

vest = false
	RegisterNetEvent('veston')
AddEventHandler('veston', function()
	vest = not vest
	if (GetEntityModel(PlayerPedId()) == hwaycop) then
		if vest then
			SetPedComponentVariation(PlayerPedId(), 8, 1, 1, 1)
		else
			SetPedDefaultComponentVariation(PlayerPedId())
		end
	elseif (GetEntityModel(PlayerPedId()) == cop) then
		if vest then
			SetPedComponentVariation(PlayerPedId(), 9, 2, 0, 1)
		else
			SetPedDefaultComponentVariation(PlayerPedId())
		end
	elseif (GetEntityModel(PlayerPedId()) == sheriff) then
		if vest then
			SetPedComponentVariation(PlayerPedId(), 9, 2, 0, 1)
		else
			SetPedDefaultComponentVariation(PlayerPedId())
		end
	end
end)

mask = false

  RegisterNetEvent( 'maskon' )
AddEventHandler( 'maskon', function()
	    if (GetEntityModel(PlayerPedId()) == fireman) then
		mask = not mask
		if mask then
			SetPedComponentVariation(PlayerPedId(), 8, 1, 1, 1)
			SetPlayerInvincible(PlayerPedId(), true)
		else
			SetPedDefaultComponentVariation(PlayerPedId())
			SetPlayerInvincible(PlayerPedId(), false)
		end
	end
end)

gloves = false

  RegisterNetEvent( 'gloveson')
AddEventHandler( 'gloveson', function()
	if (GetEntityModel(PlayerPedId()) == medic) then
		gloves = not gloves
		if gloves then
			SetPedComponentVariation(PlayerPedId(), 5, 1, 0, 1)
		else
			SetPedDefaultComponentVariation(PlayerPedId())
		end
	end
end)

vest = false
	RegisterNetEvent('veston')
AddEventHandler('veston', function()
	vest = not vest
	if (GetEntityModel(PlayerPedId()) == hwaycop) then
		if vest then
			SetPedComponentVariation(PlayerPedId(), 8, 1, 1, 1)
		else
			SetPedDefaultComponentVariation(PlayerPedId())
		end
	elseif (GetEntityModel(PlayerPedId()) == cop) then
		if vest then
			SetPedComponentVariation(PlayerPedId(), 9, 2, 0, 1)
		else
			SetPedDefaultComponentVariation(PlayerPedId())
		end
	elseif (GetEntityModel(PlayerPedId()) == sheriff) then
		if vest then
			SetPedComponentVariation(PlayerPedId(), 9, 2, 0, 1)
		else
			SetPedDefaultComponentVariation(PlayerPedId())
		end
	end
end)

glasses = false

  RegisterNetEvent( 'glasseson' )
AddEventHandler( 'glasseson', function()
	glasses = not glasses
	if(GetEntityModel(PlayerPedId()) == hwaycop) then
		if glasses then
			SetPedPropIndex(PlayerPedId(), 1, 0, 1, 2)
		else
			ClearPedProp(PlayerPedId(), 1)
		end
	elseif(GetEntityModel(PlayerPedId()) == cop) then
		if glasses then
			SetPedPropIndex(PlayerPedId(), 1, 0, 0, 2)
		else
			ClearPedProp(PlayerPedId(), 1)
		end
	elseif(GetEntityModel(PlayerPedId()) == sheriff) then
		if glasses then
			SetPedPropIndex(PlayerPedId(), 1, 1, 0, 2)
		else
			ClearPedProp(PlayerPedId(), 1)
		end
	elseif(GetEntityModel(PlayerPedId()) == medic) then
		if glasses then
			SetPedPropIndex(PlayerPedId(), 1, 0, 0, 2)
		else
			ClearPedProp(PlayerPedId(), 1)
		end
	end
end)

-- [Credit to Monty Piper]

---------------- LEO Functions ----------------

------------------------------------------------------------------------------------------------------------------------------------------------------------------

-- Trunk

RegisterNetEvent( 'openTrunk' )
AddEventHandler( 'openTrunk', function()

    local ped = PlayerPedId()
    local veh = GetVehiclePedIsIn(ped, false)
    if veh ~= nil and veh ~= 0 and veh ~= 1 then
        if GetVehicleDoorAngleRatio(veh, 5) > 0 then
            SetVehicleDoorShut(veh, 5, false)
			drawNotification("~w~You closed your trunk.")
        else
            SetVehicleDoorOpen(veh, 5, false, false)
			drawNotification("~w~You opened your trunk.")
        end
    end
end)

-- Hood


RegisterNetEvent( 'openHood' )
AddEventHandler( 'openHood', function()

    local ped = PlayerPedId()
    local veh = GetVehiclePedIsIn(ped, false)
    if veh ~= nil and veh ~= 0 and veh ~= 1 then
        if GetVehicleDoorAngleRatio(veh, 4) > 0 then
            SetVehicleDoorShut(veh, 4, false)
			drawNotification("~w~You closed your hood.")
        else
            SetVehicleDoorOpen(veh, 4, false, false)
			drawNotification("~w~You opened your hood.")
        end
    end
end)

RegisterNetEvent( 'frontLeft' )
AddEventHandler( 'frontLeft', function()

    local ped = PlayerPedId()
    local veh = GetVehiclePedIsIn(ped, false)
    if veh ~= nil and veh ~= 0 and veh ~= 1 then
        if GetVehicleDoorAngleRatio(veh, 0) > 0 then
            SetVehicleDoorShut(veh, 0, false)
			drawNotification("~w~You closed the front left door.")
        else
            SetVehicleDoorOpen(veh, 0, false, false)
			drawNotification("~w~You opened the front left door.")
        end
    end
end)

RegisterNetEvent( 'frontRight' )
AddEventHandler( 'frontRight', function()

    local ped = PlayerPedId()
    local veh = GetVehiclePedIsIn(ped, false)
    if veh ~= nil and veh ~= 0 and veh ~= 1 then
        if GetVehicleDoorAngleRatio(veh, 1) > 0 then
            SetVehicleDoorShut(veh, 1, false)
			drawNotification("~w~You closed the front right door.")
        else
            SetVehicleDoorOpen(veh, 1, false, false)
			drawNotification("~w~You opened the front right door.")
        end
    end
end)

RegisterNetEvent( 'rearLeft' )
AddEventHandler( 'rearLeft', function()

    local ped = PlayerPedId()
    local veh = GetVehiclePedIsIn(ped, false)
    if veh ~= nil and veh ~= 0 and veh ~= 1 then
        if GetVehicleDoorAngleRatio(veh, 2) > 0 then
            SetVehicleDoorShut(veh, 2, false)
			drawNotification("~w~You closed the rear left door.")
        else
            SetVehicleDoorOpen(veh, 2, false, false)
			drawNotification("~w~You opened the rear left door.")
        end
    end
end)

RegisterNetEvent( 'rearRight' )
AddEventHandler( 'rearRight', function()

    local ped = PlayerPedId()
    local veh = GetVehiclePedIsIn(ped, false)
    if veh ~= nil and veh ~= 0 and veh ~= 1 then
        if GetVehicleDoorAngleRatio(veh, 3) > 0 then
            SetVehicleDoorShut(veh, 3, false)
			drawNotification("~w~You closed the rear right door.")
        else
            SetVehicleDoorOpen(veh, 3, false, false)
			drawNotification("~w~You opened the rear right door.")
        end
    end
end)

-- [Adverts]

-- ADVERTISMENTS
RegisterNetEvent("ad1")
AddEventHandler("ad1",function()
		DisplayOnscreenKeyboard(false, "FMMC_KEY_TIP8", "", "", "", "", "", 60)
		local input = true
		Citizen.CreateThread(function()
		while input do
		if input == true then
		HideHudAndRadarThisFrame()
		if UpdateOnscreenKeyboard() == 3 then
		input = false
		elseif UpdateOnscreenKeyboard() == 1 then
		local inputText = GetOnscreenKeyboardResult()
		if string.len(inputText) > 0 then
		TriggerServerEvent('syncad1', inputText)
		input = false
		else
			DisplayOnscreenKeyboard(false, "FMMC_KEY_TIP8", "", "", "", "", "", 60)
		end
		elseif UpdateOnscreenKeyboard() == 2 then
		input = false
		end
		end
		 Citizen.Wait(0)
		 end


end)
end)

RegisterNetEvent('displayad1')
AddEventHandler('displayad1',function(inputText)

SetNotificationTextEntry("STRING");
AddTextComponentString(inputText);
SetNotificationMessage("CHAR_FLOYD", "247", true, 1, "~y~24/7 Store~s~", "Phone Notification");
DrawNotification(false, true);

end)

--
RegisterNetEvent("ad2")
AddEventHandler("ad2",function()
		DisplayOnscreenKeyboard(false, "FMMC_KEY_TIP8", "", "", "", "", "", 60)
		local input = true
		Citizen.CreateThread(function()
		while input do
		if input == true then
		HideHudAndRadarThisFrame()
		if UpdateOnscreenKeyboard() == 3 then
		input = false
		elseif UpdateOnscreenKeyboard() == 1 then
		local inputText = GetOnscreenKeyboardResult()
		if string.len(inputText) > 0 then
		TriggerServerEvent('syncad2', inputText)
		input = false
		else
			DisplayOnscreenKeyboard(false, "FMMC_KEY_TIP8", "", "", "", "", "", 60)
		end
		elseif UpdateOnscreenKeyboard() == 2 then
		input = false
		end
		end
		 Citizen.Wait(0)
		 end


end)
end)

RegisterNetEvent('displayad2')
AddEventHandler('displayad2',function(inputText)

SetNotificationTextEntry("STRING");
AddTextComponentString(inputText);
SetNotificationMessage("CHAR_AMMUNATION", "CHAR_AMMUNATION", true, 1, "~y~Ammunation~s~", "Phone Notification");
DrawNotification(false, true);

end)
--
RegisterNetEvent("ad3")
AddEventHandler("ad3",function()
		DisplayOnscreenKeyboard(false, "FMMC_KEY_TIP8", "", "", "", "", "", 60)
		local input = true
		Citizen.CreateThread(function()
		while input do
		if input == true then
		HideHudAndRadarThisFrame()
		if UpdateOnscreenKeyboard() == 3 then
		input = false
		elseif UpdateOnscreenKeyboard() == 1 then
		local inputText = GetOnscreenKeyboardResult()
		if string.len(inputText) > 0 then
		TriggerServerEvent('syncad3', inputText)
		input = false
		else
			DisplayOnscreenKeyboard(false, "FMMC_KEY_TIP8", "", "", "", "", "", 60)
		end
		elseif UpdateOnscreenKeyboard() == 2 then
		input = false
		end
		end
		 Citizen.Wait(0)
		 end


end)
end)

RegisterNetEvent('displayad3')
AddEventHandler('displayad3',function(inputText)

SetNotificationTextEntry("STRING");
AddTextComponentString(inputText);
SetNotificationMessage("CHAR_FLOYD", "NEWS", true, 1, "~y~Weazel News~s~", "Phone Notification");
DrawNotification(false, true);

end)
--
RegisterNetEvent("ad4")
AddEventHandler("ad4",function()
		DisplayOnscreenKeyboard(false, "FMMC_KEY_TIP8", "", "", "", "", "", 60)
		local input = true
		Citizen.CreateThread(function()
		while input do
		if input == true then
		HideHudAndRadarThisFrame()
		if UpdateOnscreenKeyboard() == 3 then
		input = false
		elseif UpdateOnscreenKeyboard() == 1 then
		local inputText = GetOnscreenKeyboardResult()
		if string.len(inputText) > 0 then
		TriggerServerEvent('syncad4', inputText)
		input = false
		else
			DisplayOnscreenKeyboard(false, "FMMC_KEY_TIP8", "", "", "", "", "", 60)
		end
		elseif UpdateOnscreenKeyboard() == 2 then
		input = false
		end
		end
		 Citizen.Wait(0)
		 end


end)
end)

RegisterNetEvent('displayad4')
AddEventHandler('displayad4',function(inputText)

SetNotificationTextEntry("STRING");
AddTextComponentString(inputText);
SetNotificationMessage("CHAR_MP_STRIPCLUB_PR", "CHAR_MP_STRIPCLUB_PR", true, 1, "~y~Vanilla Unicorn~s~", "Phone Notification");
DrawNotification(false, true);

end)
--
RegisterNetEvent("ad5")
AddEventHandler("ad5",function()
		DisplayOnscreenKeyboard(false, "FMMC_KEY_TIP8", "", "", "", "", "", 60)
		local input = true
		Citizen.CreateThread(function()
		while input do
		if input == true then
		HideHudAndRadarThisFrame()
		if UpdateOnscreenKeyboard() == 3 then
		input = false
		elseif UpdateOnscreenKeyboard() == 1 then
		local inputText = GetOnscreenKeyboardResult()
		if string.len(inputText) > 0 then
		TriggerServerEvent('syncad5', inputText)
		input = false
		else
			DisplayOnscreenKeyboard(false, "FMMC_KEY_TIP8", "", "", "", "", "", 60)
		end
		elseif UpdateOnscreenKeyboard() == 2 then
		input = false
		end
		end
		 Citizen.Wait(0)
		 end


end)
end)

RegisterNetEvent('displayad5')
AddEventHandler('displayad5',function(inputText)

SetNotificationTextEntry("STRING");
AddTextComponentString(inputText);
SetNotificationMessage("CHAR_TAXI", "CHAR_TAXI", true, 1, "~y~Downtown Cab Co.~s~", "Phone Notification");
DrawNotification(false, true);

end)
--
RegisterNetEvent("ad6")
AddEventHandler("ad6",function()
		DisplayOnscreenKeyboard(false, "FMMC_KEY_TIP8", "", "", "", "", "", 60)
		local input = true
		Citizen.CreateThread(function()
		while input do
		if input == true then
		HideHudAndRadarThisFrame()
		if UpdateOnscreenKeyboard() == 3 then
		input = false
		elseif UpdateOnscreenKeyboard() == 1 then
		local inputText = GetOnscreenKeyboardResult()
		if string.len(inputText) > 0 then
		TriggerServerEvent('syncad6', inputText)
		input = false
		else
			DisplayOnscreenKeyboard(false, "FMMC_KEY_TIP8", "", "", "", "", "", 60)
		end
		elseif UpdateOnscreenKeyboard() == 2 then
		input = false
		end
		end
		 Citizen.Wait(0)
		 end


end)
end)

RegisterNetEvent('displayad6')
AddEventHandler('displayad6',function(inputText)

SetNotificationTextEntry("STRING");
AddTextComponentString(inputText);
SetNotificationMessage("CHAR_LS_TOURIST_BOARD", "CHAR_LS_TOURIST_BOARD", true, 1, "~y~Los Santos Traffic Info~s~", "Phone Notification");
DrawNotification(false, true);

end)
--
RegisterNetEvent("ad7")
AddEventHandler("ad7",function()
		DisplayOnscreenKeyboard(false, "FMMC_KEY_TIP8", "", "", "", "", "", 60)
		local input = true
		Citizen.CreateThread(function()
		while input do
		if input == true then
		HideHudAndRadarThisFrame()
		if UpdateOnscreenKeyboard() == 3 then
		input = false
		elseif UpdateOnscreenKeyboard() == 1 then
		local inputText = GetOnscreenKeyboardResult()
		if string.len(inputText) > 0 then
		TriggerServerEvent('syncad7', inputText)
		input = false
		else
			DisplayOnscreenKeyboard(false, "FMMC_KEY_TIP8", "", "", "", "", "", 60)
		end
		elseif UpdateOnscreenKeyboard() == 2 then
		input = false
		end
		end
		 Citizen.Wait(0)
		 end


end)
end)

RegisterNetEvent('displayad7')
AddEventHandler('displayad7',function(inputText)

SetNotificationTextEntry("STRING");
AddTextComponentString(inputText);
SetNotificationMessage("CHAR_LS_CUSTOMS", "CHAR_LS_CUSTOMS", true, 1, "~y~Los Santos Customs~s~", "Phone Notification");
DrawNotification(false, true);

end)

--
RegisterNetEvent("ad8")
AddEventHandler("ad8",function()
		DisplayOnscreenKeyboard(false, "FMMC_KEY_TIP8", "", "", "", "", "", 60)
		local input = true
		Citizen.CreateThread(function()
		while input do
		if input == true then
		HideHudAndRadarThisFrame()
		if UpdateOnscreenKeyboard() == 3 then
		input = false
		elseif UpdateOnscreenKeyboard() == 1 then
		local inputText = GetOnscreenKeyboardResult()
		if string.len(inputText) > 0 then
		TriggerServerEvent('syncad8', inputText)
		input = false
		else
			DisplayOnscreenKeyboard(false, "FMMC_KEY_TIP8", "", "", "", "", "", 60)
		end
		elseif UpdateOnscreenKeyboard() == 2 then
		input = false
		end
		end
		 Citizen.Wait(0)
		 end


end)
end)

RegisterNetEvent('displayad8')
AddEventHandler('displayad8',function(inputText)

SetNotificationTextEntry("STRING");
AddTextComponentString(inputText);
SetNotificationMessage("CHAR_FLOYD", "ACE", true, 1, "~y~Ace Liquor~s~", "Phone Notification");
DrawNotification(false, true);

end)
--
RegisterNetEvent("ad9")
AddEventHandler("ad9",function()
		DisplayOnscreenKeyboard(false, "FMMC_KEY_TIP8", "", "", "", "", "", 60)
		local input = true
		Citizen.CreateThread(function()
		while input do
		if input == true then
		HideHudAndRadarThisFrame()
		if UpdateOnscreenKeyboard() == 3 then
		input = false
		elseif UpdateOnscreenKeyboard() == 1 then
		local inputText = GetOnscreenKeyboardResult()
		if string.len(inputText) > 0 then
		TriggerServerEvent('syncad9', inputText)
		input = false
		else
			DisplayOnscreenKeyboard(false, "FMMC_KEY_TIP8", "", "", "", "", "", 60)
		end
		elseif UpdateOnscreenKeyboard() == 2 then
		input = false
		end
		end
		 Citizen.Wait(0)
		 end


end)
end)

RegisterNetEvent('displayad9')
AddEventHandler('displayad9',function(inputText)

SetNotificationTextEntry("STRING");
AddTextComponentString(inputText);
SetNotificationMessage("CHAR_FLOYD", "LTD", true, 1, "~y~Limited Gasoline~s~", "Phone Notification");
DrawNotification(false, true);

end)
--
RegisterNetEvent("ad10")
AddEventHandler("ad10",function()
		DisplayOnscreenKeyboard(false, "FMMC_KEY_TIP8", "", "", "", "", "", 60)
		local input = true
		Citizen.CreateThread(function()
		while input do
		if input == true then
		HideHudAndRadarThisFrame()
		if UpdateOnscreenKeyboard() == 3 then
		input = false
		elseif UpdateOnscreenKeyboard() == 1 then
		local inputText = GetOnscreenKeyboardResult()
		if string.len(inputText) > 0 then
		TriggerServerEvent('syncad10', inputText)
		input = false
		else
			DisplayOnscreenKeyboard(false, "FMMC_KEY_TIP8", "", "", "", "", "", 60)
		end
		elseif UpdateOnscreenKeyboard() == 2 then
		input = false
		end
		end
		 Citizen.Wait(0)
		 end


end)
end)

RegisterNetEvent('displayad10')
AddEventHandler('displayad10',function(inputText)

SetNotificationTextEntry("STRING");
AddTextComponentString(inputText);
SetNotificationMessage("CHAR_FLOYD", "POSTAL", true, 1, "~y~GoPostal~s~", "Phone Notification");
DrawNotification(false, true);

end)
--
RegisterNetEvent("ad11")
AddEventHandler("ad11",function()
		DisplayOnscreenKeyboard(false, "FMMC_KEY_TIP8", "", "", "", "", "", 60)
		local input = true
		Citizen.CreateThread(function()
		while input do
		if input == true then
		HideHudAndRadarThisFrame()
		if UpdateOnscreenKeyboard() == 3 then
		input = false
		elseif UpdateOnscreenKeyboard() == 1 then
		local inputText = GetOnscreenKeyboardResult()
		if string.len(inputText) > 0 then
		TriggerServerEvent('syncad11', inputText)
		input = false
		else
			DisplayOnscreenKeyboard(false, "FMMC_KEY_TIP8", "", "", "", "", "", 60)
		end
		elseif UpdateOnscreenKeyboard() == 2 then
		input = false
		end
		end
		 Citizen.Wait(0)
		 end


end)
end)

RegisterNetEvent('displayad11')
AddEventHandler('displayad11',function(inputText)

SetNotificationTextEntry("STRING");
AddTextComponentString(inputText);
SetNotificationMessage("CHAR_FLOYD", "NA", true, 1, "~y~Hayes Auto~s~", "Phone Notification");
DrawNotification(false, true);

end)
--
RegisterNetEvent("ad12")
AddEventHandler("ad12",function()
		DisplayOnscreenKeyboard(false, "FMMC_KEY_TIP8", "", "", "", "", "", 60)
		local input = true
		Citizen.CreateThread(function()
		while input do
		if input == true then
		HideHudAndRadarThisFrame()
		if UpdateOnscreenKeyboard() == 3 then
		input = false
		elseif UpdateOnscreenKeyboard() == 1 then
		local inputText = GetOnscreenKeyboardResult()
		if string.len(inputText) > 0 then
		TriggerServerEvent('syncad12', inputText)
		input = false
		else
			DisplayOnscreenKeyboard(false, "FMMC_KEY_TIP8", "", "", "", "", "", 60)
		end
		elseif UpdateOnscreenKeyboard() == 2 then
		input = false
		end
		end
		 Citizen.Wait(0)
		 end


end)
end)

RegisterNetEvent('displayad12')
AddEventHandler('displayad12',function(inputText)

SetNotificationTextEntry("STRING");
AddTextComponentString(inputText);
SetNotificationMessage("CHAR_FLOYD", "VAN", true, 1, "~y~Vangelico~s~", "Phone Notification");
DrawNotification(false, true);

end)
--
RegisterNetEvent("ad13")
AddEventHandler("ad13",function()
		DisplayOnscreenKeyboard(false, "FMMC_KEY_TIP8", "", "", "", "", "", 60)
		local input = true
		Citizen.CreateThread(function()
		while input do
		if input == true then
		HideHudAndRadarThisFrame()
		if UpdateOnscreenKeyboard() == 3 then
		input = false
		elseif UpdateOnscreenKeyboard() == 1 then
		local inputText = GetOnscreenKeyboardResult()
		if string.len(inputText) > 0 then
		TriggerServerEvent('syncad13', inputText)
		input = false
		else
			DisplayOnscreenKeyboard(false, "FMMC_KEY_TIP8", "", "", "", "", "", 60)
		end
		elseif UpdateOnscreenKeyboard() == 2 then
		input = false
		end
		end
		 Citizen.Wait(0)
		 end


end)
end)

RegisterNetEvent('displayad13')
AddEventHandler('displayad13',function(inputText)

SetNotificationTextEntry("STRING");
AddTextComponentString(inputText);
SetNotificationMessage("CHAR_FLOYD", "BELL", true, 1, "~y~Cluckin' Bell~s~", "Phone Notification");
DrawNotification(false, true);

end)
--
RegisterNetEvent("ad14")
AddEventHandler("ad14",function()
		DisplayOnscreenKeyboard(false, "FMMC_KEY_TIP8", "", "", "", "", "", 60)
		local input = true
		Citizen.CreateThread(function()
		while input do
		if input == true then
		HideHudAndRadarThisFrame()
		if UpdateOnscreenKeyboard() == 3 then
		input = false
		elseif UpdateOnscreenKeyboard() == 1 then
		local inputText = GetOnscreenKeyboardResult()
		if string.len(inputText) > 0 then
		TriggerServerEvent('syncad14', inputText)
		input = false
		else
			DisplayOnscreenKeyboard(false, "FMMC_KEY_TIP8", "", "", "", "", "", 60)
		end
		elseif UpdateOnscreenKeyboard() == 2 then
		input = false
		end
		end
		 Citizen.Wait(0)
		 end


end)
end)

RegisterNetEvent('displayad14')
AddEventHandler('displayad14',function(inputText)

SetNotificationTextEntry("STRING");
AddTextComponentString(inputText);
SetNotificationMessage("CHAR_FLOYD", "BUG", true, 1, "~y~Bugstars~s~", "Phone Notification");
DrawNotification(false, true);

end)
--
RegisterNetEvent("ad15")
AddEventHandler("ad15",function()
		DisplayOnscreenKeyboard(false, "FMMC_KEY_TIP8", "", "", "", "", "", 60)
		local input = true
		Citizen.CreateThread(function()
		while input do
		if input == true then
		HideHudAndRadarThisFrame()
		if UpdateOnscreenKeyboard() == 3 then
		input = false
		elseif UpdateOnscreenKeyboard() == 1 then
		local inputText = GetOnscreenKeyboardResult()
		if string.len(inputText) > 0 then
		TriggerServerEvent('syncad15', inputText)
		input = false
		else
			DisplayOnscreenKeyboard(false, "FMMC_KEY_TIP8", "", "", "", "", "", 60)
		end
		elseif UpdateOnscreenKeyboard() == 2 then
		input = false
		end
		end
		 Citizen.Wait(0)
		 end


end)
end)

RegisterNetEvent('displayad15')
AddEventHandler('displayad15',function(inputText)

SetNotificationTextEntry("STRING");
AddTextComponentString(inputText);
SetNotificationMessage("CHAR_BANK_FLEECA", "CHAR_BANK_FLEECA", true, 1, "~y~Fleeca Bank~s~", "Phone Notification");
DrawNotification(false, true);

end)
--
RegisterNetEvent("ad16")
AddEventHandler("ad16",function()
		DisplayOnscreenKeyboard(false, "FMMC_KEY_TIP8", "", "", "", "", "", 60)
		local input = true
		Citizen.CreateThread(function()
		while input do
		if input == true then
		HideHudAndRadarThisFrame()
		if UpdateOnscreenKeyboard() == 3 then
		input = false
		elseif UpdateOnscreenKeyboard() == 1 then
		local inputText = GetOnscreenKeyboardResult()
		if string.len(inputText) > 0 then
		TriggerServerEvent('syncad16', inputText)
		input = false
		else
			DisplayOnscreenKeyboard(false, "FMMC_KEY_TIP8", "", "", "", "", "", 60)
		end
		elseif UpdateOnscreenKeyboard() == 2 then
		input = false
		end
		end
		 Citizen.Wait(0)
		 end


end)
end)

RegisterNetEvent('displayad16')
AddEventHandler('displayad16',function(inputText)

SetNotificationTextEntry("STRING");
AddTextComponentString(inputText);
SetNotificationMessage("CHAR_FLOYD", "NA", true, 1, "~y~Echo Sechs~s~", "Phone Notification");
DrawNotification(false, true);

end)
--
RegisterNetEvent("ad17")
AddEventHandler("ad17",function()
		DisplayOnscreenKeyboard(false, "FMMC_KEY_TIP8", "", "", "", "", "", 60)
		local input = true
		Citizen.CreateThread(function()
		while input do
		if input == true then
		HideHudAndRadarThisFrame()
		if UpdateOnscreenKeyboard() == 3 then
		input = false
		elseif UpdateOnscreenKeyboard() == 1 then
		local inputText = GetOnscreenKeyboardResult()
		if string.len(inputText) > 0 then
		TriggerServerEvent('syncad17', inputText)
		input = false
		else
			DisplayOnscreenKeyboard(false, "FMMC_KEY_TIP8", "", "", "", "", "", 60)
		end
		elseif UpdateOnscreenKeyboard() == 2 then
		input = false
		end
		end
		 Citizen.Wait(0)
		 end


end)
end)

RegisterNetEvent('displayad17')
AddEventHandler('displayad17',function(inputText)

SetNotificationTextEntry("STRING");
AddTextComponentString(inputText);
SetNotificationMessage("CHAR_MP_MORS_MUTUAL", "CHAR_MP_MORS_MUTUAL", true, 1, "~y~Mors Mutual Insurance~s~", "Phone Notification");
DrawNotification(false, true);

end)
--
RegisterNetEvent("ad18")
AddEventHandler("ad18",function()
		DisplayOnscreenKeyboard(false, "FMMC_KEY_TIP8", "", "", "", "", "", 60)
		local input = true
		Citizen.CreateThread(function()
		while input do
		if input == true then
		HideHudAndRadarThisFrame()
		if UpdateOnscreenKeyboard() == 3 then
		input = false
		elseif UpdateOnscreenKeyboard() == 1 then
		local inputText = GetOnscreenKeyboardResult()
		if string.len(inputText) > 0 then
		TriggerServerEvent('syncad18', inputText)
		input = false
		else
			DisplayOnscreenKeyboard(false, "FMMC_KEY_TIP8", "", "", "", "", "", 60)
		end
		elseif UpdateOnscreenKeyboard() == 2 then
		input = false
		end
		end
		 Citizen.Wait(0)
		 end


end)
end)

RegisterNetEvent('displayad18')
AddEventHandler('displayad18',function(inputText)

SetNotificationTextEntry("STRING");
AddTextComponentString(inputText);
SetNotificationMessage("CHAR_FLOYD", "OP", true, 1, "~y~PostOP~s~", "Phone Notification");
DrawNotification(false, true);

end)
--
RegisterNetEvent("ad19")
AddEventHandler("ad19",function()
		DisplayOnscreenKeyboard(false, "FMMC_KEY_TIP8", "", "", "", "", "", 60)
		local input = true
		Citizen.CreateThread(function()
		while input do
		if input == true then
		HideHudAndRadarThisFrame()
		if UpdateOnscreenKeyboard() == 3 then
		input = false
		elseif UpdateOnscreenKeyboard() == 1 then
		local inputText = GetOnscreenKeyboardResult()
		if string.len(inputText) > 0 then
		TriggerServerEvent('syncad19', inputText)
		input = false
		else
			DisplayOnscreenKeyboard(false, "FMMC_KEY_TIP8", "", "", "", "", "", 60)
		end
		elseif UpdateOnscreenKeyboard() == 2 then
		input = false
		end
		end
		 Citizen.Wait(0)
		 end


end)
end)

RegisterNetEvent('displayad19')
AddEventHandler('displayad19',function(inputText)

SetNotificationTextEntry("STRING");
AddTextComponentString(inputText);
SetNotificationMessage("CHAR_FLOYD", "EXOTIC", true, 1, "~y~Auto Exotic~s~", "Phone Notification");
DrawNotification(false, true);

end)
--
RegisterNetEvent("ad20")
AddEventHandler("ad20",function()
		DisplayOnscreenKeyboard(false, "FMMC_KEY_TIP8", "", "", "", "", "", 60)
		local input = true
		Citizen.CreateThread(function()
		while input do
		if input == true then
		HideHudAndRadarThisFrame()
		if UpdateOnscreenKeyboard() == 3 then
		input = false
		elseif UpdateOnscreenKeyboard() == 1 then
		local inputText = GetOnscreenKeyboardResult()
		if string.len(inputText) > 0 then
		TriggerServerEvent('syncad20', inputText)
		input = false
		else
			DisplayOnscreenKeyboard(false, "FMMC_KEY_TIP8", "", "", "", "", "", 60)
		end
		elseif UpdateOnscreenKeyboard() == 2 then
		input = false
		end
		end
		 Citizen.Wait(0)
		 end


end)
end)

RegisterNetEvent('displayad20')
AddEventHandler('displayad20',function(inputText)

SetNotificationTextEntry("STRING");
AddTextComponentString(inputText);
SetNotificationMessage("CHAR_FLOYD", "LSWP", true, 1, "~y~Los Santos Water and Power~s~", "Phone Notification");
DrawNotification(false, true);

end)
--
--
RegisterNetEvent("ad21")
AddEventHandler("ad21",function()
		DisplayOnscreenKeyboard(false, "FMMC_KEY_TIP8", "", "", "", "", "", 60)
		local input = true
		Citizen.CreateThread(function()
		while input do
		if input == true then
		HideHudAndRadarThisFrame()
		if UpdateOnscreenKeyboard() == 3 then
		input = false
		elseif UpdateOnscreenKeyboard() == 1 then
		local inputText = GetOnscreenKeyboardResult()
		if string.len(inputText) > 0 then
		TriggerServerEvent('syncad21', inputText)
		input = false
		else
			DisplayOnscreenKeyboard(false, "FMMC_KEY_TIP8", "", "", "", "", "", 60)
		end
		elseif UpdateOnscreenKeyboard() == 2 then
		input = false
		end
		end
		 Citizen.Wait(0)
		 end


end)
end)

RegisterNetEvent('displayad21')
AddEventHandler('displayad21',function(inputText)

SetNotificationTextEntry("STRING");
	AddTextComponentString(inputText);
		SetNotificationMessage("CHAR_FLOYD", "D8", true, 1, "~y~Dynasty 8~s~", "Phone Notification");
			DrawNotification(false, true);

end)

RegisterNetEvent("ad22")
AddEventHandler("ad22",function()
		DisplayOnscreenKeyboard(false, "FMMC_KEY_TIP8", "", "", "", "", "", 60)
		local input = true
		Citizen.CreateThread(function()
		while input do
		if input == true then
		HideHudAndRadarThisFrame()
		if UpdateOnscreenKeyboard() == 3 then
		input = false
		elseif UpdateOnscreenKeyboard() == 1 then
		local inputText = GetOnscreenKeyboardResult()
		if string.len(inputText) > 0 then
		TriggerServerEvent('syncad22', inputText)
		input = false
		else
			DisplayOnscreenKeyboard(false, "FMMC_KEY_TIP8", "", "", "", "", "", 60)
		end
		elseif UpdateOnscreenKeyboard() == 2 then
		input = false
		end
		end
		 Citizen.Wait(0)
		 end


	end)
end)

RegisterNetEvent('displayad22')
AddEventHandler('displayad22',function(inputText)

SetNotificationTextEntry("STRING");
AddTextComponentString(inputText);
SetNotificationMessage("CHAR_FLOYD", "UBER", true, 1, "~y~Uber~s~", "Phone Notification");
DrawNotification(false, true);

end)

-- END OF ADVERTISMENTS

-- [Outfits]

---------------- Engine Vehicle ----------------

function EngineToggle()

    local ped = GetPlayerPed(-1)
    local veh = GetVehiclePedIsIn(ped, false)
	
	if IsPedInAnyVehicle(ped) then
        if IsVehicleEngineOn(veh) then
            SetVehicleEngineOn(veh, false, false, true)
            SetVehicleUndriveable(veh, true)
		    drawNotification('~r~Your engine has been turned off.')
        else
            SetVehicleEngineOn(veh, true, false, true)
            SetVehicleUndriveable(veh, false)
		    drawNotification('~g~Your engine has been turned on.')
        end
	else
	    drawNotification('~r~You are not in a vehicle.')
	end
end

---------------- Engine Vehicle ----------------

---------------- Delete Vehicle ----------------

RegisterNetEvent( 'deleteVehicle' )

local distanceToCheck = 5.0

AddEventHandler( 'deleteVehicle', function()
    local ped = GetPlayerPed( -1 )

    if ( DoesEntityExist( ped ) and not IsEntityDead( ped ) ) then
        local pos = GetEntityCoords( ped )

        if ( IsPedSittingInAnyVehicle( ped ) ) then
            local vehicle = GetVehiclePedIsIn( ped, false )

            if ( GetPedInVehicleSeat( vehicle, -1 ) == ped ) then
                SetEntityAsMissionEntity( vehicle, true, true )
                deleteCar( vehicle )

                if ( DoesEntityExist( vehicle ) ) then
                	ShowNotification( "~r~Unable to delete vehicle, try again." )
                else
                	ShowNotification( "~g~Success: ~w~Vehicle deleted." )
                end
            else
                ShowNotification( "You must be in the driver's seat!" )
            end
        else
            local playerPos = GetEntityCoords( ped, 1 )
            local inFrontOfPlayer = GetOffsetFromEntityInWorldCoords( ped, 0.0, distanceToCheck, 0.0 )
            local vehicle = GetVehicleInDirection( playerPos, inFrontOfPlayer )

            if ( DoesEntityExist( vehicle ) ) then
                SetEntityAsMissionEntity( vehicle, true, true )
                deleteCar( vehicle )

                if ( DoesEntityExist( vehicle ) ) then
                	ShowNotification( "~r~Unable to delete vehicle, try again." )
                else
                	ShowNotification( "~g~Success: ~w~Vehicle deleted." )
                end
            else
                ShowNotification( "You must be in or near a vehicle to delete it." )
            end
        end
    end
end )

-- Delete car function borrowed from Mr.Scammer's model blacklist, thanks to him!
function deleteCar( entity )
    Citizen.InvokeNative( 0xEA386986E786A54F, Citizen.PointerValueIntInitialized( entity ) )
end

function GetVehicleInDirection( coordFrom, coordTo )
    local rayHandle = CastRayPointToPoint( coordFrom.x, coordFrom.y, coordFrom.z, coordTo.x, coordTo.y, coordTo.z, 10, GetPlayerPed( -1 ), 0 )
    local _, _, _, _, vehicle = GetRaycastResult( rayHandle )
    return vehicle
end

function ShowNotification( text )
    SetNotificationTextEntry( "STRING" )
    AddTextComponentString( text )
    DrawNotification( false, false )
end

-- Delete Vehicle End

---------------- Fix ----------------

---------------- Lock Lights ----------------

RegisterNetEvent('lockLights')
AddEventHandler('lockLights',function()
local vehicle = saveVehicle
	StartVehicleHorn(vehicle, 100, 1, false)
	SetVehicleLights(vehicle, 2)
	Wait (200)
	SetVehicleLights(vehicle, 0)
	StartVehicleHorn(vehicle, 100, 1, false)
	Wait (200)
	SetVehicleLights(vehicle, 2)
	Wait (400)
	SetVehicleLights(vehicle, 0)
end)

-- Civ Emotes Start  --

RegisterNetEvent('Smoke')
AddEventHandler('Smoke', function()

local emotePlaying = IsPedActiveInScenario(GetPlayerPed(-1))
local ped = GetPlayerPed( -1 )
    if ( DoesEntityExist( ped ) and not IsEntityDead( ped ) ) then
	TaskStartScenarioInPlace(PlayerPedId(), "WORLD_HUMAN_SMOKING", 0, true);
	Citizen.Wait(9999999000)
        ClearPedTasksImmediately(GetPlayerPed(-1))
    end
end )
--]]
RegisterNetEvent('Party')
AddEventHandler('Party', function()

local ped = GetPlayerPed( -1 )
    if ( DoesEntityExist( ped ) and not IsEntityDead( ped ) ) then
	TaskStartScenarioInPlace(PlayerPedId(), "WORLD_HUMAN_PARTYING", 0, true);
	Citizen.Wait(9999999000)
        ClearPedTasksImmediately(GetPlayerPed(-1))
    end
end )

RegisterNetEvent('Drink')
AddEventHandler('Drink', function()

local ped = GetPlayerPed( -1 )
    if ( DoesEntityExist( ped ) and not IsEntityDead( ped ) ) then
	TaskStartScenarioInPlace(PlayerPedId(), "WORLD_HUMAN_DRINKING", 0, true);
	Citizen.Wait(9999999000)
        ClearPedTasksImmediately(GetPlayerPed(-1))
    end
end )

RegisterNetEvent('Pushups')
AddEventHandler('Pushups', function()

local ped = GetPlayerPed( -1 )
    if ( DoesEntityExist( ped ) and not IsEntityDead( ped ) ) then
	TaskStartScenarioInPlace(PlayerPedId(), "WORLD_HUMAN_PUSH_UPS", 0, true);
	Citizen.Wait(9999999000)
        ClearPedTasksImmediately(GetPlayerPed(-1))
    end
end )

RegisterNetEvent('Phone')
AddEventHandler('Phone', function()

local ped = GetPlayerPed( -1 )
    if ( DoesEntityExist( ped ) and not IsEntityDead( ped ) ) then
	TaskStartScenarioInPlace(PlayerPedId(), "WORLD_HUMAN_STAND_MOBILE", 0, true);
	Citizen.Wait(9999999000)
        ClearPedTasksImmediately(GetPlayerPed(-1))
    end
end )

RegisterNetEvent('Injured')
AddEventHandler('Injured', function()

local ped = GetPlayerPed( -1 )
    if ( DoesEntityExist( ped ) and not IsEntityDead( ped ) ) then
	TaskStartScenarioInPlace(PlayerPedId(), "WORLD_HUMAN_SUNBATHE_BACK", 0, true);
	Citizen.Wait(9999999000)
        ClearPedTasksImmediately(GetPlayerPed(-1))
    end
end )

RegisterNetEvent('Weed')
AddEventHandler('Weed', function()

local ped = GetPlayerPed( -1 )
    if ( DoesEntityExist( ped ) and not IsEntityDead( ped ) ) then
	TaskStartScenarioInPlace(PlayerPedId(), "WORLD_HUMAN_SMOKING_POT", 0, true);
	Citizen.Wait(9999999000)
        ClearPedTasksImmediately(GetPlayerPed(-1))
    end
end )

RegisterNetEvent('Coffee')
AddEventHandler('Coffee', function()

local ped = GetPlayerPed( -1 )
    if ( DoesEntityExist( ped ) and not IsEntityDead( ped ) ) then
	TaskStartScenarioInPlace(PlayerPedId(), "WORLD_HUMAN_AA_COFFEE", 0, true);
	Citizen.Wait(9999999000)
        ClearPedTasksImmediately(GetPlayerPed(-1))
    end
end )

RegisterNetEvent('Photo')
AddEventHandler('Photo', function()

local ped = GetPlayerPed( -1 )
    if ( DoesEntityExist( ped ) and not IsEntityDead( ped ) ) then
	TaskStartScenarioInPlace(PlayerPedId(), "WORLD_HUMAN_PAPARAZZI", 0, true);
	Citizen.Wait(9999999000)
        ClearPedTasksImmediately(GetPlayerPed(-1))
    end
end )

RegisterNetEvent('Binoculars')
AddEventHandler('Binoculars', function()

local ped = GetPlayerPed( -1 )
    if ( DoesEntityExist( ped ) and not IsEntityDead( ped ) ) then
	TaskStartScenarioInPlace(PlayerPedId(), "WORLD_HUMAN_BINOCULARS", 0, true);
	Citizen.Wait(9999999000)
        ClearPedTasksImmediately(GetPlayerPed(-1))
    end
end )

RegisterNetEvent('Situps')
AddEventHandler('Situps', function()

local ped = GetPlayerPed( -1 )
    if ( DoesEntityExist( ped ) and not IsEntityDead( ped ) ) then
	TaskStartScenarioInPlace(PlayerPedId(), "WORLD_HUMAN_SIT_UPS", 0, true);
	Citizen.Wait(9999999000)
        ClearPedTasksImmediately(GetPlayerPed(-1))
    end
end )

RegisterNetEvent('Film')
AddEventHandler('Film', function()

local ped = GetPlayerPed( -1 )
    if ( DoesEntityExist( ped ) and not IsEntityDead( ped ) ) then
	TaskStartScenarioInPlace(PlayerPedId(), "WORLD_HUMAN_MOBILE_FILM_SHOCKING", 0, true);
	Citizen.Wait(9999999000)
        ClearPedTasksImmediately(GetPlayerPed(-1))
    end
end )

RegisterNetEvent('Weights')
AddEventHandler('Weights', function()

local ped = GetPlayerPed( -1 )
    if ( DoesEntityExist( ped ) and not IsEntityDead( ped ) ) then
	TaskStartScenarioInPlace(PlayerPedId(), "WORLD_HUMAN_MUSCLE_FREE_WEIGHTS", 0, true);
	Citizen.Wait(9999999000)
        ClearPedTasksImmediately(GetPlayerPed(-1))
    end
end )

RegisterNetEvent('Flex')
AddEventHandler('Flex', function()

local ped = GetPlayerPed( -1 )
    if ( DoesEntityExist( ped ) and not IsEntityDead( ped ) ) then
	TaskStartScenarioInPlace(PlayerPedId(), "WORLD_HUMAN_MUSCLE_FLEX", 0, true);
	Citizen.Wait(9999999000)
        ClearPedTasksImmediately(GetPlayerPed(-1))
    end
end )

-- Civ Emotes End --

-- Emote Cancel Functions

Citizen.CreateThread(function()
    while true do
    Citizen.Wait(0)
        if IsPedUsingScenario(GetPlayerPed(-1), "WORLD_HUMAN_SMOKING") and (IsControlPressed(0, 32) or IsControlPressed(0, 33) or IsControlPressed(0, 34) or IsControlPressed(0, 35)) then
        ClearPedTasks(GetPlayerPed(-1))
        end
    end
end)

Citizen.CreateThread(function()
    while true do
    Citizen.Wait(0)
        if IsPedUsingScenario(GetPlayerPed(-1), "WORLD_HUMAN_PARTYING") and (IsControlPressed(0, 32) or IsControlPressed(0, 33) or IsControlPressed(0, 34) or IsControlPressed(0, 35)) then
        ClearPedTasks(GetPlayerPed(-1))
        end
    end
end)

Citizen.CreateThread(function()
    while true do
    Citizen.Wait(0)
        if IsPedUsingScenario(GetPlayerPed(-1), "WORLD_HUMAN_PUSH_UPS") and (IsControlPressed(0, 32) or IsControlPressed(0, 33) or IsControlPressed(0, 34) or IsControlPressed(0, 35)) then
        ClearPedTasks(GetPlayerPed(-1))
        end
    end
end)

Citizen.CreateThread(function()
    while true do
    Citizen.Wait(0)
        if IsPedUsingScenario(GetPlayerPed(-1), "WORLD_HUMAN_STAND_MOBILE") and (IsControlPressed(0, 32) or IsControlPressed(0, 33) or IsControlPressed(0, 34) or IsControlPressed(0, 35)) then
        ClearPedTasks(GetPlayerPed(-1))
        end
    end
end)

Citizen.CreateThread(function()
    while true do
    Citizen.Wait(0)
        if IsPedUsingScenario(GetPlayerPed(-1), "WORLD_HUMAN_SUNBATHE_BACK") and (IsControlPressed(0, 32) or IsControlPressed(0, 33) or IsControlPressed(0, 34) or IsControlPressed(0, 35)) then
        ClearPedTasks(GetPlayerPed(-1))
        end
    end
end)

Citizen.CreateThread(function()
    while true do
    Citizen.Wait(0)
        if IsPedUsingScenario(GetPlayerPed(-1), "WORLD_HUMAN_SMOKING_POT") and (IsControlPressed(0, 32) or IsControlPressed(0, 33) or IsControlPressed(0, 34) or IsControlPressed(0, 35)) then
        ClearPedTasks(GetPlayerPed(-1))
        end
    end
end)

Citizen.CreateThread(function()
    while true do
    Citizen.Wait(0)
        if IsPedUsingScenario(GetPlayerPed(-1), "WORLD_HUMAN_AA_COFFEE") and (IsControlPressed(0, 32) or IsControlPressed(0, 33) or IsControlPressed(0, 34) or IsControlPressed(0, 35)) then
        ClearPedTasks(GetPlayerPed(-1))
        end
    end
end)

Citizen.CreateThread(function()
    while true do
    Citizen.Wait(0)
        if IsPedUsingScenario(GetPlayerPed(-1), "WORLD_HUMAN_PAPARAZZI") and (IsControlPressed(0, 32) or IsControlPressed(0, 33) or IsControlPressed(0, 34) or IsControlPressed(0, 35)) then
        ClearPedTasks(GetPlayerPed(-1))
        end
    end
end)

Citizen.CreateThread(function()
    while true do
    Citizen.Wait(0)
        if IsPedUsingScenario(GetPlayerPed(-1), "WORLD_HUMAN_BINOCULARS") and (IsControlPressed(0, 32) or IsControlPressed(0, 33) or IsControlPressed(0, 34) or IsControlPressed(0, 35)) then
        ClearPedTasks(GetPlayerPed(-1))
        end
    end
end)

Citizen.CreateThread(function()
    while true do
    Citizen.Wait(0)
        if IsPedUsingScenario(GetPlayerPed(-1), "WORLD_HUMAN_SIT_UPS") and (IsControlPressed(0, 32) or IsControlPressed(0, 33) or IsControlPressed(0, 34) or IsControlPressed(0, 35)) then
        ClearPedTasks(GetPlayerPed(-1))
        end
    end
end)

Citizen.CreateThread(function()
    while true do
    Citizen.Wait(0)
        if IsPedUsingScenario(GetPlayerPed(-1), "WORLD_HUMAN_MOBILE_FILM_SHOCKING") and (IsControlPressed(0, 32) or IsControlPressed(0, 33) or IsControlPressed(0, 34) or IsControlPressed(0, 35)) then
        ClearPedTasks(GetPlayerPed(-1))
        end
    end
end)

Citizen.CreateThread(function()
    while true do
    Citizen.Wait(0)
        if IsPedUsingScenario(GetPlayerPed(-1), "WORLD_HUMAN_MUSCLE_FREE_WEIGHTS") and (IsControlPressed(0, 32) or IsControlPressed(0, 33) or IsControlPressed(0, 34) or IsControlPressed(0, 35)) then
        ClearPedTasks(GetPlayerPed(-1))
        end
    end
end)

Citizen.CreateThread(function()
    while true do
    Citizen.Wait(0)
        if IsPedUsingScenario(GetPlayerPed(-1), "WORLD_HUMAN_MUSCLE_FLEX") and (IsControlPressed(0, 32) or IsControlPressed(0, 33) or IsControlPressed(0, 34) or IsControlPressed(0, 35)) then
        ClearPedTasks(GetPlayerPed(-1))
        end
    end
end)

Citizen.CreateThread(function()
    while true do
    Citizen.Wait(0)
        if IsPedUsingScenario(GetPlayerPed(-1), "WORLD_HUMAN_COP_IDLES") and (IsControlPressed(0, 32) or IsControlPressed(0, 33) or IsControlPressed(0, 34) or IsControlPressed(0, 35)) then
        ClearPedTasks(GetPlayerPed(-1))
        end
    end
end)

Citizen.CreateThread(function()
    while true do
    Citizen.Wait(0)
        if IsPedUsingScenario(GetPlayerPed(-1), "WORLD_HUMAN_GUARD_STAND") and (IsControlPressed(0, 32) or IsControlPressed(0, 33) or IsControlPressed(0, 34) or IsControlPressed(0, 35)) then
        ClearPedTasks(GetPlayerPed(-1))
        end
    end
end)

Citizen.CreateThread(function()
    while true do
    Citizen.Wait(0)
        if IsPedUsingScenario(GetPlayerPed(-1), "CODE_HUMAN_MEDIC_TIME_OF_DEATH") and (IsControlPressed(0, 32) or IsControlPressed(0, 33) or IsControlPressed(0, 34) or IsControlPressed(0, 35)) then
        ClearPedTasdwks(GetPlayerPed(-1))
        end
    end
end)

Citizen.CreateThread(function()
    while true do
    Citizen.Wait(0)
        if IsPedUsingScenario(GetPlayerPed(-1), "WORLD_HUMAN_CLIPBOARD") and (IsControlPressed(0, 32) or IsControlPressed(0, 33) or IsControlPressed(0, 34) or IsControlPressed(0, 35)) then
        ClearPedTasks(GetPlayerPed(-1))
        end
    end
end)

Citizen.CreateThread(function()
    while true do
    Citizen.Wait(0)
        if IsPedUsingScenario(GetPlayerPed(-1), "WORLD_HUMAN_WELDING") and (IsControlPressed(0, 32) or IsControlPressed(0, 33) or IsControlPressed(0, 34) or IsControlPressed(0, 35)) then
        ClearPedTasks(GetPlayerPed(-1))
        end
    end
end)

Citizen.CreateThread(function()
    while true do
    Citizen.Wait(0)
        if IsPedUsingScenario(GetPlayerPed(-1), "WORLD_HUMAN_CAR_PARK_ATTENDANT") and (IsControlPressed(0, 32) or IsControlPressed(0, 33) or IsControlPressed(0, 34) or IsControlPressed(0, 35)) then
        ClearPedTasks(GetPlayerPed(-1))
        end
    end
end)

Citizen.CreateThread(function()
    while true do
    Citizen.Wait(0)
        if IsPedUsingScenario(GetPlayerPed(-1), "CODE_HUMAN_MEDIC_KNEEL") and (IsControlPressed(0, 32) or IsControlPressed(0, 33) or IsControlPressed(0, 34) or IsControlPressed(0, 35)) then
        ClearPedTasks(GetPlayerPed(-1))
        end
    end
end)

-- Emote cancel? lol

function drawNotification(text) --Just Don't Edit!
    SetNotificationTextEntry("STRING")
    AddTextComponentString(text)
    DrawNotification(false, false)
end
 
function tablelength(T) --Just Don't Edit!
    local count = 0
    for _ in pairs(T) do count = count + 1 end
    return count
end
 
function table.contains(table, element)
  for _, value in pairs(table) do
    if value == element then
      return true
    end
  end
  return false
end

------------------------------- VEHICLE FIX -------------------------------
RegisterNetEvent("fixveh")
AddEventHandler("fixveh", function()
	local playerPed = GetPlayerPed(-1) -- gets the player ped
	if IsPedInAnyVehicle(playerPed) then -- checks if the player is in a car!
		local vehicle = GetVehiclePedIsIn(playerPed) -- gets the player's vehicle
		FreezeEntityPosition(GetVehiclePedIsUsing(GetPlayerPed(-1)), true) -- freezes it's position
		    Notification("~g~The mechanic's working on your car. It should take around 15 seconds to complete.") -- displays the notif
			Citizen.Wait(15000) -- waits 15 seconds!
		FreezeEntityPosition(GetVehiclePedIsUsing(GetPlayerPed(-1)), false) -- stops freezing the vehicle position
		SetVehicleEngineHealth(vehicle, 9999) -- sets the health to 999 (FIXED)
		SetVehiclePetrolTankHealth(vehicle, 9999) -- sets the fuel tank health to 999 (FIXED)
		SetVehicleFixed(vehicle) -- sets the vehicle as fixed
		    Notification("~g~Your vehicle has been fixed.") -- notifies the player that it's fixed
	else -- or if the player isn't in a vehicle then do
		Notification("~g~You are not in a vehicle.") -- display the notification
	end -- end function
end) -- end function

function Notification(msg)
	SetNotificationTextEntry("STRING")
	AddTextComponentString(msg)
	DrawNotification(false, false)
end

-- notification
function ShowNotification(text)
    SetNotificationTextEntry("STRING")
    AddTextComponentString(text)
    DrawNotification(false, false)
end

local spikes_deployed = false
local obj1 = nil
local obj2 = nil
local obj3 = nil
Citizen.CreateThread(function()
    while true do
        Citizen.Wait(10)
        if spikes_deployed then
            for peeps = 0, 64 do
                if NetworkIsPlayerActive(GetPlayerFromServerId(peeps)) then
                    
                    local currentVeh = GetVehiclePedIsIn(GetPlayerPed(GetPlayerFromServerId(peeps)), false)
                    if currentVeh ~= nil and currentVeh ~= false then
                        local currentVehcoords = GetEntityCoords(currentVeh, true)
                        local obj1coords = GetEntityCoords(obj1, true)
                        local obj2coords = GetEntityCoords(obj2, true)
                        local obj3coords = GetEntityCoords(obj3, true)
                        local DistanceBetweenObj1 = Vdist(obj1coords['x'], obj1coords['y'], obj1coords['z'], currentVehcoords['x'], currentVehcoords['y'], currentVehcoords['z'])
                        local DistanceBetweenObj2 = Vdist(obj2coords['x'], obj2coords['y'], obj2coords['z'], currentVehcoords['x'], currentVehcoords['y'], currentVehcoords['z'])
                        local DistanceBetweenObj3 = Vdist(obj3coords['x'], obj3coords['y'], obj3coords['z'], currentVehcoords['x'], currentVehcoords['y'], currentVehcoords['z'])
                        if DistanceBetweenObj1 < 2.2 or DistanceBetweenObj2 < 2.2 or DistanceBetweenObj3 < 2.2 then
                            
							TriggerServerEvent("police:spikes", currentVeh, peeps)
                        end
                    end
                end
            end
        end
    end
end)

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)
        if spikes_deployed then
        	local obj1coords = GetEntityCoords(obj1, true)
			if GetDistanceBetweenCoords(GetEntityCoords(GetPlayerPed(-1)), obj1coords.x, obj1coords.y, obj1coords.z, true) > 100 then -- if the player is too far from his Spikes
           		SetEntityAsMissionEntity(obj1, false, false)
           		SetEntityAsMissionEntity(obj2, false, false)
           		SetEntityAsMissionEntity(obj3, false, false)
           		SetEntityVisible(obj1, false)
           		SetEntityVisible(obj2, false)
           		SetEntityVisible(obj3, false)
           		DeleteObject(obj1)
           		DeleteObject(obj2)
           		DeleteObject(obj3)
                DeleteEntity(obj1)
                DeleteEntity(obj2)
                DeleteEntity(obj3)
                obj1 = nil
                obj2 = nil
                obj3 = nil
                exports.pNotify:SendNotification({text = "Removing spikes! (D>100)",type = "error",queue = "left",timeout = 3000,layout = "centerRight"})
                spikes_deployed = false
        	end
        end
	end
end)

RegisterNetEvent("police:dietyres")
AddEventHandler("police:dietyres", function(currentVeh)
    SetVehicleTyreBurst(currentVeh, 0, false, 1000.0)
    SetVehicleTyreBurst(currentVeh, 1, false, 1000.0)
    SetVehicleTyreBurst(currentVeh, 2, false, 1000.0)
    SetVehicleTyreBurst(currentVeh, 3, false, 1000.0)
    SetVehicleTyreBurst(currentVeh, 4, false, 1000.0)
    SetVehicleTyreBurst(currentVeh, 5, false, 1000.0)
    exports.pNotify:SendNotification({text = "You hit a spike strip! Bad luck.",type = "error",queue = "left",timeout = 3000,layout = "centerRight"})
    Citizen.Wait(1000)
    SetEntityAsMissionEntity(obj1, false, false)
    SetEntityAsMissionEntity(obj2, false, false)
    SetEntityAsMissionEntity(obj3, false, false)
    SetEntityVisible(obj1, false)
    SetEntityVisible(obj2, false)
    SetEntityVisible(obj3, false)
    DeleteObject(obj1)
    DeleteObject(obj2)
    DeleteObject(obj3)
    DeleteEntity(obj1)
    DeleteEntity(obj2)
    DeleteEntity(obj3)
    obj1 = nil
    obj2 = nil
    obj3 = nil
    spikes_deployed = false
end)

RegisterNetEvent("police:dietyres2")
AddEventHandler("police:dietyres2", function(peeps)
    SetVehicleTyreBurst(GetVehiclePedIsIn(GetPlayerPed(GetPlayerFromServerId(peeps)), false), 0, false, 1000.0)
    SetVehicleTyreBurst(GetVehiclePedIsIn(GetPlayerPed(GetPlayerFromServerId(peeps)), false), 1, false, 1000.0)
    SetVehicleTyreBurst(GetVehiclePedIsIn(GetPlayerPed(GetPlayerFromServerId(peeps)), false), 2, false, 1000.0)
    SetVehicleTyreBurst(GetVehiclePedIsIn(GetPlayerPed(GetPlayerFromServerId(peeps)), false), 3, false, 1000.0)
    SetVehicleTyreBurst(GetVehiclePedIsIn(GetPlayerPed(GetPlayerFromServerId(peeps)), false), 4, false, 1000.0)
    SetVehicleTyreBurst(GetVehiclePedIsIn(GetPlayerPed(GetPlayerFromServerId(peeps)), false), 5, false, 1000.0)
end)

--=============================================================cALL IT

function loadAnimDict(dict)
	while(not HasAnimDictLoaded(dict)) do
		RequestAnimDict(dict)
		Citizen.Wait(1)
	end
end

function doAnimation()
	local ped 	  = GetPlayerPed(-1)
	local coords  = GetEntityCoords(ped)

	--FreezeEntityPosition(ped, true)
	loadAnimDict("pickup_object")
	TaskPlayAnim(ped, "pickup_object", "pickup_low", 1.0, 1, -1, 33, 0, 0, 0, 0)
end

function spikes()
	TriggerEvent("police:Deploy")
end

function delspike()
	TriggerEvent("delspikes")
end

RegisterNetEvent("police:Deploy")
AddEventHandler("police:Deploy", function()
    Citizen.CreateThread(function()
        if not spikes_deployed then
            local spikes = GetHashKey("p_stinger_04")
            RequestModel(spikes)
            while not HasModelLoaded(spikes) do
                Citizen.Wait(0)
            end
            exports.pNotify:SendNotification({text = "Deploying spikes!",type = "error",queue = "left",timeout = 3000,layout = "centerRight"}) 
            doAnimation()
            Citizen.Wait(1700)
            ClearPedTasksImmediately(GetPlayerPed(-1))
			--FreezeEntityPosition(GetPlayerPed(-1), false)
			Citizen.Wait(250)
            local playerheading = GetEntityHeading(GetPlayerPed(-1))
            coords1 = GetOffsetFromEntityInWorldCoords(GetPlayerPed(-1), 3, 10, -0.7)
            coords2 = GetOffsetFromEntityInWorldCoords(GetPlayerPed(-1), 0, -5, -0.5)
            obj1 = CreateObject(spikes, coords1['x'], coords1['y'], coords1['z'], true, true, true)
            obj2 = CreateObject(spikes, coords2['x'], coords2['y'], coords2['z'], true, true, true)
            obj3 = CreateObject(spikes, coords2['x'], coords2['y'], coords2['z'], true, true, true)
			SetEntityHeading(obj1, playerheading)
            SetEntityHeading(obj2, playerheading)
            SetEntityHeading(obj3, playerheading)
            AttachEntityToEntity(obj1, GetPlayerPed(-1), 1, 0.0, 4.0, 0.0, 0.0, -90.0, 0.0, true, true, false, false, 2, true)
            AttachEntityToEntity(obj2, GetPlayerPed(-1), 1, 0.0, 8.0, 0.0, 0.0, -90.0, 0.0, true, true, false, false, 2, true)
            AttachEntityToEntity(obj3, GetPlayerPed(-1), 1, 0.0, 12.0, 0.0, 0.0, -90.0, 0.0, true, true, false, false, 2, true)
            Citizen.Wait(10)
            DetachEntity(obj1, true, true)
            DetachEntity(obj2, true, true)
            DetachEntity(obj3, true, true)
            spikes_deployed = true
        else
        	spikes_deployed = false
            exports.pNotify:SendNotification({text = "Removing spikes!",type = "error",queue = "left",timeout = 3000,layout = "centerRight"}) 
            doAnimation()
            Citizen.Wait(1700)
            ClearPedTasksImmediately(GetPlayerPed(-1))
			--FreezeEntityPosition(GetPlayerPed(-1), false)
			Citizen.Wait(200)
            SetEntityCoords(obj1, -5000.0, -5000.0, 20.0, true, false, false, true)
            SetEntityCoords(obj2, -5000.0, -5000.0, 20.0, true, false, false, true)
            SetEntityCoords(obj3, -5000.0, -5000.0, 20.0, true, false, false, true)
            Citizen.InvokeNative(0xB736A491E64A32CF, Citizen.PointerValueIntInitialized(obj1))
            Citizen.InvokeNative(0xB736A491E64A32CF, Citizen.PointerValueIntInitialized(obj2))
            Citizen.InvokeNative(0xB736A491E64A32CF, Citizen.PointerValueIntInitialized(obj3))
            obj1 = nil
            obj2 = nil
            obj3 = nil
        end
	end)
end)

RegisterNetEvent("delspikes")
AddEventHandler("delspikes", function()
spikes_deployed = false
exports.pNotify:SendNotification({text = "Removing spikes!",type = "error",queue = "left",timeout = 3000,layout = "centerRight"}) 
doAnimation()
Citizen.Wait(1700)
 ClearPedTasksImmediately(GetPlayerPed(-1))
Citizen.Wait(200)
            SetEntityCoords(obj1, -5000.0, -5000.0, 20.0, true, false, false, true)
            SetEntityCoords(obj2, -5000.0, -5000.0, 20.0, true, false, false, true)
            SetEntityCoords(obj3, -5000.0, -5000.0, 20.0, true, false, false, true)
            Citizen.InvokeNative(0xB736A491E64A32CF, Citizen.PointerValueIntInitialized(obj1))
            Citizen.InvokeNative(0xB736A491E64A32CF, Citizen.PointerValueIntInitialized(obj2))
            Citizen.InvokeNative(0xB736A491E64A32CF, Citizen.PointerValueIntInitialized(obj3))
            obj1 = nil
            obj2 = nil
            obj3 = nil
end)

RegisterNetEvent("sendAcePermissionToClient")
AddEventHandler("sendAcePermissionToClient", function(state)
    isAdmin = state
end)
