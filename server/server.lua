
ESX = nil
local item = Config.Settings.Itemname

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

ESX.RegisterUsableItem(item, function(source)
    local xPlayer = ESX.GetPlayerFromId(source)

    xPlayer.removeInventoryItem(item, 1)
    TriggerClientEvent('lovescripting:weaponclip', source)
end)