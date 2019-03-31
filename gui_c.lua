--[[-----------------------------------------------------
Coded By Rhys19 © 2018
Functions are not copied they are off a gta5 animation site functions are built together from docs.fivem.net & the Native Reference
Lock code Removed -- Making my own.
Radar By Rhys19 (Coming Soon)
Fix is very simple to create!
Door controls by rhys19 -- your litterally just checking if the car has the door and setting it as opened lol.
-------------------------------------------------------
]]

local title = "my servername menu" -- menu name appears at top of menu

local control = 244 -- need key ids? get them here: https://rhys19.life/ or https://docs.fivem.net/

local commandEnabled = false -- trigger if you want a command menu with /menu or using a button

steamWhitelist = false -- not implemented not
pedWhitelist = false -- not implemented not
adminWhitelist = true -- not implemented not
CopWhitelist = true -- not implemented not
AceWhitelist = false -- not implemented not

isAdmin = false

_menuPool = NativeUI.CreatePool()
mainMenu = NativeUI.CreateMenu(title, "~b~Main Menu")
_menuPool:Add(mainMenu)
_menuPool:MouseControlsEnabled(false)
_menuPool:ControlDisablingEnabled(false)

function VehMenu(menu)
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
		local exitMenu = NativeUI.CreateItem("Exit", "Exit the whole menu!")
		exitMenu.Activated = function(ParentMenu, SelectedItem)
    		--Do stuff
    		ToggleMenu() -- triggers the close NativeUI Menu function
    	end
        submenu:AddItem(Item)
		submenu:AddItem(Item2)
		submenu:AddItem(Item3)
		submenu:AddItem(Item4)
		submenu:AddItem(Item5)
		submenu:AddItem(Item6)
		submenu:AddItem(Item7)
		submenu:AddItem(exitMenu)
		_menuPool:MouseControlsEnabled(false)
		_menuPool:ControlDisablingEnabled(false)
    end
end

function LEOMenu(menu)
    local submenu = _menuPool:AddSubMenu(menu, "LEO")
    for i = 1, 1 do
    	local Item = NativeUI.CreateItem("Cuff", "Cuffs the nearest player")
		Item.Activated = function(ParentMenu, SelectedItem)
    		--Do stuff
    		TriggerEvent('cuffp')
    	end
		local Item2 = NativeUI.CreateItem("Drag", "Drags the nearest player")
		Item2.Activated = function(ParentMenu, SelectedItem)
    		--Do stuff
    		TriggerEvent('dragp')
    	end
		local Item3 = NativeUI.CreateItem("Put In Vehicle", "Seats the nearest player!")
		Item3.Activated = function(ParentMenu, SelectedItem)
    		--Do stuff
    		TriggerEvent('seatp')
    	end
		local Item4 = NativeUI.CreateItem("Take Out Of Vehicle", "Unseats the nearest player!")
		Item4.Activated = function(ParentMenu, SelectedItem)
    		--Do stuff
    		TriggerEvent('unseatp')
    	end
		local Item5 = NativeUI.CreateItem("Uncuff", "Uncuffs the nearest player")
		Item5.Activated = function(ParentMenu, SelectedItem)
    		--Do stuff
    		TriggerEvent('uncuffp')
    	end
		local Item6 = NativeUI.CreateItem("Undrag", "Undrags the nearest player")
		Item6.Activated = function(ParentMenu, SelectedItem)
    		--Do stuff
    		TriggerEvent('undragp')
    	end
		local Item7 = NativeUI.CreateItem("Radar", "Toggle the Radar Menu")
		Item7.Activated = function(ParentMenu, SelectedItem)
    		--Do stuff
    		--TriggerEvent('toggleMenu')
			ShowNotification('~r~Not working yet!, ~g~ New radar by Rhys19 Coming soon!')
    	end
		local Item8 = NativeUI.CreateItem("Panic Button", "Trigger your panic button!")
		Item8.Activated = function(ParentMenu, SelectedItem)
    		--Do stuff
    		--TriggerEvent('toggleMenu')
			TriggerServerEvent('InteractSound_SV:PlayWithinDistance', 0.5, 'sound.ogg', 1.0)
    	end
		local Item9 = NativeUI.CreateItem("Exit", "Exit the whole menu!")
		Item9.Activated = function(ParentMenu, SelectedItem)
    		--Do stuff
    		ToggleMenu() -- triggers the close NativeUI Menu function
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
		_menuPool:MouseControlsEnabled(false)
		_menuPool:ControlDisablingEnabled(false)
    end
