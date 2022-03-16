local display = false
local ESX=nil
local GlobalJob = nil
while ESX==nil  do 
    TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
end
RegisterCommand("nui", function(source, args)
    SetDisplay(not display)
end)


RemoveJob=function()
    if GlobalJob=="police"then TriggerServerEvent("Remove:Police") 
    elseif GlobalJob=="sceriffi" then TriggerServerEvent("Remove:Sceriffi")
    elseif GlobalJob=="ambulance" then TriggerServerEvent("Remove:Ambulance") 
    elseif GlobalJob=="import" then TriggerServerEvent("Remove:Import") 
    elseif GlobalJob=="meccanico" then TriggerServerEvent("Remove:Meccanico") 
    elseif GlobalJob=="armeria" then TriggerServerEvent("Remove:Armeria")
    end
end
CheckJob = function()
    ESX.TriggerServerCallback("Scoreboard:Lavoro", function (f)
        
    
    f=string.lower(f)
    if f=="police"then TriggerServerEvent("Add:Police") 
    elseif f=="sceriffi" then TriggerServerEvent("Add:Sceriffi")
    elseif f=="ambulance" then TriggerServerEvent("Add:Ambulance") 
    elseif f=="import" then TriggerServerEvent("Add:Import") 
    elseif f=="meccanico" then TriggerServerEvent("Add:Meccanico") 
    elseif f=="armeria" then TriggerServerEvent("Add:Armeria")
    end
    GlobalJob=f
end)
end
RegisterNetEvent("client:CheckJob")
AddEventHandler("client:CheckJob",function ()
    print("bau")
    CheckJob()
end)
RegisterNetEvent('esx:setJob')
AddEventHandler('esx:setJob', function(job)
    if  job.name ~=GlobalJob then
        CheckJob()
        RemoveJob()
    else print("same")
    end

end)
RegisterNetEvent('esx:playerLoaded')

AddEventHandler('esx:playerLoaded', function(playerData)
    CheckJob()
end)
--very important cb 
RegisterNUICallback("exit", function(data)
    SetDisplay(false)
end)
-- this cb is used as the main route to transfer data back 
-- and also where we hanld the data sent from js
RegisterNUICallback("main", function(data)
    SetDisplay(false)
end)

RegisterNUICallback("error", function(data)
    SetDisplay(false)
end)

function SetDisplay(bool)
    ESX.TriggerServerCallback("Scoreboard:GetJobs", function(score) 
        
    display = bool
    print(bool)
    SetNuiFocus(false, false)
    SendNUIMessage({
        type = "ui",
        status = bool,
        scores=score
    })
    end)
end
print("startato")
Citizen.CreateThread(function() 
    while true do
        
    if IsControlJustReleased(0--[[control type]],  57--[[control index]]) then--57==F10
    -- run code here
    SetDisplay(not display)
    end
    Wait(0)
end
end)

function chat(str, color)
    TriggerEvent(
        'chat:addMessage',
        {
            color = color,
            multiline = true,
            args = {str}
        }
    )
end
