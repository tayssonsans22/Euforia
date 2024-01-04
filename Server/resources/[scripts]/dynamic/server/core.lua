-----------------------------------------------------------------------------------------------------------------------------------------
-- VRP
-----------------------------------------------------------------------------------------------------------------------------------------
local Tunnel = module("vrp", "lib/Tunnel")
local Proxy = module("vrp", "lib/Proxy")
vRPC = Tunnel.getInterface("vRP")
vRP = Proxy.getInterface("vRP")
-----------------------------------------------------------------------------------------------------------------------------------------
-- CONNECTION
-----------------------------------------------------------------------------------------------------------------------------------------
Hensa = {}
Tunnel.bindInterface("dynamic", Hensa)
-----------------------------------------------------------------------------------------------------------------------------------------
-- VARIABLES
-----------------------------------------------------------------------------------------------------------------------------------------
local Animals = {}
-----------------------------------------------------------------------------------------------------------------------------------------
-- REGISTERANIMAL
-----------------------------------------------------------------------------------------------------------------------------------------
function Hensa.RegisterAnimal(objNet)
	local source = source
	local Passport = vRP.Passport(source)
	if Passport then
		Animals[Passport] = objNet
	end
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- CLEARANIMAL
-----------------------------------------------------------------------------------------------------------------------------------------
function Hensa.ClearAnimal()
	local source = source
	local Passport = vRP.Passport(source)
	if Passport then
		TriggerEvent("DeletePed", Animals[Passport])
		Animals[Passport] = nil
	end
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- EXPERIENCE
-----------------------------------------------------------------------------------------------------------------------------------------
function Hensa.Experience()
	local source = source
	local Passport = vRP.Passport(source)
	if Passport then
		local Experiences = {
			--["Caçador"] = vRP.GetExperience(Passport, "Hunter"),
			--["Taxista"] = vRP.GetExperience(Passport, "Taxi"),
			--["Lenhador"] = vRP.GetExperience(Passport, "Lumberman"),
			--["Correios"] = vRP.GetExperience(Passport, "PostOp"),
			["Transportador"] = vRP.GetExperience(Passport, "Transporter"),
			["Caminhoneiro"] = vRP.GetExperience(Passport, "Trucker"),
			["Reciclagem"] = vRP.GetExperience(Passport, "Garbageman"),
			["Pescador"] = vRP.GetExperience(Passport, "Fisherman"),
			["Motorista"] = vRP.GetExperience(Passport, "Driver"),
			["Reboque"] = vRP.GetExperience(Passport, "Tows"),
			--["Desmanche"] = vRP.GetExperience(Passport, "Dismantle"),
			["Entregador"] = vRP.GetExperience(Passport, "Delivery"),
			--["Corredor"] = vRP.GetExperience(Passport, "Runner")
		}

		return Experiences
	end
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- PEDSTATS
-----------------------------------------------------------------------------------------------------------------------------------------
function Hensa.PedStats()
	local source = source
	local Passport = vRP.Passport(source)
	if Passport then
		local Stats = {
			["Likes"] = vRP.GetLikes(Passport),
			["Unlikes"] = vRP.GetUnLikes(Passport)
		}

		return Stats
	end
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- CODES
-----------------------------------------------------------------------------------------------------------------------------------------
local Codes = {
	["13"] = {
		["Message"] = "Oficial desmaiado/ferido",
		["Blip"] = 6
	},
	["20"] = {
		["Message"] = "Localização",
		["Blip"] = 6
	},
	["38"] = {
		["Message"] = "Abordagem de trânsito",
		["Blip"] = 6
	},
	["78"] = {
		["Message"] = "Apoio com prioridade",
		["Blip"] = 6
	}
}
-----------------------------------------------------------------------------------------------------------------------------------------
-- DYNAMIC:TENCODE
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterServerEvent("dynamic:Tencode")
AddEventHandler("dynamic:Tencode",function(Number)
	local source = source
	local Passport = vRP.Passport(source)
	if Passport and vRP.HasService(Passport,"Policia") and Codes[Number] then
		local FullName = vRP.FullName(Passport)
		local Coords = vRP.GetEntityCoords(source)
		local Service = vRP.NumPermission("Policia")

		for Passports,Sources in pairs(Service) do
			async(function()
				vRPC.PlaySound(Sources,"ATM_WINDOW","HUD_FRONTEND_DEFAULT_SOUNDSET")
				TriggerClientEvent("NotifyPush",Sources,{ code = Number, title = Codes[Number]["Message"], x = Coords["x"], y = Coords["y"], z = Coords["z"], name = FullName, color = Codes[Number]["Blip"] })
			end)
		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- DYNAMIC:WORKSTATUS
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterServerEvent("dynamic:WorkStatus")
AddEventHandler("dynamic:WorkStatus", function(Work)
	local Passport = vRP.Passport(source)
	if Passport then
		if Work == "Sair" then
			TriggerClientEvent("dynamic:closeSystem", source)

			if vRP.Request(source, "Empregos", "Deseja se demitir do seu emprego atual?") then
				vRP.ChangeWork(Passport, "Nenhum")
			end
		elseif Work == "Bus" then
			TriggerClientEvent("dynamic:closeSystem", source)
			TriggerClientEvent("dynamic:Bus",source)
			if vRP.Request(source, "Empregos", "Deseja se registrar no emprego de <b>"..ClassWork(Work).."</b>?") then
				vRP.ChangeWork(Passport, "Bus")
			end
		elseif Work == "Taxi" then
			TriggerClientEvent("dynamic:closeSystem", source)
			TriggerClientEvent("dynamic:Taxi",source)
			if vRP.Request(source, "Empregos", "Deseja se registrar no emprego de <b>"..ClassWork(Work).."</b>?") then
				vRP.ChangeWork(Passport, "Taxi")
			end
		elseif Work == "Transporter" then
			TriggerClientEvent("dynamic:closeSystem", source)
			TriggerClientEvent("dynamic:Transport",source)
			if vRP.Request(source, "Empregos", "Deseja se registrar no emprego de <b>"..ClassWork(Work).."</b>?") then
				vRP.ChangeWork(Passport, "Transporter")
			end
		elseif Work == "Lumberman" then
			TriggerClientEvent("dynamic:closeSystem", source)
			if vRP.Request(source, "Empregos", "Deseja se registrar no emprego de <b>"..ClassWork(Work).."</b>?") then
				vRP.ChangeWork(Passport, "Lumberman")
			end
		elseif Work == "Fruitman" then
			TriggerClientEvent("dynamic:closeSystem", source)
			TriggerClientEvent("dynamic:Agro",source)
			if vRP.Request(source, "Empregos", "Deseja se registrar no emprego de <b>"..ClassWork(Work).."</b>?") then
				vRP.ChangeWork(Passport, "Fruitman")
			end
		elseif Work == "Minerman" then
			TriggerClientEvent("dynamic:closeSystem", source)
			TriggerClientEvent("dynamic:Miner",source)
			if vRP.Request(source, "Empregos", "Deseja se registrar no emprego de <b>"..ClassWork(Work).."</b>?") then
				--TriggerClientEvent("dynamic:Miner",source)
				vRP.ChangeWork(Passport, "Minerman")
			end
		elseif Work == "Milkman" then
			TriggerClientEvent("dynamic:closeSystem", source)
			TriggerClientEvent("dynamic:Milkman",source)

			if vRP.Request(source, "Empregos", "Deseja se registrar no emprego de <b>"..ClassWork(Work).."</b>?") then
				vRP.ChangeWork(Passport, "Milkman")
			end
		elseif Work == "Garbageman" then
			TriggerClientEvent("dynamic:closeSystem", source)
			TriggerClientEvent("dynamic:Garbageman",source) -- EXEMPLO
			if vRP.Request(source, "Empregos", "Deseja se registrar no emprego de <b>"..ClassWork(Work).."</b>?") then
				vRP.ChangeWork(Passport, "Garbageman")
			end
		elseif Work == "Diver" then
			TriggerClientEvent("dynamic:closeSystem", source)

			if vRP.Request(source, "Empregos", "Deseja se registrar no emprego de <b>"..ClassWork(Work).."</b>?") then
				vRP.ChangeWork(Passport, "Diver")
			end
		elseif Work == "Tows" then
			TriggerClientEvent("dynamic:closeSystem", source)

			if vRP.Request(source, "Empregos", "Deseja se registrar no emprego de <b>"..ClassWork(Work).."</b>?") then
				vRP.ChangeWork(Passport, "Tows")
			end
		elseif Work == "PostOp" then
			TriggerClientEvent("dynamic:closeSystem", source)

			if vRP.Request(source, "Empregos", "Deseja se registrar no emprego de <b>"..ClassWork(Work).."</b>?") then
				vRP.ChangeWork(Passport, "PostOp")
			end
		elseif Work == "Trucker" then
			TriggerClientEvent("dynamic:closeSystem", source)
			TriggerClientEvent("dynamic:Trucker",source)
			if vRP.Request(source, "Empregos", "Deseja se registrar no emprego de <b>"..ClassWork(Work).."</b>?") then
				vRP.ChangeWork(Passport, "Trucker")
			end
		elseif Work == "Cleaner" then
			TriggerClientEvent("dynamic:closeSystem", source)
			TriggerClientEvent("dynamic:Cleaner",source)
			if vRP.Request(source, "Empregos", "Deseja se registrar no emprego de <b>"..ClassWork(Work).."</b>?") then
				vRP.ChangeWork(Passport, "Cleaner")
			end
		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- DISCONNECT
-----------------------------------------------------------------------------------------------------------------------------------------
AddEventHandler("Disconnect", function(Passport)
	if Animals[Passport] then
		TriggerEvent("DeletePed", Animals[Passport])
		Animals[Passport] = nil
	end
end)