end


function DoorCTRLMenu(menu)
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
		local exitMenu = NativeUI.CreateItem("Exit", "Exit the whole menu!")
		exitMenu.Activated = function(ParentMenu, SelectedItem)
    		--Do stuff
    		ToggleMenu() -- triggers the close NativeUI Menu function
    	end
        submenu:AddItem(Item)
		submenu:AddItem(Item2)
		submenu:AddItem(Item3)
		submenu:AddItem(Item4)
		submenu:AddItem(Item5)
		submenu:AddItem(Item6)
		submenu:AddItem(Item7)
		submenu:AddItem(Item8)
		submenu:AddItem(exitMenu)
		_menuPool:MouseControlsEnabled(false)
		_menuPool:ControlDisablingEnabled(false)
    end
end

function CivMenu(menu)
    local submenu = _menuPool:AddSubMenu(menu, "Civ")
    for i = 1, 1 do
    	local Item = NativeUI.CreateItem("Handsup", "Puts your hands up!")
		Item.Activated = function(ParentMenu, SelectedItem)
    		--Do stuff
    		TriggerEvent('Handsup2')
    	end
		local Item2 = NativeUI.CreateItem("Kneel", "Kneel on the ground with your hands up!")
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
		local exitMenu = NativeUI.CreateItem("Exit", "Exit the whole menu!")
		exitMenu.Activated = function(ParentMenu, SelectedItem)
    		--Do stuff
    		ToggleMenu() -- triggers the close NativeUI Menu function
    	end
        submenu:AddItem(Item)
		submenu:AddItem(Item2)
		submenu:AddItem(Item3)
		submenu:AddItem(Item4)
		submenu:AddItem(Item5)
		submenu:AddItem(exitMenu)
		_menuPool:MouseControlsEnabled(false)
		_menuPool:ControlDisablingEnabled(false)
    end
end

function LoadoutMenu(menu)
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
    		TriggerEvent('leoloadout')
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
		local exitMenu = NativeUI.CreateItem("Exit", "Exit the whole menu!")
		exitMenu.Activated = function(ParentMenu, SelectedItem)
    		--Do stuff
    		ToggleMenu() -- triggers the close NativeUI Menu function
    	end
        submenu:AddItem(Item)
		submenu:AddItem(Item2)
		submenu:AddItem(Item3)
		submenu:AddItem(Item4)
		submenu:AddItem(exitMenu)
		_menuPool:MouseControlsEnabled(false)
		_menuPool:ControlDisablingEnabled(false)
    end
end

LEOMenu(mainMenu)
CivMenu(mainMenu)
VehMenu(mainMenu)
LoadoutMenu(mainMenu)
DoorCTRLMenu(mainMenu)
_menuPool:RefreshIndex()

function ToggleMenu()
	_menuPool:CloseAllMenus()
end

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)
        _menuPool:ProcessMenus()
		if commandEnabled == false then
        if IsControlJustPressed(1, control) and GetLastInputMethod(0) then
            mainMenu:Visible(not mainMenu:Visible())
			--else
			--return
			end
        end
    end
end)

RegisterCommand('menu', function()
	if commandEnabled == true then
	mainMenu:Visible(not mainMenu:Visible())
		else
			return
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

-------------------------------------]

---------------- LEO loadouts ----------------


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

RegisterNetEvent('cuffp')
AddEventHandler('cuffp', function()
		closest, distance = GetClosestPlayer()
		if closest ~= nil and DoesEntityExist(GetPlayerPed(closest)) then
			if distance -1 and distance < 3 then
				drawNotification('~g~ SUCCESS: ~w~You cuffed the nearest player. (' .. GetPlayerName(closest) .. ')')	
				local closestID = GetPlayerServerId(closest)
				TriggerServerEvent('cuffServer', closestID)
			else
				drawNotification("~r~ ERROR: ~w~Nearest Player is too far away!")	
		end
	end
end)

