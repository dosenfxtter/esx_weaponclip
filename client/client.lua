ESX = nil

Citizen.CreateThread(function()
    while ESX == nil do
        TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
    end
end)

RegisterNetEvent('lovescripting:weaponclip')
AddEventHandler('lovescripting:weaponclip', function()
    local playerPed = PlayerPedId()
    local lib, anim = 'cover@weapon@1h', 'high_reload'

    while not HasAnimDictLoaded(lib) do
        RequestAnimDict(lib)
        Citizen.Wait(0)
    end

    if IsPedArmed(playerPed, 4) then
        weapon = GetSelectedPedWeapon(playerPed)
        
        if weapon~=nil then
            TaskPlayAnim(playerPed, lib, anim,  8.0, 8.0, 2000, 0, 0, false, false, false) 

            if Config.Settings.ProgressbarActiv == true then
                exports['progressBars']:startUI(2000, Config.Language.progressbar_message)
            end
            Wait(2000)

            AddAmmoToPed(playerPed, weapon, Config.Settings.AmountOfAmmo)
            ESX.ShowNotification(Config.Language.clip_used)
        else
            ESX.ShowNotification(Config.Language.no_weapon)
        end
    else
        ESX.ShowNotification(Config.Language.no_weapon)
    end
end)