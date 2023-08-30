local isSceneRunning = false

Citizen.CreateThread(function()
    while true do
        if not isSceneRunning then 
            local ped = GetPlayerPed(-1)
            local playerCoords = GetEntityCoords(ped)

            for k, v in pairs(Config.Actions) do
                if #(playerCoords - v.Postion) <= v.Distance then
                    ShowHelpNotify(_U("press_to_start"))
                    if IsControlJustPressed(0, 46) then
                        CheckItems(v)
                    end 
                end
            end
        end 
        Wait(1)
    end
end)

function CheckItems(scene)
    TriggerServerEvent('gflp10-meth:server:hasPlayerItems', scene)
end

RegisterNetEvent('gflp10-meth:client:playerHasItems')
AddEventHandler('gflp10-meth:client:playerHasItems', function(scene)
    PlayerScene(scene)
end)

function PlayerScene(scene)
    local ped = GetPlayerPed(-1)

    RequestAnimDict(scene.AnimDict)

    while not HasAnimDictLoaded(scene.AnimDict) do
        Citizen.Wait(100)
    end

    local targetPosition, targetRotation = scene.Postion - scene.Offset, scene.Rotation

    local animPos, targetHeading = GetAnimInitialOffsetPosition(scene.AnimDict, scene.PlayerAnim, targetPosition, targetRotation, 0, 2), 52.8159
    TaskGoStraightToCoord(ped, animPos, 0.025, 5000, targetHeading, 0.05)
    Citizen.Wait(1000)

    FreezeEntityPosition(ped, true)

    
    local extras = {}

    local netScene = NetworkCreateSynchronisedScene(targetPosition, targetRotation, 2, false, false, 1.0, 0, 1.0)

    NetworkAddPedToSynchronisedScene(ped, netScene, scene.AnimDict, scene.PlayerAnim, 1.5, -4.0, 1, 16, 1.0, 0)
    for i, v in pairs(scene.objects) do
        RequestModel(v.prop)
        while not HasModelLoaded(v.prop) do
            Wait(0)
        end

        local obj = CreateObject(GetHashKey(v.prop), targetPosition, true) 

        while not DoesEntityExist(obj) do Wait(0); end
        SetEntityCollision(obj,false,false)

        SetModelAsNoLongerNeeded(v.prop)

        NetworkAddEntityToSynchronisedScene(obj, netScene, scene.AnimDict, v.anim, 1.0, 1.0, 1)
        extras[#extras+1] = obj
    end

    for i, v in pairs(scene.StaticObjects) do
        Wait(100)
        local obj = CreateObject(GetHashKey(v.prop), v.coords, false)
        while not DoesEntityExist(obj) do Wait(0); end
        print(DoesEntityExist(obj))
        print(obj)
        print(GetEntityCoords(obj))
        if v.rot then
            SetEntityRotation(obj, 0.0, 0.0, v.rot)
        end
        extras[#extras+1] = obj
    end 

    isSceneRunning = true
    NetworkStartSynchronisedScene(netScene)

    local over = false
    local earlyOver = false
    Citizen.CreateThread(function()
        Wait(scene.Time)
        over = true
    end)

    if scene.DamageNoMask then
        local playermask = nil
        TriggerEvent('skinchanger:getData', function(components, maxVals)
            for k, v in pairs(components) do
                if v.name == "mask_1" then
                    playermask = v.value
                    break
                end
            end
        end)

        while playermask == nil do
            Wait(10)
        end

        local isAllowed = false
        for k, v in pairs(Config.AllowedMasks) do
            if playermask == v then
                isAllowed = true
                break
            end
        end

        if not isAllowed then
            Citizen.CreateThread(function()
                TriggerEvent('gflp10-meth:client:notify', _U('without_mask_dmg'))
                while not over do
                    ApplyDamageToPed(ped, scene.DamageAmount, scene.ArmorFirst)
                    Wait(1000)
                end 
            end)
        end 
    end 
    
    while not over do 
        if IsControlJustPressed(0, 73) then
            earlyOver = true
            over = true
        end
        Wait(1)
    end

    isSceneRunning = false
    NetworkStopSynchronisedScene(netScene)

    for k,v in pairs(extras) do
        DeleteObject(v)
    end

    RemoveAnimDict(scene.AnimDict)

    FreezeEntityPosition(ped, false)

    if not earlyOver then
        TriggerServerEvent("gflp10-meth:server:reward", scene)
    end
end