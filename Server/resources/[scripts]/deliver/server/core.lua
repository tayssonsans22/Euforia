-----------------------------------------------------------------------------------------------------------------------------------------
-- VRP
-----------------------------------------------------------------------------------------------------------------------------------------
local Tunnel = module("vrp","lib/Tunnel")
local Proxy = module("vrp","lib/Proxy")
vRP = Proxy.getInterface("vRP")
-----------------------------------------------------------------------------------------------------------------------------------------
-- CONNECTION
-----------------------------------------------------------------------------------------------------------------------------------------
Hensa = {}
Tunnel.bindInterface("deliver",Hensa)
-----------------------------------------------------------------------------------------------------------------------------------------
-- CHECKWORK
-----------------------------------------------------------------------------------------------------------------------------------------
function Hensa.CheckWork(Work)
	local source = source
	local Passport = vRP.Passport(source)
	if Passport then
		if vRP.GetWork(Passport) == Work then
			return true
		else
			TriggerClientEvent("Notify", source, "amarelo", "Você precisa ter a sua <b>Carteira de Trabalho</b> assinada no emprego de <b>"..ClassWork(Work).."</b> para conseguir trabalhar aqui.", "Atenção", 5000)
		end

		return false
	end
end