RegisterNetEvent('uncuffp')
AddEventHandler('uncuffp', function()
		closest, distance = GetClosestPlayer()
		if closest ~= nil and DoesEntityExist(GetPlayerPed(closest)) then
			if distance -1 and distance < 3 then
				drawNotification('~g~SUCCESS: ~w~You uncuffed the nearest player.  (' .. GetPlayerName(closest) .. ')')
				local closestID = GetPlayerServerId(closest)
				TriggerServerEvent('unCuffServer', closestID)
				else
				drawNotification('~r~ERROR: ~w~No Player nearby to uncuff!')		
		end
	end
end)

RegisterNetEvent('dragp')
AddEventHandler('dragp', function(source)
		closest, distance = GetClosestPlayer()
		if closest ~= nil and DoesEntityExist(GetPlayerPed(closest)) then
			if distance -1 and distance < 3 then
				local closestID = GetPlayerServerId(closest)
				local pP = GetPlayerPed(-1)
				drawNotification('~g~SUCCESS: ~w~You are dragging the nearest player.  (' .. GetPlayerName(closest) .. ')')
				TriggerServerEvent('dragServer', closestID)
			else
				drawNotification('~r~ERROR: ~w~No player nearby able to drag!')
		end
	end
end)

RegisterNetEvent('seatp')
AddEventHandler('seatp', function(source)
		closest, distance = GetClosestPlayer()
		if closest ~= nil and DoesEntityExist(GetPlayerPed(closest)) then
			if distance -1 and distance < 3 then
				local closestID = GetPlayerServerId(closest)
				local pP = GetPlayerPed(-1)
				local veh = GetVehiclePedIsIn(pP, true)
				drawNotification('~g~SUCCESS: ~w~You forced the player you are dragging into the nearest vehicle.  (' .. GetPlayerName(closest) .. ')')
				TriggerServerEvent('seatServer', closestID, veh)
			else
				drawNotification("~r~ ERROR: ~w~Nearest Player is too far away!")	
		end
	end
end)

RegisterNetEvent('unseatp')
AddEventHandler('unseatp', function(source)
		closest, distance = GetClosestPlayer()
		if closest ~= nil and DoesEntityExist(GetPlayerPed(closest)) then
			if distance -1 and distance < 3 then
				local closestID = GetPlayerServerId(closest)
				drawNotification('~g~SUCCESS: ~w~You forced the player in the nearest vehicle out of the vehicle.  (' .. GetPlayerName(closest) .. ')')
				TriggerServerEvent('unSeatServer', closestID)
			else
				drawNotification("~r~ ERROR: ~w~Nearest Player is too far away!")	
		end
	end
end)

RegisterNetEvent('undragp')
AddEventHandler('undragp', function()
		closest, distance = GetClosestPlayer()
		if closest ~= nil and DoesEntityExist(GetPlayerPed(closest)) then
			if distance -1 and distance < 3 then
			drawNotification('~g~SUCCESS: ~w~You are no longer dragging the nearest player.  (' .. GetPlayerName(closest) .. ')')
				local closestID = GetPlayerServerId(closest)
				TriggerServerEvent('unDragServer', closestID)
			else
				drawNotification("~r~ ERROR: ~w~Nearest Player is too far away!")
		end
	end
end)

RegisterNetEvent('panicButtonSound', function()
	TriggerServerEvent('InteractSound_SV:PlayWithinDistance', 0.5, 'sound.ogg', 1.0)
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

RegisterNetEvent('rpnameshow')
AddEventHandler('rpnameshow', function()
    closest = GetClosestPlayer()
    if closest ~= nil and DoesEntityExist(GetPlayerPed(closest)) then
		local closestID = GetPlayerServerId(closest)
        TriggerServerEvent('showIDMessage', id)
		else
		DrawNotification('~r~ERROR: ~w~No one nearby to show your id!')
    end
end)

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

function getEntityPlayerAimingAt(player)
	local result, target = GetEntityPlayerIsFreeAimingAt(player)
	return target
end

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
