lib.locale()

RegisterNetEvent('gflp10-meth:client:notify')
AddEventHandler('gflp10-meth:client:notify', function(text)
    TriggerEvent('esx:showNotification', text)
end)

function ShowHelpNotify(msg)
    AddTextEntry('gflp10-meth', msg)
    BeginTextCommandDisplayHelp('gflp10-meth')
    EndTextCommandDisplayHelp(0, false, false, -1)
end