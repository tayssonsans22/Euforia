-----------------------------------------------------------------------------------------------------------------------------------------
-- VRP
-----------------------------------------------------------------------------------------------------------------------------------------
local Tunnel = module("vrp", "lib/Tunnel")
-----------------------------------------------------------------------------------------------------------------------------------------
-- CONNECTION
-----------------------------------------------------------------------------------------------------------------------------------------
vSERVER = Tunnel.getInterface("service") -----------------------------------------------------------------------------------------------------------------------------------------
-- LIST
-----------------------------------------------------------------------------------------------------------------------------------------
local List = {
	{ vec3(440.19,-975.17,30.53),  "Policia",      1.0 },
	{ vec3(1840.20, 2578.48, 46.07), "Presidio",     1.0 },
	{ vec3(310.23, -597.54, 43.29),  "Paramedico-1", 1.0 },
	{ vec3(-254.77, 6331.03, 32.79), "Paramedico-2", 1.5 },
	{ vec3(820.71,-932.38,26.31), "Mecanico-1",   1.0 },
	{ vec3(-1148.13, -1999.76, 13.66), "Mecanico-2", 1.0 },
	{ vec3(1171.49, 2637.35, 38.26), "Mecanico-3",   1.0 },
	{ vec3(111.0, 6631.16, 32.22),   "Mecanico-4",   1.0 },
	{ vec3(724.38, -1071.63, 23.56), "Mecanico-5",   1.0 },
	{ vec3(-206.07, -1327.51, 31.35), "Mecanico-6",  1.0 },
	{ vec3(-1198.55, -904.76, 14.4), "Burgershot",   1.0 }
}
-----------------------------------------------------------------------------------------------------------------------------------------
-- THREADSTART
-----------------------------------------------------------------------------------------------------------------------------------------
CreateThread(function()
	for Number = 1, #List do
		exports["target"]:AddCircleZone("Service:" .. List[Number][2], List[Number][1], 0.15, {
			name = "Service:" .. List[Number][2],
			heading = 0.0,
			useZ = true
		}, {
			shop = Number,
			Distance = List[Number][3],
			options = {
				{
					label = "Entrar em Serviço",
					event = "service:Toggle",
					tunnel = "shop"
				}
			}
		})
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- SERVICE:TOGGLE
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNetEvent("service:Toggle")
AddEventHandler("service:Toggle", function(Service)
	TriggerServerEvent("service:Toggle", List[Service][2])
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- SERVICE:LABEL
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNetEvent("service:Label")
AddEventHandler("service:Label", function(Service, Text)
	if Service == "Policia" then
		exports["target"]:LabelText("Service:Policia", Text)
	elseif Service == "Paramedico" then
		exports["target"]:LabelText("Service:Paramedico-1", Text)
		exports["target"]:LabelText("Service:Paramedico-2", Text)
	elseif Service == "Mecanico" then
		exports["target"]:LabelText("Service:Mecanico-1", Text)
		exports["target"]:LabelText("Service:Mecanico-2", Text)
		exports["target"]:LabelText("Service:Mecanico-3", Text)
		exports["target"]:LabelText("Service:Mecanico-4", Text)
		exports["target"]:LabelText("Service:Mecanico-5", Text)
		exports["target"]:LabelText("Service:Mecanico-6", Text)
	else
		exports["target"]:LabelText("Service:" .. Service, Text)
	end
end)