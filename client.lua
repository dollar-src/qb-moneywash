local QBCore = exports['qb-core']:GetCoreObject()
PlayerJob = {}





RegisterNetEvent('QBCore:Client:OnPlayerLoaded')
AddEventHandler('QBCore:Client:OnPlayerLoaded', function()
    PlayerJob = QBCore.Functions.GetPlayerData().job
end)

RegisterNetEvent('QBCore:Client:OnJobUpdate')
AddEventHandler('QBCore:Client:OnJobUpdate', function(JobInfo)
    PlayerJob = JobInfo
end)


AddEventHandler("onResourceStart", function(JobInfo)
    PlayerJob = QBCore.Functions.GetPlayerData().job
end)


Citizen.CreateThread(function()

exports['qb-target']:AddBoxZone("blackmoney", Config.Coords, 4.0, 1.0, {
    name = "blackmoney",
    heading = 127.85,
    minZ = 84.5,
    maxZ = 85.98,
    debugPoly = false,
}, {
    options = {
        {
            event = "ai-black:input",
            icon = "fas fa-dollar-sign",
            label = "Wash Money",
            job = Config.Job
        },
    },
    distance = 2.5
})


end)


RegisterNetEvent('ai-black:input', function(item)
local sellingItem = exports['qb-input']:ShowInput({
    header = 'Money Wash',
    submitText = 'Wash',
    inputs = {
        {
            type = 'number',
            isRequired = true,
            name = 'amount',
            text = {value = item.amount}
        }
    }
  
})
TriggerServerEvent('sellitems',  sellingItem.amount)
end)
