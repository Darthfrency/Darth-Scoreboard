local ESX=nil
local PoliceNumber=0
local AmbulanceNumber=0
local SheriffiNumber=0
local ImportNumber=0
local MeccanicoNumber=0
local ArmeriaNumber=0
while ESX==nil  do 
TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
end
RegisterServerEvent("Add:Police")
AddEventHandler("Add:Police",function ()
    PoliceNumber=PoliceNumber+1
    print(PoliceNumber)
end)
RegisterServerEvent("Add:Sceriffi")
AddEventHandler("Add:Sceriffi",function ()
    SheriffiNumber=SheriffiNumber+1
    print(SheriffiNumber)
end)
RegisterServerEvent("Add:Ambulance")
AddEventHandler("Add:Ambulance",function ()
    AmbulanceNumber=AmbulanceNumber+1
    print(AmbulanceNumber)
end)
RegisterServerEvent("Add:Import")
AddEventHandler("Add:Import",function ()
    ImportNumber=ImportNumber+1
    print(ImportNumber)
end)
RegisterServerEvent("Add:Meccanico")
AddEventHandler("Add:Meccanico",function ()
    MeccanicoNumber=MeccanicoNumber+1
    print(MeccanicoNumber)
end)
RegisterServerEvent("Add:Armeria")
AddEventHandler("Add:Armeria",function ()
    ArmeriaNumber=ArmeriaNumber+1
    print(ArmeriaNumber)
end)










RegisterServerEvent("Remove:Police")
AddEventHandler("Remove:Police",function ()
    PoliceNumber=PoliceNumber-1
    print(PoliceNumber)
end)
RegisterServerEvent("Remove:Sceriffi")
AddEventHandler("Remove:Sceriffi",function ()
    SheriffiNumber=SheriffiNumber-1
    print(SheriffiNumber)
end)
RegisterServerEvent("Remove:Ambulance")
AddEventHandler("Remove:Ambulance",function ()
    AmbulanceNumber=AmbulanceNumber-1
    print(AmbulanceNumber)
end)
RegisterServerEvent("Remove:Import")
AddEventHandler("Remove:Import",function ()
    ImportNumber=ImportNumber-1
    print(ImportNumber)
end)
RegisterServerEvent("Remove:Meccanico")
AddEventHandler("Remove:Meccanico",function ()
    MeccanicoNumber=MeccanicoNumber-1
    print(MeccanicoNumber)
end)
RegisterServerEvent("Remove:Armeria")
AddEventHandler("Remove:Armeria",function ()
    ArmeriaNumber=ArmeriaNumber-1
    print(ArmeriaNumber)
end)




AddEventHandler('playerDropped', function (reason)
    xPlayer=ESX.GetPlayerFromId(source)
    local f=string.lower(xPlayer.job.name)
    print(f)
    if f=="police"then PoliceNumber=PoliceNumber-1 print(PoliceNumber)
    elseif f=="sceriffi" then SheriffiNumber=SheriffiNumber-1
    elseif f=="ambulance" then AmbulanceNumber=AmbulanceNumber-1
    elseif f=="import" then ImportNumber=ImportNumber-1
    elseif f=="meccanico" then MeccanicoNumber=MeccanicoNumber-1
    elseif f=="armeria" then ArmeriaNumber=ArmeriaNumber-1 end

  end)
  
  




ESX.RegisterServerCallback("Scoreboard:Lavoro", function(source, cb)
    local xPlayer=ESX.GetPlayerFromId(source) 
    print(xPlayer.job.name)
    cb(xPlayer.job.name)

end)
ESX.RegisterServerCallback('Scoreboard:GetJobs', function(source, cb)

    cb({
        PoliceNumber,
        SheriffiNumber,
        AmbulanceNumber,
        ImportNumber,
        MeccanicoNumber,
        ArmeriaNumber
    })
end)
Citizen.CreateThread(function ()
    Wait(10000)
    print("banana")
    TriggerClientEvent("client:CheckJob",-1)
end)
