
local Tunnel = module("vrp","lib/Tunnel") 
local Proxy = module("vrp","lib/Proxy")
vRP = Proxy.getInterface("vRP")
DuMonster = {}
Tunnel.bindInterface("debug",DuMonster)
Client = Tunnel.getInterface("debug")

Citizen.CreateThread(function()
    print("^2Script Iniciado^7")
end)

RegisterCommand("debugadmin",function(source,rawCommand)
print(source)

            -- if vRP.hasGroup(Passport,"Admin",2) then
				TriggerClientEvent("debug:toogle",source)
			-- end
end)