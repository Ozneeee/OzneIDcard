ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)


RegisterNetEvent('ozne:achetersacarte')
AddEventHandler('ozne:achetersacarte', function()

    local _source = source
    local xPlayer = ESX.GetPlayerFromId(source)
    local price = 100
    local xMoney = xPlayer.getMoney()
    local item = 'carteidentite'
    local carte = xPlayer.getInventoryItem(item).count

    if carte <=0 then    
        if xPlayer.getMoney() >= price then
            TriggerClientEvent('esx:showNotification', source, "~o~Policer~s~ :\nPaiement ~g~accepté~s~\nvous avez payer ~g~".. price .."$") 
            xPlayer.removeMoney(price)
            xPlayer.addInventoryItem(item, 1)
        else
            TriggerClientEvent('esx:showNotification', source, "~o~Policier~s~ :\nPaiement ~r~refusé")
        end
    else
        TriggerClientEvent('esx:showNotification', source, '~r~Policier :\n~s~Vous avez déjà une carte enregister !!')
    end       

end)