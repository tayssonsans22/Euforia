-----------------------------------------------------------------------------------------------------------------------------------------
-- VRP
-----------------------------------------------------------------------------------------------------------------------------------------
local Tunnel = module("vrp","lib/Tunnel")
local Proxy = module("vrp","lib/Proxy")
vRPC = Tunnel.getInterface("vRP")
vRP = Proxy.getInterface("vRP")
-----------------------------------------------------------------------------------------------------------------------------------------
-- CONNECTION
-----------------------------------------------------------------------------------------------------------------------------------------
Hensa = {}
Tunnel.bindInterface("lscustoms",Hensa)
-----------------------------------------------------------------------------------------------------------------------------------------
-- VARIABLES
-----------------------------------------------------------------------------------------------------------------------------------------
local inVehicle = {}
-----------------------------------------------------------------------------------------------------------------------------------------
-- CHECKPERMISSIONS
-----------------------------------------------------------------------------------------------------------------------------------------
function Hensa.checkPermission(hasPerm)
	print("1")
	local source = source
    local Passport = vRP.Passport(source)
	if Passport then
		-- if vRP.getFines(Passport) > 0 then
		-- 	TriggerClientEvent("Notify",source,"amarelo","Multas pendentes encontradas.",3000)
		-- 	return false
		-- end

		-- if vRP.wantedReturn(Passport) then
		-- 	return false
		-- end

		if not hasPerm then
			print("3")
			return true
		else
			if vRP.HasPermission(Passport,hasPerm) then
				print("2")
				return true
			end
		end
	end

	return false
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- LSCUSTOMS:PURCHASE
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterServerEvent("lscustoms:Purchase")
AddEventHandler("lscustoms:Purchase",function(Mode,Number)
	local source = source
	local Passport = vRP.Passport(source)
	if Passport then
		if Mode == "engines" or Mode == "brakes" or Mode == "transmission" or Mode == "suspension" or Mode == "shield" then
			local Name = vRPC.VehicleName(source)
			local Price = VehiclePrice(Name)

			if Price then
				Payments["engines"] = { 999999, parseInt(Price * 0.05), parseInt(Price * 0.10), parseInt(Price * 0.20), parseInt(Price * 0.30), parseInt(Price * 0.40), parseInt(Price * 0.50) }
				Payments["brakes"] = { 999999, parseInt(Price * 0.05), parseInt(Price * 0.10), parseInt(Price * 0.20), parseInt(Price * 0.30), parseInt(Price * 0.40), parseInt(Price * 0.50) }
				Payments["transmission"] = { 999999, parseInt(Price * 0.05), parseInt(Price * 0.10), parseInt(Price * 0.20), parseInt(Price * 0.30), parseInt(Price * 0.40), parseInt(Price * 0.50) }
				Payments["suspension"] = { 999999, parseInt(Price * 0.05), parseInt(Price * 0.10), parseInt(Price * 0.20), parseInt(Price * 0.30), parseInt(Price * 0.40), parseInt(Price * 0.50) }
				Payments["shield"] = { 999999, parseInt(Price * 0.05), parseInt(Price * 0.10), parseInt(Price * 0.20), parseInt(Price * 0.30), parseInt(Price * 0.40), parseInt(Price * 0.50) }
			end

			if vRP.PaymentFull(Passport,Payments[Mode][Number]) then
				TriggerClientEvent("lscustoms:purchaseSuccessful",source)
			else
				TriggerClientEvent("lscustoms:purchaseFailed",source)
			end
		else
			if vRP.PaymentFull(Passport,Payments[Mode]) then
				TriggerClientEvent("lscustoms:purchaseSuccessful",source)
			else
				TriggerClientEvent("lscustoms:purchaseFailed",source)
			end
		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- LSCUSTOMS:VEHICLE
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterServerEvent("lscustoms:Vehicle")
AddEventHandler("lscustoms:Vehicle",function(Mods,Plate,Name)
	local Passport = vRP.PassportPlate(Plate)
	if Passport then
		vRP.Query("entitydata/SetData",{ Name = "Mods:"..Passport["Passport"]..":"..Name, Information = json.encode(Mods) })
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- LSCUSTOMS:INVEHICLE
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterServerEvent("lscustoms:inVehicle")
AddEventHandler("lscustoms:inVehicle",function(Network,Plate)
	local source = source
	local Passport = vRP.Passport(source)
	if Passport then
		if not Network then
			if inVehicle[Passport] then
				inVehicle[Passport] = nil
			end
		else
			inVehicle[Passport] = { Network,Plate }
		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- DISCONNECT
-----------------------------------------------------------------------------------------------------------------------------------------
AddEventHandler("Disconnect",function(Passport)
	if inVehicle[Passport] then
		Wait(1000)
		TriggerEvent("garages:DeleteVehicle",inVehicle[Passport][1],inVehicle[Passport][2])
		inVehicle[Passport] = nil
	end
end)