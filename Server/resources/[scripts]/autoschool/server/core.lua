-----------------------------------------------------------------------------------------------------------------------------------------
-- VRP
-----------------------------------------------------------------------------------------------------------------------------------------
local Tunnel = module("vrp", "lib/Tunnel")
local Proxy = module("vrp", "lib/Proxy")
vRPC = Tunnel.getInterface("vRP")
vRP = Proxy.getInterface("vRP")
-----------------------------------------------------------------------------------------------------------------------------------------
Hensa = {}
Tunnel.bindInterface("autoschool", Hensa)
-----------------------------------------------------------------------------------------------------------------------------------------
-- VARIABLES
-----------------------------------------------------------------------------------------------------------------------------------------
local Active = {}
local SchoolPlate = {}
local LicensePrice = 1200
-----------------------------------------------------------------------------------------------------------------------------------------
-- PAYMENT
-----------------------------------------------------------------------------------------------------------------------------------------
function Hensa.Payment()
	local source = source
	local Passport = vRP.Passport(source)
	if Passport then
		if not Active[Passport] then
			Active[Passport] = true

			if not exports["hud"]:Wanted(Passport) then
				if vRP.GetDriverLicense(Passport) >= 1 then
					TriggerClientEvent("Notify", source, "amarelo", "Você já possuí <b>Carteira de Habilitação</b>.", "Atenção", 5000)
				else
					if GlobalState["Hours"] >= 08 and GlobalState["Hours"] <= 22 then
						if vRP.HasGroup(Passport, "Premium") then
							if vRP.Request(source, "Carteira de Habilitação", "Tentar tirar uma <b>Carteira de Habilitação</b> por 11 <b>$"..parseInt(LicensePrice * 0.50).."</b>?") then
								if vRP.PaymentFull(Passport, LicensePrice * 0.50) then
									Active[Passport] = nil

									Player(source)["state"]["Route"] = Passport
									SetPlayerRoutingBucket(source, Passport)

									return true
								end
							end
						else
							if vRP.Request(source, "Carteira de Habilitação", "Tentar tirar uma <b>Carteira de Habilitação</b> por <b>$"..parseInt(LicensePrice).."</b>?") then
								if vRP.PaymentFull(Passport, LicensePrice) then
									Active[Passport] = nil

									Player(source)["state"]["Route"] = Passport
									SetPlayerRoutingBucket(source, Passport)

									vRP.RemoveItem(Passport, "medicpass-"..Passport, 1, true)

									return true
								end
							end
						end
					else
						TriggerEvent("Notify", "azul", "Estamos fechados por agora, nosso horário de funcionamento é das <b>08</b> ás <b>22 Horas</b>.", "Prefeitura", 5000)
					end
				end
			end

			Active[Passport] = nil
		end
	end

	return false
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- FINISH
-----------------------------------------------------------------------------------------------------------------------------------------
function Hensa.Finish()
	local source = source
	local Passport = vRP.Passport(source)
	if Passport then
		vRP.UpdateDriverLicense(Passport, 1)
		vRP.GenerateItem(Passport, "cnh".."-"..Passport, 1, false)
	end
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- AUTOSCHOOL:SEIZECNH
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterServerEvent("autoschool:SeizeCnh")
AddEventHandler("autoschool:SeizeCnh", function(Entity)
	local source = source
	local Passport = vRP.Passport(source)
	if Passport then
		local OtherPassport = vRP.Passport(Entity)
		if vRP.GetDriverLicense(OtherPassport) == 0 then
			TriggerClientEvent("Notify", source, "amarelo", "<b>"..vRP.FullName(OtherPassport).."</b> não possúi <b>"..itemName("cnh").."</b>.", "Atenção", 5000)
		elseif vRP.GetDriverLicense(OtherPassport) == 1 then
			if vRP.Request(source, "Carteira de Habilitação", "Apreender a <b>"..itemName("cnh").."</b> de <b>"..vRP.FullName(OtherPassport).."</b>?") then
				vRP.UpdateDriverLicense(Entity, 2)
				TriggerClientEvent("Notify", Entity, "amarelo", "Você teve sua <b>"..itemName("cnh").."</b> apreendida.", "Atenção", 5000)
				TriggerClientEvent("Notify", source, "amarelo", "Você apreendeu a <b>"..itemName("cnh").."</b> de <b>"..vRP.FullName(OtherPassport).. "</b>.", "Atenção", 5000)
			end
		elseif vRP.GetDriverLicense(OtherPassport) == 2 then
			TriggerClientEvent("Notify", source, "amarelo", "<b>"..vRP.FullName(OtherPassport).."</b> já possúi a <b>"..itemName("cnh").."</b> apreendida.", "Atenção", 5000)
		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- STARTDRIVE
-----------------------------------------------------------------------------------------------------------------------------------------
function Hensa.StartDrive()
	local source = source
	local Passport = vRP.Passport(source)
	if Passport then
		SchoolPlate[Passport] = "PDMSPORT"
		TriggerEvent("plateEveryone", SchoolPlate[Passport])

		return true, SchoolPlate[Passport]
	end

	return false
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- REMOVEDRIVE
-----------------------------------------------------------------------------------------------------------------------------------------
function Hensa.RemoveDrive()
	local source = source
	local Passport = vRP.Passport(source)
	if Passport then
		TriggerEvent("plateReveryone", SchoolPlate[Passport])

		Player(source)["state"]["Route"] = 0
		SetPlayerRoutingBucket(source, 0)
	end
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- DISCONNECT
-----------------------------------------------------------------------------------------------------------------------------------------
AddEventHandler("Disconnect", function(Passport)
	if Active[Passport] then
		Active[Passport] = nil
	end

	if SchoolPlate[Passport] then
		SchoolPlate[Passport] = nil
	end
end)