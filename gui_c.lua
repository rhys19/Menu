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

radar = false
_menuPool = NativeUI.CreatePool()
mainMenu = NativeUI.CreateMenu("Servername Menu", "~b~Main Menu") -- menu name appears at top of menu
radarMenu = NativeUI.CreateMenu("Servername Menu", "~b~Radar")
_menuPool:Add(mainMenu)
_menuPool:Add(radarMenu)
_menuPool:MouseControlsEnabled(false)
_menuPool:ControlDisablingEnabled(false)



--[[ EWW WHY DO WE USE THESE ANYMORE? lol there only here for the Key IDS
local Keys = {
	ESC = 322
	F1 = 288
	F2 = 289
	F3 = 170
	F5 = 166
	F6 = 167 
	F7 = 168
	F8 = 169 
	F9 = 56 
	F10 = 57
	~ = 243
	1 = 157
	2 = 158
	3 = 160
	4 = 164
	5 = 165
	6 = 159
	7 = 161
	8 = 162
	9 = 163
	- = 84 
	= = 83
	BACKSPACE = 177
	TAB = 37
	Q = 44
	W = 32
	E = 38
	R = 45
	T = 245
	Y = 246
	U = 303.
	P = 199
	[ = 39
	] = 40
	ENTER = 18
	CAPS = 137
	A = 34
	S = 8
	D = 9
	F = 23
	G = 47
	H = 74
	K = 311
	L = 182
	LEFTSHIFT = 21
	Z = 20
	X = 73
	C = 26
	V = 0
	B = 29
	N = 249
	M = 244
	, = 82
	. = 81
	LEFTCTRL = 36	
	LEFTALT = 19
	SPACE = 22
	RIGHTCTRL = 70
	HOME = 213
	PAGEUP = 10
	PAGEDOWN = 11
	DELETE = 178
	LEFT = 174
	RIGHT = 175
	TOP = 27
	DOWN = 173
	NENTER = 201
	N4 = 108
	N5 = 60
	N6 = 107
	N+ = 96
	N- = 97
	N7 = 117
	N8 = 61
	N9 = 118
}
--]]

local skinWhitelist = false  -- Set to true if you want to whitelist by skins else put false to disable
local steamwhitelist = true -- Set to true if you want steam whitelist else put false to disable

function ShowNotification(text)
    SetNotificationTextEntry("STRING")
    AddTextComponentString(text)
    DrawNotification(false, false)
end

function AddMenuVeh(menu)
    local submenu = _menuPool:AddSubMenu(menu, "Vehicle")
    for i = 1, 1 do
    	local Item = NativeUI.CreateItem("Lock", "Must Save Before Locking")
		Item.Activated = function(ParentMenu, SelectedItem)
    		--Do stuff
    		TriggerEvent('lock')
    	end
		local Item2 = NativeUI.CreateItem("Unlock", "Must Save Before Unlocking")
		Item2.Activated = function(ParentMenu, SelectedItem)
    		--Do stuff
    		TriggerEvent('unlock')
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
		local Item5 = NativeUI.CreateItem("Save Vehicle", "Save the vehicle!")
		Item5.Activated = function(ParentMenu, SelectedItem)
    		--Do stuff
    		TriggerEvent('save')
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
        submenu:AddItem(Item)
		submenu:AddItem(Item2)
		submenu:AddItem(Item3)
		submenu:AddItem(Item4)
		submenu:AddItem(Item5)
		submenu:AddItem(Item6)
		submenu:AddItem(Item7)
		_menuPool:MouseControlsEnabled(false)
		_menuPool:ControlDisablingEnabled(false)
    end
end

function AddMenuleo(menu)
    local submenu = _menuPool:AddSubMenu(menu, "LEO")
    for i = 1, 1 do
    	local Item = NativeUI.CreateItem("Cuff", "")
		Item.Activated = function(ParentMenu, SelectedItem)
    		--Do stuff
    		TriggerEvent('cuff')
    	end
		local Item2 = NativeUI.CreateItem("Drag", "")
		Item2.Activated = function(ParentMenu, SelectedItem)
    		--Do stuff
    		TriggerEvent('drag')
    	end
		local Item3 = NativeUI.CreateItem("Put In Vehicle", "")
		Item3.Activated = function(ParentMenu, SelectedItem)
    		--Do stuff
    		TriggerEvent('pv')
    	end
		local Item4 = NativeUI.CreateItem("Take Out Of Vehicle", "")
		Item4.Activated = function(ParentMenu, SelectedItem)
    		--Do stuff
    		TriggerEvent('ov')
    	end
		local Item5 = NativeUI.CreateItem("Uncuff", "")
		Item5.Activated = function(ParentMenu, SelectedItem)
    		--Do stuff
    		TriggerEvent('uncuff')
    	end
		local Item6 = NativeUI.CreateItem("Undrag", "")
		Item6.Activated = function(ParentMenu, SelectedItem)
    		--Do stuff
    		TriggerEvent('undrag')
    	end
        submenu:AddItem(Item)
		submenu:AddItem(Item2)
		submenu:AddItem(Item3)
		submenu:AddItem(Item4)
		submenu:AddItem(Item5)
		submenu:AddItem(Item6)
		_menuPool:MouseControlsEnabled(false)
		_menuPool:ControlDisablingEnabled(false)
    end
