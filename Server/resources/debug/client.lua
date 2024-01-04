
local Tunnel = module("vrp","lib/Tunnel") 
local Proxy = module("vrp","lib/Proxy")
vRP = Proxy.getInterface("vRP")

DuMonster = {}
Tunnel.bindInterface("debug",DuMonster)
Server = Tunnel.getInterface("debug")

local toogle = false

RegisterNetEvent("debug:toogle")
AddEventHandler("debug:toogle",function()
    if toogle == false then
        toogle = true 
        debugAdm()
        drawNotification("~g~DEPURAÇÃO LIGADA.")
    elseif toogle == true then 
        toogle = false 
        debugAdm()
        drawNotification("~r~DEPURAÇÃO DESLIGADO.")
    end
end)

local R = 255
local G = 255
local B = 255
local A = 255

local FpsOne = nil
local FpsTwo = nil
local frameNumTwo = {} 

Citizen.CreateThread(function()
    while true do
        local startCount = GetFrameCount()
        Wait(1000)
        local endCount = GetFrameCount()
        local frameNum = endCount - startCount
        frameNumTwo = frameNum
    end
end)

debugAdm = function()
    Citizen.CreateThread( function()
        while true do
            Citizen.Wait(1)
            if toogle then
                local Ped = GetPlayerPed(-1)
                local Cds = GetEntityCoords(Ped)
                local vehicle = GetVehiclePedIsIn(Ped)
                
                DrawLine(Cds,GetOffsetFromEntityInWorldCoords(Ped, 0, 1.0, 0.0), 255,0,0,255)
                DrawLine(Cds,GetOffsetFromEntityInWorldCoords(Ped, 0, -1.0, 0.0), 255,0,0,255)
                DrawLine(Cds,GetOffsetFromEntityInWorldCoords(Ped, 1.0, 0.0, 0.0), 255,255,0,255)
                DrawLine(Cds,GetOffsetFromEntityInWorldCoords(Ped, -1.0, 0.0, 0.0) , 255,255,0,255)
                DrawLine(GetOffsetFromEntityInWorldCoords(Ped, 0, 1.0, 0.0),GetOffsetFromEntityInWorldCoords(Ped, 0, 2.0, 0.0), 255,0,255,255)
                DrawLine(GetOffsetFromEntityInWorldCoords(Ped, 0, -1.0, 0.0),GetOffsetFromEntityInWorldCoords(Ped, 0, -2.0, 0.0), 255,0,255,255)
                DrawLine(GetOffsetFromEntityInWorldCoords(Ped, 1.0, 0.0, 0.0),GetOffsetFromEntityInWorldCoords(Ped, 2.0, 0.0, 0.0), 255,255,255,255)
                DrawLine(GetOffsetFromEntityInWorldCoords(Ped, -1.0, 0.0, 0.0) ,GetOffsetFromEntityInWorldCoords(Ped, -2.0, 0.0, 0.0), 255,255,255,255)

                drawTxtS(0.03, 0.12,0.0,0.0,0.0, "GERAL:",R,G,B,A)
                drawTxtS(0.03, 0.14,0.0,0.0,0.0, "FPS: " ..frameNumTwo,R,G,B,A)
                drawTxtS(0.03, 0.16,0.0,0.0,0.0, "BIULD: " ..GetGameBuildNumber(),R,G,B,A)
                drawTxtS(0.03, 0.18,0.0,0.0,0.0, "FRAME TIME: " ..GetGameTimer() - GetGameTimer() / 1000,R,G,B,A)
            
                drawTxtS(0.03, 0.28,0.0,0.0,0.0, "PLAYER:",R,G,B,A)
                drawTxtS(0.03, 0.30,0.0,0.0,0.0, "VIDA MÁXIMA: " .. GetEntityMaxHealth(Ped),R,G,B,A)
                drawTxtS(0.03, 0.32,0.0,0.0,0.0, "VIDA: " .. GetEntityHealth(Ped),R,G,B,A)
                drawTxtS(0.03, 0.34,0.0,0.0,0.0, "COLETE: " .. GetPedArmour(Ped),R,G,B,A)
                drawTxtS(0.03, 0.36,0.0,0.0,0.0, "VELOCIDADE: " .. GetEntitySpeed(Ped),R,G,B,A)
                drawTxtS(0.03, 0.38, 0.0,0.0,0.0, "ARMA: " .. GetSelectedPedWeapon(Ped),R,G,B,A)
                drawTxtS(0.03, 0.40, 0.0,0.0,0.0, "HASH: " .. GetEntityModel(Ped),R,G,B,A) 
                drawTxtS(0.03, 0.42, 0.0,0.0,0.0, "MODELO: " .. GetEntityArchetypeName(Ped),R,G,B,A) 
                drawTxtS(0.03, 0.44, 0.0,0.0,0.0, "COORDENADA: " .. GetEntityCoords(Ped),R,G,B,A) 

                if IsPedInAnyVehicle(PlayerPedId(), false) then
                    drawTxtS(0.03, 0.54, 0.0,0.0,0.0, "VEÍCULO:",R,G,B,A) 
                    drawTxtS(0.03, 0.56, 0.0,0.0,0.0, "HASH: ".. GetEntityModel(vehicle),R,G,B,A) 
                    drawTxtS(0.03, 0.58, 0.0,0.0,0.0, "MODELO: ".. GetDisplayNameFromVehicleModel(GetEntityModel(vehicle)),R,G,B,A) 
                    drawTxtS(0.03, 0.60, 0.0,0.0,0.0, "NÚMERO DE ASSENTOS: ".. GetVehicleMaxNumberOfPassengers(vehicle) + 1,R,G,B,A) 
                    drawTxtS(0.03, 0.62, 0.0,0.0,0.0, "ESTADO DO MOTOR: ".. GetVehicleEngineHealthDetailed(vehicle),R,G,B,A) 
                    if GetVehicleLivery(vehicle) == -1 then
                        libery = "NENHUMA"
                    else
                        libery = GetVehicleLivery(vehicle)
                    end
                    drawTxtS(0.03, 0.64, 0.0,0.0,0.0, "LIBERY: ".. libery,R,G,B,A)
                    drawTxtS(0.03, 0.66, 0.0,0.0,0.0, "PLACA: ".. GetVehicleNumberPlateText(vehicle),R,G,B,A)
                    drawTxtS(0.03, 0.68, 0.0,0.0,0.0, "NET: ".. NetworkGetNetworkIdFromEntity(vehicle),R,G,B,A)
                    drawTxtS(0.03, 0.70, 0.0,0.0,0.0, "VELOCIDADE MÁXIMA: ".. ConvertMph(GetVehicleEstimatedMaxSpeed(vehicle)),R,G,B,A)
                    drawTxtS(0.03, 0.72, 0.0,0.0,0.0, "VELOCIDADE: ".. ConvertMph(GetEntitySpeed(Ped)),R,G,B,A)
                end

                Object()
                Vehicle()
                getNPC()
            end
        end
    end)
