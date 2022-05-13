_menuPool = NativeUI.CreatePool()
mainMenu = NativeUI.CreateMenu("", "~b~POLICE MEGAPHONE")
_menuPool:Add(mainMenu)

function AddMenuAnotherMenu(menu)
    local submenu = _menuPool:AddSubMenu(menu, "Police National", "Megaphone Police")
    local shout1 = NativeUI.CreateItem("Police Coter", "Veuillez vous mettre sur le coter.")
    local shout2 = NativeUI.CreateItem("Police Coter 2", "Deuxième sommation")
    local shout3 = NativeUI.CreateItem("Police Coter 3", "Dernière sommation")
    local shout4 = NativeUI.CreateItem("Police Dispertion", "Dispertion")
	local shout5 = NativeUI.CreateItem("Suivre Police", "Veuillez nous suivre.")
	
local ped = GetPlayerPed(-1)

  SetAmbientVoiceName(ped, "A_M_M_EASTSA_02_LATINO_FULL_01")
	SetEntityAsMissionEntity(ped, true, true)
	
    submenu:AddItem(shout1)
    submenu:AddItem(shout2)
    submenu:AddItem(shout3)
    submenu:AddItem(shout4)
    submenu:AddItem(shout5)
	
    submenu.OnItemSelect = function(sender, item, index)
    if item == shout1 then

		PlayAmbientSpeech1(ped, "TAXID_WHERE_TO", "SPEECH_PARAMS_FORCE_NORMAL")
      TriggerServerEvent("InteractSound_SV:PlayWithinDistance", 30.0, "police-coter", 0.6)
    end
    if item == shout2 then
      TriggerServerEvent("InteractSound_SV:PlayWithinDistance", 30.0, "coter2", 0.6)
    end
    if item == shout3 then
      TriggerServerEvent("InteractSound_SV:PlayWithinDistance", 30.0, "police-lastcoter", 0.6)
    end
    if item == shout4 then
      TriggerServerEvent("InteractSound_SV:PlayWithinDistance", 30.0, "police-dispertion", 0.6)
    end
    if item == shout5 then
      TriggerServerEvent("InteractSound_SV:PlayWithinDistance", 30.0, "police-suivre", 0.6)
    end
	end
end

function Gendarmerie(menu)
    local submenu = _menuPool:AddSubMenu(menu, "Gendarmerie National", "Megaphone Gendarmerie")
    local shout1 = NativeUI.CreateItem("Gendarmerie Coter", "Veuillez vous mettre sur le coter.")
    local shout2 = NativeUI.CreateItem("Gendarmerie Coter 2", "Deuxième sommation")
    local shout3 = NativeUI.CreateItem("Gendarmerie Coter 3", "Dernière sommation")
    local shout4 = NativeUI.CreateItem("Gendarmerie Dispertion", "Dispertion")
	local shout5 = NativeUI.CreateItem("Suivre Gendarmerie", "Veuillez nous suivre.")
	
local ped = GetPlayerPed(-1)

  	SetAmbientVoiceName(ped, "A_M_M_EASTSA_02_LATINO_FULL_01")
	SetEntityAsMissionEntity(ped, true, true)
	
    submenu:AddItem(shout1)
    submenu:AddItem(shout2)
    submenu:AddItem(shout3)
    submenu:AddItem(shout4)
    submenu:AddItem(shout5)
	
    submenu.OnItemSelect = function(sender, item, index)
    if item == shout1 then

		PlayAmbientSpeech1(ped, "TAXID_WHERE_TO", "SPEECH_PARAMS_FORCE_NORMAL")
      TriggerServerEvent("InteractSound_SV:PlayWithinDistance", 30.0, "gn-coter", 0.6)
    end
    if item == shout2 then
      TriggerServerEvent("InteractSound_SV:PlayWithinDistance", 30.0, "coter2", 0.6)
    end
    if item == shout3 then
      TriggerServerEvent("InteractSound_SV:PlayWithinDistance", 30.0, "gn-lastcoter", 0.6)
    end
    if item == shout4 then
      TriggerServerEvent("InteractSound_SV:PlayWithinDistance", 30.0, "gn-dispertion", 0.6)
    end
    if item == shout5 then
      TriggerServerEvent("InteractSound_SV:PlayWithinDistance", 30.0, "gn-suivre", 0.6)
    end
	end
end

function vehicleType(using)
  local cars = Config.Vehicles

  for i=1, #cars, 1 do
    if IsVehicleModel(using, GetHashKey(cars[i])) then
      return true
    end
  end
end

AddMenuAnotherMenu(mainMenu)
Gendarmerie(mainMenu)

_menuPool:RefreshIndex()
_menuPool:MouseControlsEnabled(false)
_menuPool:ControlDisablingEnabled(false)

Citizen.CreateThread(function()
    while true do
    Citizen.Wait(0)
      _menuPool:ProcessMenus()

        if IsControlJustPressed(1, 157) then
          if vehicleType(GetVehiclePedIsUsing(GetPlayerPed(-1))) then
            mainMenu:Visible(not mainMenu:Visible())
          else
           ShowNotification("Vous n'êtes ~r~pas dans un véhicule ~w~équipé d'un mégaphone")
          end
        end
    end
end)

function ShowNotification(text)
    SetNotificationTextEntry("STRING")
    AddTextComponentString(text)
    DrawNotification(false, false)
end