end

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
        submenu:AddItem(Item)
		submenu:AddItem(Item2)
		_menuPool:MouseControlsEnabled(false)
		_menuPool:ControlDisablingEnabled(false)
    end
end

AddMenuleo(mainMenu)
AddMenuciv(mainMenu)
AddMenuVeh(mainMenu)
AddMenudoorctrl(mainMenu)
_menuPool:RefreshIndex()

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)
        _menuPool:ProcessMenus()
        if IsControlJustPressed(1, 182) and GetLastInputMethod( 0 ) then
            mainMenu:Visible(not mainMenu:Visible())
        end
    end
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
			DisableControlAction(0,21,true)
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

RegisterNetEvent( 'cancelEmote' )
AddEventHandler( 'cancelEmote', function()
	local ped = GetPlayerPed( -1 )
    if ( DoesEntityExist( ped ) and not IsEntityDead( ped )) then
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
			drawNotification("~w~You dropped your weapon.")
        end
end

function GetPlayers()
    local players = {}

    for i = 0, 31 do
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

function leoLoadout()
    Citizen.CreateThread(function()
		local ped = GetPlayerPed(-1)
	    GiveWeaponToPed(ped, 1593441988, 1000, true, false)
        GiveWeaponComponentToPed(ped, 1593441988, 899381934)
        GiveWeaponToPed(ped, 911657153, 1000, true, false)
        GiveWeaponToPed(ped, 1737195953, 1000, true, false)
        GiveWeaponToPed(ped, 2343591895, 1000, true, false)
    end)
end

function swatLoadout()
    Citizen.CreateThread(function()
        local swatModel = GetHashKey("s_m_y_swat_01")
        RequestModel(swatModel)
        while not HasModelLoaded(swatModel) do
            Wait(0)
        end
        if HasModelLoaded(swatModel) then
            SetPlayerModel(PlayerId(), swatModel)
        else
	   drawNotification("The model could not load - if you see this contact development.")
		end
		local ped = GetPlayerPed(-1)
	    GiveWeaponToPed(ped, 1593441988, 1000, true, false)
        GiveWeaponComponentToPed(ped, 1593441988, 899381934)
        GiveWeaponToPed(ped, 911657153, 1000, true, false)
        GiveWeaponToPed(ped, 1737195953, 1000, true, false)
        GiveWeaponToPed(ped, 2343591895, 1000, true, false)
	    GiveWeaponToPed(ped, 4256991824, 1000, true ,false)
	    GiveWeaponToPed(ped, 2210333304, 1000, true ,false)
	    GiveWeaponComponentToPed(ped, 2210333304, 0xC164F53)
	    GiveWeaponComponentToPed(ped, 2210333304, 0x7BC4CDDC)
	    GiveWeaponToPed(ped, 487013001, 1000, true ,false)
	    GiveWeaponComponentToPed(ped, 487013001, 0x7BC4CDDC)
	    GiveWeaponToPed(ped, 736523883, 1000, true ,false)
	    GiveWeaponToPed(ped, 1305664598, 1000, true ,false)
    end)
end

function fireLoadout()
    Citizen.CreateThread(function()
		local ped = PlayerPedId()
	    GiveWeaponToPed(PlayerPedId(), GetHashKey("WEAPON_FLASHLIGHT"), 1000, false)
	    GiveWeaponToPed(PlayerPedId(), GetHashKey("WEAPON_STUNGUN"), 1000, false)
		GiveWeaponToPed(PlayerPedId(), GetHashKey("WEAPON_FIREEXTINGUISHER"), 1000, false)
		GiveWeaponToPed(PlayerPedId(), 1233104067, 1000, false)
		GiveWeaponToPed(PlayerPedId(), GetHashKey("WEAPON_HATCHET"), 1000, false)
    end)
end

function emsLoadout()
    Citizen.CreateThread(function()
		local ped = PlayerPedId()
	    GiveWeaponToPed(PlayerPedId(), GetHashKey("WEAPON_FLASHLIGHT"), 1000, false)
	    GiveWeaponToPed(PlayerPedId(), 1233104067, 1000, false)
    end)
end

function GetPlayers()
    local players = {}

    for i = 0, 31 do
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

local isHandcuffed = false

local drag = false
local playerStillDragged = false
local officerDrag = -1
local revive = false

RegisterNetEvent('cuff')
AddEventHandler('cuff',function()
	local t, distance = GetClosestPlayer()
	if(distance ~= -1 and distance < 3) then
		TriggerServerEvent("cuffGranted", GetPlayerServerId(t))
	else
    	drawNotification("There is no nearby player to cuff!")
	end
end)

RegisterNetEvent('uncuff')
AddEventHandler('uncuff',function()
	local t, distance = GetClosestPlayer()
	if(distance ~= -1 and distance < 3) then
		TriggerServerEvent("uncuffGranted", GetPlayerServerId(t))
	else
    	drawNotification("There is no nearby player to uncuff!")
	end
end)

RegisterNetEvent('getCuffed')
AddEventHandler('getCuffed', function()
	local ped = GetPlayerPed(-1)
	RequestAnimDict('mp_arresting')
	while not HasAnimDictLoaded('mp_arresting') do
		Citizen.Wait(100)
	end
	
	TaskPlayAnim(ped, 'mp_arresting', 'idle', 8.0, -8, -1, 49, 0, 0, 0, 0)
	SetEnableHandcuffs(ped, true)
	SetCurrentPedWeapon(ped, GetHashKey('WEAPON_UNARMED'), true)
	DisablePlayerFiring(ped, true)
	FreezeEntityPosition(ped, true)
	DisableControlAction(0,32,true) -- W
	DisableControlAction(0,33,true) -- S
    DisableControlAction(0,34,true) -- A
	DisableControlAction(0,35,true) -- D
	
	isHandcuffed = true
end)

RegisterNetEvent('getUncuffed')
AddEventHandler('getUncuffed', function()
	local ped = GetPlayerPed(-1)

	ClearPedSecondaryTask(ped)
	SetEnableHandcuffs(ped, false)
	SetCurrentPedWeapon(ped, GetHashKey('WEAPON_UNARMED'), true)
	FreezeEntityPosition(ped, false)
	
	isHandcuffed = false
end)

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(10)
		
		if IsEntityPlayingAnim(GetPlayerPed(PlayerId()), "mp_arresting", "idle", 3) then
			DisableControlAction(1, 140, true)
			DisableControlAction(1, 141, true)
			DisableControlAction(1, 142, true)
			if IsPedInAnyVehicle(GetPlayerPed(PlayerId()), false) then
				DisableControlAction(0, 59, true)
			end
		end

		if drag then
			local ped = GetPlayerPed(GetPlayerFromServerId(officerDrag))
			local myped = GetPlayerPed(-1)
			AttachEntityToEntity(myped, ped, 4103, 11816, 0.48, 0.00, 0.0, 0.0, 0.0, 0.0, false, false, false, false, 2, true)
			playerStillDragged = true

			RequestAnimDict('mp_arresting')

			while not HasAnimDictLoaded('mp_arresting') do
				Citizen.Wait(0)
			end

			local myPed = PlayerPedId(-1)
			local animation = 'idle'
			local flags = 49

			while(IsPedBeingStunned(myPed, 0)) do
				ClearPedTasksImmediately(myPed)
			end
			TaskPlayAnim(myPed, 'mp_arresting', animation, 8.0, -8, -1, flags, 0, 0, 0, 0)

		else
			if(playerStillDragged) then
				DetachEntity(GetPlayerPed(-1), true, false)
				playerStillDragged = false
			end
		end
		
end
end)

