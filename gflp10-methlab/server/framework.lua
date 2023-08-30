FRAMEWORKS = {
    ["esx"] = {
        Boot = function ()
            ESX = exports['es_extended']:getSharedObject()
        end,
        HasPlayerItem = function (source, item)
            local xPlayer = ESX.GetPlayerFromId(source)

            if type(item) == "nil" then
                return true
            end

            return xPlayer.getInventoryItem(item.name).count >= item.amount
        end,
        RemovePlayerItem = function (source, item)
            local xPlayer = ESX.GetPlayerFromId(source)

            if type(item) == "nil" then
                return true
            end

            xPlayer.removeInventoryItem(item.name, item.amount)
        end,
        AddPlayerItem = function (source, item)
            local xPlayer = ESX.GetPlayerFromId(source)

            if type(item) == "nil" then
                return true
            end

            if xPlayer.canCarryItem(item.name, item.amount) then
                xPlayer.addInventoryItem(item.name, item.amount)
            else
                TriggerClientEvent('gflp10-meth:client:notify', source, _U('cant_carry_that_much'))
            end
        end
    },
    ["qb"] = {
        Boot = function ()
            QBCore = exports['qb-core']:GetCoreObject()
        end,
        HasPlayerItem = function (source, item)
            local Player = QBCore.Functions.GetPlayer(source)

            if type(item) == "nil" then
                return true
            end

            return Player.Functions.GetItemByName(item.name).amount >= item.amount
        end,
        RemovePlayerItem = function (source, item)
            local Player = QBCore.Functions.GetPlayer(source)

            if type(item) == "nil" then
                return true
            end

            Player.Functions.RemoveItem(item.name, item.amount)
        end,
        AddPlayerItem = function (source, item)
            local Player = QBCore.Functions.GetPlayer(source)

            if type(item) == "nil" then
                return true
            end

            Player.Functions.AddItem(item.name, item.amount)
        end
    }
}

Framework = FRAMEWORKS[Config.Framework]
Framework.Boot()