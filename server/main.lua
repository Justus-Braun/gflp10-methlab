
RegisterNetEvent("gflp10-meth:server:reward")
AddEventHandler("gflp10-meth:server:reward", function(scene)
    local _source = source

    if Framework.HasPlayerItem(_source, scene.ItemNeeds) then
        Framework.RemovePlayerItem(_source, scene.ItemNeeds)
    end

    if scene.CanCarryItem then
        if Framework.HasPlayerItem(_source, scene.ItemReward) then
            Framework.AddPlayerItem(_source, scene.ItemReward)
        else
            TriggerClientEvent('gflp10-meth:client:notify', _source, locale('cant_carry_that_much'))
        end
    else
        Framework.AddPlayerItem(_source, scene.ItemReward)
    end
end)

RegisterNetEvent("gflp10-meth:server:hasPlayerItems")
AddEventHandler("gflp10-meth:server:hasPlayerItems", function(scene)
    local _source = source

    if Framework.HasPlayerItem(_source, scene.ItemNeeds) then
        TriggerClientEvent('gflp10-meth:client:playerHasItems', _source, scene)
    else
        TriggerClientEvent('gflp10-meth:client:notify', _source, locale('not_the_right_items'))
    end
end)