RegisterNetEvent('drag')
AddEventHandler('drag',function()
	local t, distance = GetClosestPlayer()
	if(distance ~= -1 and distance < 3) then
		TriggerServerEvent("dragRequest", GetPlayerServerId(t))
	else
    	drawNotification("There is no nearby player to drag!")
	end
end)

RegisterNetEvent('undrag')
AddEventHandler('undrag',function()
		closest, distance = GetClosestPlayer()
		--if closest ~= nil and DoesEntityExist(GetPlayerPed(closest)) then
			if distance -1 and distance < 3 then
				local closestID = GetPlayerServerId(closest)
				TriggerServerEvent('unDragServer', closestID)
			else
				drawNotification("There is no nearby player to drag!")
end
end)

RegisterNetEvent('toggleDrag')
AddEventHandler('toggleDrag', function(t)

		drag = not drag
		officerDrag = t
end)

Citizen.CreateThread(function()
	while true do
		if drag then
			local ped = GetPlayerPed(GetPlayerFromServerId(playerPedDragged))
			plyPos = GetEntityCoords(ped,  true)
			SetEntityCoords(ped, plyPos.x, plyPos.y, plyPos.z)
		end
		Citizen.Wait(1000)
	end
end)

RegisterNetEvent('pv')
AddEventHandler('pv', function()
	local t, distance = GetClosestPlayer()
	if(distance ~= -1 and distance < 3) then
		local v = GetVehiclePedIsIn(GetPlayerPed(-1), true)
		TriggerServerEvent("forceEnterAsk", GetPlayerServerId(t), v)
	else
    	drawNotification("There is no nearby player to seat!")
	end
end)

