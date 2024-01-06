-----------------------------------------------------------------------------------------------------------------------------------------
-- VRP
-----------------------------------------------------------------------------------------------------------------------------------------
local Tunnel = module("vrp", "lib/Tunnel")
-----------------------------------------------------------------------------------------------------------------------------------------
-- CONNECTION
-----------------------------------------------------------------------------------------------------------------------------------------
Hensa = {}
Tunnel.bindInterface("shops", Hensa)
vSERVER = Tunnel.getInterface("shops")
-----------------------------------------------------------------------------------------------------------------------------------------
-- CLOSE
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNUICallback("close", function(Data, Callback)
	SendNUIMessage({ Action = "Close" })
	SetNuiFocus(false, false)

	Callback("Ok")
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- REQUEST
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNUICallback("Request", function(Data, Callback)
	if MumbleIsConnected() then
		local inventoryShop, inventoryUser, invPeso, invMaxpeso, shopSlots = vSERVER.Request(Data["shop"])
		if inventoryShop then
			Callback({ inventoryShop = inventoryShop, inventoryUser = inventoryUser, invPeso = invPeso, invMaxpeso = invMaxpeso, shopSlots = shopSlots })
		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- REQUESTBUY
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNUICallback("functionShops", function(Data, Callback)
	if MumbleIsConnected() then
		vSERVER.functionShops(Data["shop"], Data["item"], Data["amount"], Data["slot"])
	end

	Callback("Ok")
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- POPULATESLOT
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNUICallback("populateSlot", function(Data, Callback)
	TriggerServerEvent("shops:populateSlot", Data["item"], Data["slot"], Data["target"], Data["amount"])

	Callback("Ok")
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- UPDATESLOT
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNUICallback("updateSlot", function(Data, Callback)
	TriggerServerEvent("shops:updateSlot", Data["item"], Data["slot"], Data["target"], Data["amount"])

	Callback("Ok")
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- UPDATE
-----------------------------------------------------------------------------------------------------------------------------------------
function Hensa.Update(Action)
	SendNUIMessage({ Action = Action })
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- LIST
-----------------------------------------------------------------------------------------------------------------------------------------
local List = {
	{ -545.27,  -203.9,   38.22,  "Identity",    false, 2.75, true,  "Prefeitura" },
	{ -544.76,  -185.81,  52.2,   "Identity2",   false, 2.0,  false, "Prefeitura" },
	{ 73.96,    -1393.01, 29.37,  "Skinshop",    true,  2.0,  false, "Loja de Roupas" },
	{ -709.23,  -151.35,  37.41,  "Skinshop",    true,  2.0,  false, "Loja de Roupas" },
	{ -165.08,  -303.46,  39.73,  "Skinshop",    true,  2.0,  false, "Loja de Roupas" },
	{ -823.12,  -1072.36, 11.32,  "Skinshop",    true,  2.0,  false, "Loja de Roupas" },
	{ -1193.89, -767.02,  17.3,   "Skinshop",    true,  2.0,  false, "Loja de Roupas" },
	{ -1448.61, -237.61,  49.81,  "Skinshop",    true,  2.0,  false, "Loja de Roupas" },
	{ 5.82,     6511.47,  31.88,  "Skinshop",    true,  2.0,  false, "Loja de Roupas" },
	{ 1695.3,   4823.0,   42.06,  "Skinshop",    true,  2.0,  false, "Loja de Roupas" },
	{ 126.91,   -224.28,  54.56,  "Skinshop",    true,  2.0,  false, "Loja de Roupas" },
	{ 613.01,   2762.79,  42.09,  "Skinshop",    true,  2.0,  false, "Loja de Roupas" },
	{ 1196.64,  2711.62,  38.22,  "Skinshop",    true,  2.0,  false, "Loja de Roupas" },
	{ -3169.42, 1043.13,  20.86,  "Skinshop",    true,  2.0,  false, "Loja de Roupas" },
	{ -1102.41, 2711.57,  19.11,  "Skinshop",    true,  2.0,  false, "Loja de Roupas" },
	{ 426.97,   -806.17,  29.49,  "Skinshop",    true,  2.0,  false, "Loja de Roupas" },
	{ 963.31,   19.17,    71.46,  "Skinshop",    true,  2.0,  false, "Loja de Roupas" },
	{ 24.51,    -1346.75, 29.49,  "Departament", true,  2.0,  false, "Loja de Departamentos" },
	{ 2556.77,  380.87,   108.61, "Departament", true,  2.0,  false, "Loja de Departamentos" },
	{ 1164.81,  -323.61,  69.2,   "Departament", true,  2.0,  false, "Loja de Departamentos" },
	{ -706.16,  -914.55,  19.21,  "Departament", true,  2.0,  false, "Loja de Departamentos" },
	{ -47.35,   -1758.59, 29.42,  "Departament", true,  2.0,  false, "Loja de Departamentos" },
	{ 372.7,    326.89,   103.56, "Departament", true,  2.0,  false, "Loja de Departamentos" },
	{ -3242.7,  1000.05,  12.82,  "Departament", true,  2.0,  false, "Loja de Departamentos" },
	{ 1728.08,  6415.6,   35.03,  "Departament", true,  2.0,  false, "Loja de Departamentos" },
	{ 549.09,   2670.89,  42.16,  "Departament", true,  2.0,  false, "Loja de Departamentos" },
	{ 1959.87,  3740.44,  32.33,  "Departament", true,  2.0,  false, "Loja de Departamentos" },
	{ 2677.65,  3279.66,  55.23,  "Departament", true,  2.0,  false, "Loja de Departamentos" },
	{ 1697.32,  4923.46,  42.06,  "Departament", true,  2.0,  false, "Loja de Departamentos" },
	{ -1819.52, 793.48,   138.08, "Departament", true,  2.0,  false, "Loja de Departamentos" },
	{ 1391.62,  3605.95,  34.98,  "Departament", true,  2.0,  false, "Loja de Departamentos" },
	{ -2966.41, 391.52,   15.05,  "Departament", true,  2.0,  false, "Loja de Departamentos" },
	{ -3039.42, 584.42,   7.9,    "Departament", true,  2.0,  false, "Loja de Departamentos" },
	{ 1134.32,  -983.09,  46.4,   "Departament", true,  2.0,  false, "Loja de Departamentos" },
	{ 1165.32,  2710.79,  38.15,  "Departament", true,  2.0,  false, "Loja de Departamentos" },
	{ -1486.72, -377.61,  40.15,  "Departament", true,  2.0,  false, "Loja de Departamentos" },
	{ -1221.48, -907.93,  12.32,  "Departament", true,  2.0,  false, "Loja de Departamentos" },
	{ -160.62,  6320.89,  31.58,  "Departament", true,  2.0,  false, "Loja de Departamentos" },
	-- { -1083.08, -245.85,  37.76,  "Premium",     true,  2.0,  false, "Life Invader" },
	{ 1692.27,  3760.91,  34.69,  "Ammunation",  false, 2.0,  true,  "Loja de Armas" },
	{ 253.80,   -50.47,   69.94,  "Ammunation",  false, 2.0,  true,  "Loja de Armas" },
	{ 842.54,   -1035.25, 28.19,  "Ammunation",  false, 2.0,  true,  "Loja de Armas" },
	{ -331.67,  6084.86,  31.46,  "Ammunation",  false, 2.0,  true,  "Loja de Armas" },
	{ -662.37,  -933.58,  21.82,  "Ammunation",  false, 2.0,  true,  "Loja de Armas" },
	{ -1304.12, -394.56,  36.7,   "Ammunation",  false, 2.0,  true,  "Loja de Armas" },
	{ -1118.98, 2699.73,  18.55,  "Ammunation",  false, 2.0,  true,  "Loja de Armas" },
	{ 2567.98,  292.62,   108.73, "Ammunation",  false, 2.0,  true,  "Loja de Armas" },
	{ -3173.51, 1088.35,  20.84,  "Ammunation",  false, 2.0,  true,  "Loja de Armas" },
	{ 22.53,    -1105.52, 29.79,  "Ammunation",  false, 2.0,  true,  "Loja de Armas" },
	{ 810.22,   -2158.99, 29.62,  "Ammunation",  false, 2.0,  true,  "Loja de Armas" },
	{ -1377.96, 4293.46,  4.11,  "Fishing",     false, 2.0,  false, "Loja de Pesca" },
	-- { -679.13,  5839.52,  17.3,   "Hunting",     false, 2.0,  false, "Loja de Caça" },
	{ 2001.07,5112.39,43.4,  "Fruits",      false, 2.0,  false, "Loja de Frutas" },
	{ 2436.05,4773.97,34.65,  "Milkman",      false, 2.0,  false, "Loja de Utilitarios" },
	{ 2005.27,5106.96,43.39,  "Fruits_HATCHET",      false, 2.0,  false, "Loja de Machado" },
	{ -172.89,  6381.32,  31.48,  "Pharmacy",    false, 2.0,  false, "Farmácia" },
	{ 1690.07,  3581.68,  35.62,  "Pharmacy",    false, 2.0,  false, "Farmácia" },
	{ 326.5,    -1074.43, 29.47,  "Pharmacy",    false, 2.0,  false, "Farmácia" },
	{ 114.39,   -4.85,    67.82,  "Pharmacy",    false, 2.0,  false, "Farmácia" },
	{ 213.75,   -1835.36, 27.57,  "Pharmacy",    false, 2.0,  false, "Farmácia" },
	{ 311.97,   -597.66,  43.29,  "Paramedico",  false, 2.0,  false, "Loja de Medicamentos" },
	{ -254.64,  6326.95,  32.82,  "Paramedico",  false, 2.0,  false, "Loja de Medicamentos" },
	{ -428.54,  -1728.29, 19.78,  "Recycle",     false, 2.0,  false, "Loja de Reciclagem" },
	{ 180.07,   2793.29,  45.65,  "Recycle",     false, 2.0,  false, "Loja de Reciclagem" },
	{ -195.42,  6264.62,  31.49,  "Recycle",     false, 2.0,  false, "Loja de Reciclagem" },
	{ 452.97,   -980.0,   30.69,   "Policia",     false, 2.0,  false, "Arsenal" },
	{ 1839.01,  3686.68,  33.98,  "Policia",     false, 2.0,  false, "Arsenal" },
	{ -447.67,  6016.95,  36.8,   "Policia",     false, 2.0,  false, "Arsenal" },
	{ 385.48,   800.36,   190.14, "Policia",     false, 2.0,  false, "Arsenal" },
	{ 361.94,   -1603.71, 25.26,  "Policia",     false, 2.0,  false, "Arsenal" },
	{ 2834.77,	2806.82,  57.73,   "Miners",      false, 2.0,  false, "Loja de Minérios" },
	{ 2833.86,	2808.6,	  57.75,   "Miners2",      false, 2.0,  false, "Loja de Minérios" },
	--{ -195.15,  3651.33,  51.73,  "Criminal",    false, 2.0,  false, "Loja de Ilegalidades" },
	--{ 904.34,   3656.56,  32.57,  "Criminal2",   false, 2.0,  false, "Loja de Ilegalidades" },
	--{ 2450.88,  3759.53,  41.7,   "Criminal3",   false, 2.0,  false, "Loja de Ilegalidades" },
	--{ 1901.86,  4925.07,  48.86,  "Criminal4",   false, 2.0,  false, "Loja de Ilegalidades" },
	--{ 717.93,   4183.65,  40.71,  "Criminal5",   false, 2.0,  false, "Loja de Ilegalidades" },
	{ -1636.74, -1092.17, 13.08,  "Oxy",         false, 2.0,  true,  "Loja de Remédios" },
	{ -1195.42,-892.93,13.98,  "BurgerShot",         false, 2.0,  false, "Restaurante" },
	{ -1193.39,-893.57,14.01,  "BurgerShot",         false, 2.0,  false, "Restaurante" },
	{ -1191.47,-894.09,14.03,  "BurgerShot",         false, 2.0,  false, "Restaurante" },
	{ -1197.45,-892.46,13.99,  "BurgerShot",         false, 2.0,  false, "Restaurante" },
	{ -1174.54, -1571.4,  4.35,   "Weeds",       false, 2.0,  true,  "Loja de Tabacos" },
	---{ 990.22,   32.26,    71.87,  "Casino",      false, 2.0,  true,  "Loja de Tickets" },
	-- -{ 989.35,   30.86,    71.86,  "Casino",      false, 2.0,  true,  "Loja de Tickets" },
	{ 981.33,   26.57,    71.74,  "Drinks",      false, 2.0,  true,  "Bar" },
	{ 987.83,   -95.28,   74.85,  "Drinks",      false, 2.0,  true,  "Bar" },
	{ 100.99,   3605.58,  40.49,  "Drinks",      false, 2.0,  true,  "Bar" },
	{ -2.41,    -1827.17, 29.15,  "Drinks",      false, 2.0,  true,  "Bar" },
	{ -157.19,  -1611.54, 33.65,  "Drinks",      false, 2.0,  true,  "Bar" },
	{ 336.64,   -1989.09, 24.2,   "Drinks",      false, 2.0,  true,  "Bar" },
	{ 493.64,   -1531.79, 29.28,  "Drinks",      false, 2.0,  true,  "Bar" },
	{ 1255.55,  -1566.21, 58.35,  "Drinks",      false, 2.0,  true,  "Bar" },
	{ -1653.73, -1062.23, 12.15,  "Drinks",      false, 2.0,  true,  "Bar" },
	{ 1420.99,  6336.16,  23.32,  "Drinks",      false, 2.0,  true,  "Bar" },
	{ 2194.73,  5581.52,  53.36,  "Drinks",      false, 2.0,  true,  "Bar" },
	{ 149.24,   -3013.46, 7.04,   "Drinks",      false, 2.0,  true,  "Bar" },
	{ 890.28,   -1039.54, 35.35,  "Drinks",      false, 2.0,  true,  "Bar" }
}
-----------------------------------------------------------------------------------------------------------------------------------------
-- MATERIALS
-----------------------------------------------------------------------------------------------------------------------------------------
local Materials = {
	{
		["Coords"] = vec3(46.67, -1749.79, 29.62),
		["Hours"] = 12
	}, {
		["Coords"] = vec3(2747.29, 3473.06, 55.67),
		["Hours"] = 20
	}
}
-----------------------------------------------------------------------------------------------------------------------------------------
-- MECHANICS
-----------------------------------------------------------------------------------------------------------------------------------------
local Mechanics = { 
	{
		["Coords"] = vec3(840.39,-983.45,26.32)
	}, {
		["Coords"] = vec3(840.39,-973.65,26.32)
	}, {
		["Coords"] = vec3(840.39,-966.5,26.32)
	}, {
		["Coords"] = vec3(840.39,-956.96,26.32)
	}, {
		["Coords"] = vec3(840.29,-947.74,26.32)
	}
}
-----------------------------------------------------------------------------------------------------------------------------------------
-- SHOPS:OPEN
-----------------------------------------------------------------------------------------------------------------------------------------
AddEventHandler("shops:Open", function(Number)
	if MumbleIsConnected() then
		if vSERVER.Permission(List[Number][4]) then
			if List[Number][7] then
				-- if GetClockHours() >= 08 and GetClockHours() <= 23 then
					SetNuiFocus(true, true)
					SendNUIMessage({ Action = "Open", name = List[Number][4], type = vSERVER.ShopType(List[Number][4]) })

					if List[Number][5] then
						TriggerEvent("sounds:Private", "shop", 0.5)
					end
				-- else
				-- 	TriggerEvent("Notify", "azul", "Estamos fechados por agora, nosso horário de funcionamento é das <b>08</b> ás <b>23 Horas</b>.", List[Number][8], 5000)
				-- end
			else
				SetNuiFocus(true, true)
				SendNUIMessage({ Action = "Open", name = List[Number][4], type = vSERVER.ShopType(List[Number][4]) })

				if List[Number][5] then
					TriggerEvent("sounds:Private", "shop", 0.5)
				end
			end
		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- SHOPS:COFFEE
-----------------------------------------------------------------------------------------------------------------------------------------
AddEventHandler("shops:Coffee", function()
	SendNUIMessage({ Action = "Open", name = "Coffee", type = "Buy" })
	SetNuiFocus(true, true)
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- SHOPS:SODA
-----------------------------------------------------------------------------------------------------------------------------------------
AddEventHandler("shops:Soda", function()
	SendNUIMessage({ Action = "Open", name = "Soda", type = "Buy" })
	SetNuiFocus(true, true)
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- SHOPS:DONUT
-----------------------------------------------------------------------------------------------------------------------------------------
AddEventHandler("shops:Donut", function()
	SendNUIMessage({ Action = "Open", name = "Donut", type = "Buy" })
	SetNuiFocus(true, true)
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- SHOPS:HAMBURGER
-----------------------------------------------------------------------------------------------------------------------------------------
AddEventHandler("shops:Hamburger", function()
	SendNUIMessage({ Action = "Open", name = "Hamburger", type = "Buy" })
	SetNuiFocus(true, true)
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- SHOPS:HOTDOG
-----------------------------------------------------------------------------------------------------------------------------------------
AddEventHandler("shops:Hotdog", function()
	SendNUIMessage({ Action = "Open", name = "Hotdog", type = "Buy" })
	SetNuiFocus(true, true)
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- SHOPS:CHIHUAHUA
-----------------------------------------------------------------------------------------------------------------------------------------
AddEventHandler("shops:Chihuahua", function()
	SendNUIMessage({ Action = "Open", name = "Chihuahua", type = "Buy" })
	SetNuiFocus(true, true)
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- SHOPS:WATER
-----------------------------------------------------------------------------------------------------------------------------------------
AddEventHandler("shops:Water", function()
	SendNUIMessage({ Action = "Open", name = "Water", type = "Buy" })
	SetNuiFocus(true, true)
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- SHOPS:CIGARETTE
-----------------------------------------------------------------------------------------------------------------------------------------
AddEventHandler("shops:Cigarette", function()
	SendNUIMessage({ Action = "Open", name = "Cigarette", type = "Buy" })
	SetNuiFocus(true, true)
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- SHOPS:MEDIC
-----------------------------------------------------------------------------------------------------------------------------------------
AddEventHandler("shops:Medic", function()
	if MumbleIsConnected() and vSERVER.Permission("Paramedico") then
		SetNuiFocus(true, true)
		SendNUIMessage({ Action = "Open", name = "Paramedico", type = "Buy" })
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- SHOPS:FUEL
-----------------------------------------------------------------------------------------------------------------------------------------
AddEventHandler("shops:Fuel", function()
	SendNUIMessage({ Action = "Open", name = "Fuel", type = "Buy" })
	SetNuiFocus(true, true)
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- SHOPS:OIL
-----------------------------------------------------------------------------------------------------------------------------------------
AddEventHandler("shops:Oil", function()
	SendNUIMessage({ Action = "Open", name = "Oil", type = "Sell" })
	SetNuiFocus(true, true)
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- SHOPS:FISHING2
-----------------------------------------------------------------------------------------------------------------------------------------
AddEventHandler("shops:Fishing2", function()
	SendNUIMessage({ Action = "Open", name = "Fishing2", type = "Sell" })
	SetNuiFocus(true, true)
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- SHOPS:ELETRONICS
-----------------------------------------------------------------------------------------------------------------------------------------
AddEventHandler("shops:Eletronics", function()
	SendNUIMessage({ Action = "Open", name = "Eletronics", type = "Buy" })
	SetNuiFocus(true, true)
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- SHOPS:MILK
-----------------------------------------------------------------------------------------------------------------------------------------
AddEventHandler("shops:Milk", function()
	SendNUIMessage({ Action = "Open", name = "Milk", type = "Sell" })
	SetNuiFocus(true, true)
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- SHOPS:HUNTING2
-----------------------------------------------------------------------------------------------------------------------------------------
AddEventHandler("shops:Hunting2", function()
	SendNUIMessage({ Action = "Open", name = "Hunting2", type = "Sell" })
	SetNuiFocus(true, true)
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- SHOPS:HUNTING3
-----------------------------------------------------------------------------------------------------------------------------------------
AddEventHandler("shops:Hunting3", function()
	SendNUIMessage({ Action = "Open", name = "Hunting3", type = "Sell" })
	SetNuiFocus(true, true)
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- THREADSTART
-----------------------------------------------------------------------------------------------------------------------------------------
CreateThread(function()
	local Preset = {
		["Pharmacy"] = {
			{
				event = "shops:Open",
				label = "Abrir",
				tunnel = "shop"
			}
		},
		["Fishing"] = {
			{
				event = "shops:Open",
				label = "Comprar",
				tunnel = "shop"
			}, {
				event = "shops:Fishing2",
				label = "Vender",
				tunnel = "client"
			}
		},
		["Departament"] = {
			{
				event = "shops:Open",
				label = "Abrir",
				tunnel = "shop"
			}, {
				event = "shops:Eletronics",
				label = "Eletrônicos",
				tunnel = "client"
			}, {
				event = "shops:Milk",
				label = "Vender",
				tunnel = "client"
			}
		},
		["Identity"] = {
			{
				event = "shops:Open",
				label = "Abrir",
				tunnel = "shop"
			}, {
				event = "autoschool:start",
				label = "Solicitar Habilitação",
				tunnel = "client"
			}
		},
		["Policia"] = {
			{
				event = "shops:Open",
				label = "Abrir",
				tunnel = "shop"
			}, {
				event = "target:Announces",
				label = "Anunciar",
				tunnel = "proserver",
				service = "Policia"
			}
		},
		["Hunting"] = {
			{
				event = "shops:Open",
				label = "Abrir",
				tunnel = "shop"
			}, {
				event = "shops:Hunting2",
				label = "Vender Caixas",
				tunnel = "shop"
			}, {
				event = "shops:Hunting3",
				label = "Vender Matérias",
				tunnel = "client"
			}
		},
		["Miners"] = {
			{
				event = "shops:Open",
				label = "Vender",
				tunnel = "shop"
			}, {
				event = "crafting:Minerman",
				label = "Criar",
				tunnel = "client"
			}
		}
	}

	for Number, v in pairs(List) do
		exports["target"]:AddCircleZone("Shops:" .. Number, vec3(v[1], v[2], v[3]), 0.50, {
			name = "Shops:" .. Number,
			heading = 0.0
		}, {
			shop = Number,
			Distance = v[6] or 2.0,
			options = Preset[v[4]] or {
				{
					event = "shops:Open",
					label = "Abrir",
					tunnel = "shop"
				}
			}
		})
	end

	for Number, v in pairs(Materials) do
		exports["target"]:AddCircleZone("Materials:" .. Number, v["Coords"], 0.50, {
			name = "Materials:" .. Number,
			heading = 0.0
		}, {
			shop = Number,
			Distance = 1.25,
			options = {
				{
					event = "shops:Materials",
					label = "Abrir",
					tunnel = "shop"
				}
			}
		})
	end

	for Number, v in pairs(Mechanics) do
		exports["target"]:AddCircleZone("Mechanics:" .. Number, v["Coords"], 0.50, {
			name = "Mechanics:" .. Number,
			heading = 0.0
		}, {
			shop = Number,
			Distance = 2.0,
			options = {
				{
					event = "shops:Mechanics",
					label = "Loja da Mecânica",
					tunnel = "shop"
				}, {
					event = "target:Announces",
					label = "Anunciar",
					tunnel = "proserver",
					service = "Mecanico"
				}
			}
		})
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- SHOPS:MATERIALS
-----------------------------------------------------------------------------------------------------------------------------------------
AddEventHandler("shops:Materials", function(Number)
	if Materials[Number] then
		if GlobalState["Hours"] == Materials[Number]["Hours"] or LocalPlayer["state"]["Premium"] then
			SetNuiFocus(true, true)
			SendNUIMessage({ Action = "Open", name = "Materials", type = "Buy" })
		else
			TriggerEvent("Notify", "azul", "Sem mercadorias no momento, volte as <b>" .. Materials[Number]["Hours"] .. ":00 Horas</b> que vou ver se consigo mercadoria.", "Robert Jenkyns", 5000)
		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- SHOPS:MECHANICS
-----------------------------------------------------------------------------------------------------------------------------------------
AddEventHandler("shops:Mechanics", function(Number)
	if Mechanics[Number] then
		if LocalPlayer["state"]["Mecanico"] then
			SetNuiFocus(true, true)
			SendNUIMessage({ Action = "Open", name = "Mecanico2", type = "Buy" })
		else
			if vSERVER.Connecteds("Mecanico") then
				-- if GetClockHours() >= 08 and GetClockHours() <= 23 then
					SetNuiFocus(true, true)
					SendNUIMessage({ Action = "Open", name = "Mecanico", type = "Buy" })
				-- else
				-- 	TriggerEvent("Notify", "azul", "Estamos fechados por agora, nosso horário de funcionamento é das <b>08</b> ás <b>23 Horas</b>.", "Loja da Mecânica", 5000)
				-- end
			end
		end
	end
end)