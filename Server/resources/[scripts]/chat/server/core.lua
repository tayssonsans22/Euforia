-----------------------------------------------------------------------------------------------------------------------------------------
-- VRP
-----------------------------------------------------------------------------------------------------------------------------------------
local Tunnel = module("vrp", "lib/Tunnel")
local Proxy = module("vrp", "lib/Proxy")
vRPC = Tunnel.getInterface("vRP")
vRP = Proxy.getInterface("vRP")
-----------------------------------------------------------------------------------------------------------------------------------------
-- CHAT:SERVERMESSAGE
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterServerEvent("chat:ServerMessage")
AddEventHandler("chat:ServerMessage", function(Mode, Message)
	local source = source
	local Passport = vRP.Passport(source)
	if Passport then
		if not vRP.Groups()[Mode] then
			if "ooc" == Mode then
				local Messages = Message:gsub("[<>]", "")

				local Players = vRPC.ClosestPeds(source, ClosestDistance)
				for _,v in pairs(Players) do
					async(function()
						TriggerClientEvent("chat:ClientMessage", v, vRP.FullName(Passport), Messages, Mode)
					end)
				end
			else
				TriggerClientEvent("chat:ClientMessage", -1, vRP.FullName(vRP.Passport(source)), Message.gsub(Message, "[<>]", ""), Mode)
			end
		elseif vRP.HasGroup(vRP.Passport(source), Mode) then
			for _,v in pairs(vRP.NumPermission(Mode)) do
				async(function()
					TriggerClientEvent("chat:ClientMessage", v, vRP.FullName(Passport), Message.gsub(Message, "[<>]", ""), Mode)
				end)
			end
		end
	end
end)