RegisterNetEvent('forcedEnteringVeh')
AddEventHandler('forcedEnteringVeh', function(veh)

		local pos = GetEntityCoords(GetPlayerPed(-1))
		local entityWorld = GetOffsetFromEntityInWorldCoords(GetPlayerPed(-1), 0.0, 20.0, 0.0)

		local rayHandle = CastRayPointToPoint(pos.x, pos.y, pos.z, entityWorld.x, entityWorld.y, entityWorld.z, 10, GetPlayerPed(-1), 0)
		local _, _, _, _, vehicleHandle = GetRaycastResult(rayHandle)

		if vehicleHandle ~= nil then
			SetPedIntoVehicle(GetPlayerPed(-1), vehicleHandle, 1)
		end
end)

RegisterNetEvent('ov')
AddEventHandler('ov', function()
	local t, distance = GetClosestPlayer()
	if(distance ~= -1 and distance < 3) then
		TriggerServerEvent("confirmUnseat", GetPlayerServerId(t))
	else
    	drawNotification("There is no nearby player to unseat!")
	end
end)

RegisterNetEvent('unseatme')
AddEventHandler('unseatme', function(t)
	local ped = GetPlayerPed(t)
	ClearPedTasksImmediately(ped)
	plyPos = GetEntityCoords(GetPlayerPed(-1),  true)
	local xnew = plyPos.x+2
	local ynew = plyPos.y+2

	SetEntityCoords(GetPlayerPed(-1), xnew, ynew, plyPos.z)
end)

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
end, false)

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
end, false)

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
end, false)

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
end, false)

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
end, false)

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
end, false)

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

-- Delete car function borrowed frtom Mr.Scammer's model blacklist, thanks to him!
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

RegisterNetEvent("fixCar")
AddEventHandler("fixCar", function()
	local ped = GetPlayerPed(-1)
	if IsPedInAnyVehicle(ped) then
		local vehicle = GetVehiclePedIsIn(ped)
		EngineRepair()
		FreezeEntityPosition(GetVehiclePedIsUsing(ped), true)
		    drawNotification("~g~The mechanic's working on your car. It should take around 15 seconds to complete.")
			Citizen.Wait(15000)
		FreezeEntityPosition(GetVehiclePedIsUsing(ped), false)
		SetVehicleEngineHealth(vehicle, 9999)
		SetVehiclePetrolTankHealth(vehicle, 9999)
		SetVehicleFixed(vehicle)
		EngineRepair()
		    drawNotification("~g~Your vehicle has been fixed.")
	else
		drawNotification("~r~You are not in a vehicle.")
	end
end)

function EngineRepair()
    ped = GetPlayerPed(-1)
    local veh = GetVehiclePedIsIn(ped, false)
    if IsVehicleEngineOn(veh) then
        SetVehicleEngineOn(veh, false, false, true)
        SetVehicleUndriveable(veh, true)
    else
        SetVehicleEngineOn(veh, true, false, true)
        SetVehicleUndriveable(veh, false)
    end
end

---------------- Fix ----------------

---------------- Lock ----------------

interactionDistance = 3.5 --The radius you have to be in to interact with the vehicle.
lockDistance = 25 --The radius you have to be in to lock your vehicle.

saved = false
controlsave_bool = false

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

RegisterNetEvent('lock')
AddEventHandler('lock',function()
	local player = GetPlayerPed(-1)
    local vehicle = saveVehicle
	local islocked = GetVehicleDoorLockStatus(vehicle)
	local distanceToVeh = GetDistanceBetweenCoords(GetEntityCoords(player), GetEntityCoords(vehicle), 1)
	if IsPedInAnyVehicle(player) then
		if DoesEntityExist(vehicle) then
			if distanceToVeh <= lockDistance then
				if (islocked == 1)then
				SetVehicleDoorsLocked(vehicle, 2)
				ShowNotification("You have locked your ~y~" .. GetLabelText(GetDisplayNameFromVehicleModel(GetEntityModel(vehicle))) .. "~w~.")
				TriggerEvent('lockLights')
				end
			else
				ShowNotification("~r~You must be near your vehicle to do that.")
			end
		else
			ShowNotification("~r~No saved vehicle.")
		end
	else
	    drawNotification("~r~You are not in a vehicle.")
	end
end)

