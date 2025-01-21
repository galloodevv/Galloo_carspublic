if Shr.framework == 'esx' then
    ESX = exports['es_extended']:getSharedObject()
elseif Shr.framework == 'qbcore' then    
    QBCore = exports['qb-core']:GetCoreObject()
end

local attemptedVehicles = {}

CreateThread(function()
    local s = 1000
    while true do
        local playerPed = PlayerPedId()
        local vehicle = GetVehiclePedIsTryingToEnter(playerPed)
        
        if vehicle and DoesEntityExist(vehicle) then
            local driver = GetPedInVehicleSeat(vehicle, -1)
            if driver == 0 or (driver ~= 0 and not IsPedAPlayer(driver)) then
                if attemptedVehicles[vehicle] then
                    SetVehicleEngineOn(vehicle, false, true, true)
                    SetVehicleUndriveable(vehicle, true)
                    if Shr.framework == 'esx' then
                        ESX.ShowNotification("Este vehículo está dañado!")
                    elseif Shr.framework == 'qbcore' then
                        QBCore.Functions.Notify("Este vehículo está dañado!", "error")
                    end
                    Wait(1000)
                else
                    local trying = true
                    CreateThread(function()
                        while trying do
                            DisableControlAction(0, 75, true)  -- Disable exit vehicle
                            Wait(0)
                        end
                    end)

                    local success = lib.skillCheck(Shr.skillCheckLevels, Shr.skillCheckKeys)
                    trying = false

                    if success then
                        if Shr.framework == 'esx' then
                            ESX.ShowNotification("Has tenido éxito!")
                        elseif Shr.framework == 'qbcore' then
                            QBCore.Functions.Notify("Has tenido éxito!", "success")
                        end
                        
                        Wait(2500)
                        if driver ~= 0 then
                            ClearPedTasksImmediately(driver)
                            TaskLeaveVehicle(driver, vehicle, 0)
                        end
                    else
                        attemptedVehicles[vehicle] = true
                        if Shr.framework == 'esx' then
                            ESX.ShowNotification("Has fallado!")
                        elseif Shr.framework == 'qbcore' then
                            QBCore.Functions.Notify("Has fallado!", "error")
                        end
                        SetVehicleEngineOn(vehicle, false, true, true)
                        SetVehicleUndriveable(vehicle, true)
                        SetVehicleEngineHealth(vehicle, -4000)
                    end
                    Wait(5000)
                end
            end
        end
        Wait(s)
    end
end)