end

ConvertMph = function(Mph)
    return Mph * 1.60934421012
end

GetVehicleEngineHealthDetailed = function(vehicle)
    local engine_health = GetVehicleEngineHealth(vehicle)
    if engine_health < 300 then
        local engine_health_text = 'DANIFICADO'

        if engine_health <= 0 then 
            engine_health_text = 'ESTRAGADO'
        end
        return engine_health_text
    else
        return 'SAUDÁVEL'
    end
end

canPedBeUsed = function(ped)
    if ped == nil then
        return false
    end
    if ped == GetPlayerPed(-1) then
        return false
    end
    if not DoesEntityExist(ped) then
        return false
    end
    return true
end

Vehicle = function()
    local Ped = GetPlayerPed(-1)
    local Cds = GetEntityCoords(Ped)
    local handle, ped = FindFirstVehicle()
    local success
    local rped = nil
    local distanceFrom
    repeat
        local cds = GetEntityCoords(ped)
        local distance = GetDistanceBetweenCoords(Cds, cds, true)
        if canPedBeUsed(ped) and distance < 30.0 and (distanceFrom == nil or distance < distanceFrom) then
            distanceFrom = distance
            rped = ped
	    	if IsEntityTouchingEntity(Ped, ped) then
                DrawText3Ds(cds["x"],cds["y"],cds["z"]+1, "Obj: " .. GetEntityArchetypeName(ped))
                DrawText3Ds(cds["x"],cds["y"],cds["z"]+0.80, "Model: " .. GetEntityModel(ped))
                DrawText3Ds(cds["x"],cds["y"],cds["z"]+0.60, "Hash: " .. ped)
                DrawText3Ds(cds["x"],cds["y"],cds["z"]+0.40, "IN CONTACT")
	    	else
	    		DrawText3Ds(cds["x"],cds["y"],cds["z"]+1, "Obj: " .. GetEntityArchetypeName(ped))
                DrawText3Ds(cds["x"],cds["y"],cds["z"]+0.80, "Model: " .. GetEntityModel(ped))
                DrawText3Ds(cds["x"],cds["y"],cds["z"]+0.60, "Hash: " .. ped)
	    	end
        end
        success, ped = FindNextVehicle(handle)
    until not success
    EndFindVehicle(handle)
    return rped
end