RegisterNetEvent('unlock')
AddEventHandler('unlock',function()
	local player = GetPlayerPed(-1)
    local vehicle = saveVehicle
	local islocked = GetVehicleDoorLockStatus(vehicle)
	local distanceToVeh = GetDistanceBetweenCoords(GetEntityCoords(player), GetEntityCoords(vehicle), 1)
	if IsPedInAnyVehicle(player) then
		if DoesEntityExist(vehicle) then
			if distanceToVeh <= lockDistance then
				if (islocked == 1)then
				SetVehicleDoorsLocked(vehicle, 1)
				ShowNotification("You have unlocked your ~y~" .. GetLabelText(GetDisplayNameFromVehicleModel(GetEntityModel(vehicle))) .. "~w~.")
				TriggerEvent('lockLights')
				end
			else
				ShowNotification("~r~You must be near your vehicle to do that.")
			end
		else
			ShowNotification("~r~No saved vehicle.")
		end
	else
	    drawNotification("~r~You are not in a vehicle.")
	end
end)


function ShowNotification( text )
    SetNotificationTextEntry( "STRING" )
    AddTextComponentString( text )
    DrawNotification( false, false )
end

---------------- Lock ----------------

---------------- Save ----------------

RegisterNetEvent('save')
AddEventHandler('save',function()
	local player = GetPlayerPed(-1)
	if (IsPedSittingInAnyVehicle(player)) then
		if  saved == true then
			--remove from saved.
			saveVehicle = nil
			RemoveBlip(targetBlip)
			SetEntityAsNoLongerNeeded(vehicle)
			ShowNotification("Saved vehicle ~r~removed~w~.")
			saved = false
		else
			RemoveBlip(targetBlip)
			saveVehicle = GetVehiclePedIsIn(player,true)
			local vehicle = saveVehicle
			SetEntityAsMissionEntity(vehicle, true, true)
			targetBlip = AddBlipForEntity(vehicle)
			SetBlipSprite(targetBlip,225)
			ShowNotification("This ~y~" .. GetLabelText(GetDisplayNameFromVehicleModel(GetEntityModel(vehicle))) .. "~w~ is now your~g~ saved ~w~vehicle.")
			saved = true
		end
	else
	    drawNotification("~r~You are not in a vehicle.")
	end
end)

RegisterNetEvent('controlsave')
AddEventHandler('controlsave',function()
		if controlsave_bool == false then
			controlsave_bool = true
			if saveVehicle == nil then
			ShowNotification("~r~No saved vehicle.")
			else
			ShowNotification("You are no longer controlling your ~y~" .. GetLabelText(GetDisplayNameFromVehicleModel(GetEntityModel(saveVehicle))))
			end
		else
			controlsave_bool = false
			if saveVehicle == nil then
			ShowNotification("~r~No saved vehicle.")
			else
			ShowNotification("You are no longer controlling your ~y~" .. GetLabelText(GetDisplayNameFromVehicleModel(GetEntityModel(saveVehicle))))
			end
		end
end)

---------------- Save ----------------

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

-- Emote Cancel Functions

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

------------------ VEHICLE FIX -------------------------------
RegisterNetEvent("fixveh")
AddEventHandler("fixveh", function()
	local playerPed = GetPlayerPed(-1)
	if IsPedInAnyVehicle(playerPed) then
		local vehicle = GetVehiclePedIsIn(playerPed)
		FreezeEntityPosition(GetVehiclePedIsUsing(GetPlayerPed(-1)), true)
		    Notification("~g~The mechanic's working on your car. It should take around 15 seconds to complete.")
			Citizen.Wait(15000)
		FreezeEntityPosition(GetVehiclePedIsUsing(GetPlayerPed(-1)), false)
		SetVehicleEngineHealth(vehicle, 9999)
		SetVehiclePetrolTankHealth(vehicle, 9999)
		SetVehicleFixed(vehicle)
		    Notification("~g~Your vehicle has been fixed.")
	else
		Notification("~g~You are not in a vehicle.")
	end
end)

function Notification(msg)
	SetNotificationTextEntry("STRING")
	AddTextComponentString(msg)
	DrawNotification(false, false)
end