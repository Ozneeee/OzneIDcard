local open = false
ESX = nil
--ESX
Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(0)
    end
end)



-- Open ID card
RegisterNetEvent('jsfour-idcard:open')
AddEventHandler('jsfour-idcard:open', function( data, type )
	open = true
	SendNUIMessage({
		action = "open",
		array  = data,
		type   = type
	})
end)

-- Key events
Citizen.CreateThread(function()
	while true do
		Wait(0)
		if IsControlJustReleased(0, 322) and open or IsControlJustReleased(0, 177) and open then
			SendNUIMessage({
				action = "close"
			})
			open = false
		end
	end
end)

RegisterNetEvent('montrer:identity')
AddEventHandler('montrer:identity', function(id)
    local player, distance = ESX.Game.GetClosestPlayer()

    TriggerServerEvent('jsfour-idcard:open', GetPlayerServerId(PlayerId()), GetPlayerServerId(PlayerId()))
    if distance ~= -1 and distance <= 3.0 then
        TriggerServerEvent('jsfour-idcard:open', GetPlayerServerId(PlayerId()), GetPlayerServerId(player))                                
    else
        ESX.ShowNotification("Aucun joueur à proximité")
    end
end)

RegisterNetEvent('montrer:permis')
AddEventHandler('montrer:permis', function(id)
    local player, distance = ESX.Game.GetClosestPlayer()

    TriggerServerEvent('jsfour-idcard:open', GetPlayerServerId(PlayerId()), GetPlayerServerId(PlayerId()), 'driver')
    if distance ~= -1 and distance <= 3.0 then
        TriggerServerEvent('jsfour-idcard:open', GetPlayerServerId(PlayerId()), GetPlayerServerId(player), 'driver')                                
    else
        ESX.ShowNotification("Aucun joueur à proximité")
    end
end)

RegisterNetEvent('montrer:ppa')
AddEventHandler('montrer:ppa', function(id)
    local player, distance = ESX.Game.GetClosestPlayer()

    TriggerServerEvent('jsfour-idcard:open', GetPlayerServerId(PlayerId()), GetPlayerServerId(PlayerId()), 'ppa')
    if distance ~= -1 and distance <= 3.0 then
        TriggerServerEvent('jsfour-idcard:open', GetPlayerServerId(PlayerId()), GetPlayerServerId(player), 'ppa')                                
    else
        ESX.ShowNotification("Aucun joueur à proximité")
    end
end)