Object = function()
    local Ped = GetPlayerPed(-1)
    local Cds = GetEntityCoords(Ped)
    local handle, Ply = FindFirstObject()
    local success
    local rped = nil
    local distanceFrom
    repeat
        local cds = GetEntityCoords(ped)
        local distance = GetDistanceBetweenCoords(Cds, cds, true)
        if distance < 5.0 then
            distanceFrom = distance
            rped = ped
	    	if IsEntityTouchingEntity(GetPlayerPed(-1), ped) then
                DrawText3Ds(cds["x"],cds["y"],cds["z"]+1, "Obj: " .. GetEntityArchetypeName(ped))
                DrawText3Ds(cds["x"],cds["y"],cds["z"]+0.80, "Model: " .. GetEntityModel(ped))
                DrawText3Ds(cds["x"],cds["y"],cds["z"]+0.60, "Hash: " .. ped)
                DrawText3Ds(cds["x"],cds["y"],cds["z"]+0.40, "IN CONTACT")
	    	else
	    		DrawText3Ds(cds["x"],cds["y"],cds["z"]+1, "Obj: " .. GetEntityArchetypeName(ped))
                DrawText3Ds(cds["x"],cds["y"],cds["z"]+0.80, "Model: " .. GetEntityModel(ped))
                DrawText3Ds(cds["x"],cds["y"],cds["z"]+0.60, "Hash: " .. ped)
	    	end
        end
        success, ped = FindNextObject(handle)
    until not success
    EndFindObject(handle)
    return rped
end

getNPC = function()
    local Ped = GetPlayerPed(-1)
    local cds = GetEntityCoords(playerped)
    local handle, ped = FindFirstPed()
    local success
    local rped = nil
    local distanceFrom
    repeat
        local cds = GetEntityCoords(ped)
        local distance = GetDistanceBetweenCoords(Cds, pos, true)
        if canPedBeUsed(ped) and distance < 30.0 and (distanceFrom == nil or distance < distanceFrom) then
            distanceFrom = distance
            rped = ped

	    	if IsEntityTouchingEntity(GetPlayerPed(-1), ped) then
	    		DrawText3Ds(cds["x"],cds["y"],cds["z"]+1, "Obj: " .. GetEntityArchetypeName(ped))
                DrawText3Ds(cds["x"],cds["y"],cds["z"]+0.80, "Model: " .. GetEntityModel(ped))
                DrawText3Ds(cds["x"],cds["y"],cds["z"]+0.60, "Hash: " .. ped)
                DrawText3Ds(cds["x"],cds["y"],cds["z"]+0.60, "POS: " .. GetPedRelationshipGroupHash(ped))
                DrawText3Ds(cds["x"],cds["y"],cds["z"]+0.40, "IN CONTACT")
	    	else
	    		DrawText3Ds(cds["x"],cds["y"],cds["z"]+1, "Obj: " .. GetEntityArchetypeName(ped))
                DrawText3Ds(cds["x"],cds["y"],cds["z"]+0.80, "Model: " .. GetEntityModel(ped))
                DrawText3Ds(cds["x"],cds["y"],cds["z"]+0.60, "Hash: " .. ped)
                DrawText3Ds(cds["x"],cds["y"],cds["z"]+0.60, "POS: " .. GetPedRelationshipGroupHash(ped))
	    	end

            FreezeEntityPosition(ped, inFreeze)
        end
        success, ped = FindNextPed(handle)
    until not success
    EndFindPed(handle)
    return rped
end

drawTxtS = function(x,y ,width,height,scale, text, r,g,b,a)
    SetTextFont(0)
    SetTextProportional(0)
    SetTextScale(0.25, 0.25)
    SetTextColour(r, g, b, a)
    SetTextDropShadow(0, 0, 0, 0,255)
    SetTextEdge(1, 0, 0, 0, 255)
    SetTextDropShadow()
    SetTextOutline()
    SetTextEntry("STRING")
    AddTextComponentString(text)
    DrawText(x - width/2, y - height/2 + 0.005)
end

DrawText3Ds = function(x,y,z, text)
    local onScreen,_x,_y=World3dToScreen2d(x,y,z)
    local px,py,pz=table.unpack(GetGameplayCamCoords())
    
    SetTextScale(0.35, 0.35)
    SetTextFont(4)
    SetTextProportional(1)
    SetTextColour(255, 255, 255, 255)
    SetTextEntry("STRING")
    SetTextCentre(1)
    AddTextComponentString(text)
    DrawText(_x,_y)
    local factor = (string.len(text)) / 370
    DrawRect(_x,_y+0.0125, 0.015+ factor, 0.03, 0, 0, 0, 100)
end

drawNotification = function(string)
	SetNotificationTextEntry("STRING")
	AddTextComponentString(string)
	DrawNotification(true, false)
end
