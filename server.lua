local QBCore = exports['qb-core']:GetCoreObject()


RegisterNetEvent("sellitems", function(itemAmount)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local itemName = Config.BlackMoneyItem
    local playerItem = Player.Functions.GetItemByName(itemname)
    local BlackItemPlayer = Player.Functions.GetItemByName(Config.BlackMoneyItem)

local money = tonumber(itemAmount)
    if  money == nil then 
        TriggerClientEvent('QBCore:Notify', src, 'Entered Value is Invalid', 'error')

    elseif  money <= 0  then
        TriggerClientEvent('QBCore:Notify', src, 'Entered Value is less than 0', 'error')


    elseif BlackItemPlayer == nil then
    TriggerClientEvent('QBCore:Notify', src, 'You dont have Black Money', 'error')

elseif BlackItemPlayer.amount < money then
    TriggerClientEvent('QBCore:Notify', src, 'You dont have Black Money', 'error')

    else
        local bol = itemAmount / Config.WashRate

        TriggerClientEvent('QBCore:Notify', src, 'Money Washed'.." $"..bol, 'success')
        Player.Functions.RemoveItem(itemName, tonumber(itemAmount))
        Player.Functions.AddMoney('cash', itemAmount / Config.WashRate)


    end


end)


