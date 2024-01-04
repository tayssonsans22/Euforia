-----------------------------------------------------------------------------------------------------------------------------------------
-- VRP
-----------------------------------------------------------------------------------------------------------------------------------------
local Tunnel = module("vrp","lib/Tunnel")
local Proxy = module("vrp","lib/Proxy")
vRP = Proxy.getInterface("vRP")
-----------------------------------------------------------------------------------------------------------------------------------------
-- CONNECTION
-----------------------------------------------------------------------------------------------------------------------------------------
vSERVER = Tunnel.getInterface("chest")
-----------------------------------------------------------------------------------------------------------------------------------------
-- CHESTS
-----------------------------------------------------------------------------------------------------------------------------------------
local Chests = {
	{ ["Name"] = "Policia", ["Coords"] = vec3(442.18,-991.45,31.03),  ["Mode"] = "1" },
	{ ["Name"] = "Policia", ["Coords"] = vec3(1844.31,2573.84,46.26), ["Mode"] = "1" },
	{ ["Name"] = "Paramedico", ["Coords"] = vec3(306.17,-601.98,43.25),  ["Mode"] = "2" },
	{ ["Name"] = "Burgershot", ["Coords"] = vec3(-1194.02,-900.49,13.8), ["Mode"] = "2" },
	{ ["Name"] = "Tuners", ["Coords"] = vec3(-345.07,-127.91,39.19), ["Mode"] = "2" },
	{ ["Name"] = "Ottos", ["Coords"] = vec3(-1144.33,-2004.02,13.37), ["Mode"] = "2" },
	{ ["Name"] = "Ballas", ["Coords"] = vec3(94.76,-1984.01,20.66),  ["Mode"] = "2" },
	{ ["Name"] = "Families", ["Coords"] = vec3(-30.36,-1434.34,31.7),  ["Mode"] = "2" },
	{ ["Name"] = "Vagos", ["Coords"] = vec3(346.9,-2068.08,21.06),  ["Mode"] = "2" },
	{ ["Name"] = "Aztecas", ["Coords"] = vec3(513.26,-1802.72,28.71), ["Mode"] = "2" },
	{ ["Name"] = "Bloods", ["Coords"] = vec3(231.43,-1752.75,29.18), ["Mode"] = "2" },
	{ ["Name"] = "Favela01", ["Coords"] = vec3(1472.04,-833.93,119.82), ["Mode"] = "2" },
	{ ["Name"] = "Favela02", ["Coords"] = vec3(1373.41,-153.29,144.98), ["Mode"] = "2" },
	{ ["Name"] = "Favela03", ["Coords"] = vec3(1622.01,455.12,257.37), ["Mode"] = "2" },
	{ ["Name"] = "Favela04", ["Coords"] = vec3(817.91,1045.58,286.59), ["Mode"] = "2" },
	{ ["Name"] = "Favela05", ["Coords"] = vec3(969.17,1640.02,208.16), ["Mode"] = "2" },
	{ ["Name"] = "Favela06", ["Coords"] = vec3(-2767.96,-89.59,5.69), ["Mode"] = "2" },
	{ ["Name"] = "Favela07", ["Coords"] = vec3(-1696.61,-317.83,62.22), ["Mode"] = "2" },
	{ ["Name"] = "Favela08", ["Coords"] = vec3(1997.16,3342.35,50.23), ["Mode"] = "2" },
	{ ["Name"] = "Desmanche01", ["Coords"] = vec3(988.88,-138.06,74.23), ["Mode"] = "2" },
	{ ["Name"] = "Desmanche01-2", ["Coords"] = vec3(977.35,-104.39,74.86), ["Mode"] = "2" },
	{ ["Name"] = "Mafia01", ["Coords"] = vec3(-1868.49,2065.38,135.53), ["Mode"] = "2" },
	{ ["Name"] = "Mafia02", ["Coords"] = vec3(-2671.56,1333.0,144.34), ["Mode"] = "2" },
	{ ["Name"] = "Mafia03", ["Coords"] = vec3(-1526.61,127.98,50.21), ["Mode"] = "2" },	
	{ ["Name"] = "Mafia03-2", ["Coords"] = vec3(-1515.74,108.54,52.45), ["Mode"] = "2" },	
	{ ["Name"] = "Mafia04", ["Coords"] = vec3(-895.19,-1441.93,7.71), ["Mode"] = "2" },	
	{ ["Name"] = "Mafia05", ["Coords"] = vec3(-1370.38,-621.13,31.01), ["Mode"] = "2" },
	{ ["Name"] = "Mafia06", ["Coords"] = vec3(92.58,-1287.39,29.44), ["Mode"] = "2" },		
	{ ["Name"] = "Favela01-01", ["Coords"] = vec3(1395.16,-877.42,108.83), ["Mode"] = "4" },	
	{ ["Name"] = "Favela02-01", ["Coords"] = vec3(1528.94,-84.86,161.59), ["Mode"] = "4" },	
	{ ["Name"] = "Favela03-01", ["Coords"] = vec3(1627.63,460.42,256.68), ["Mode"] = "4" },	
	{ ["Name"] = "Favela04-01", ["Coords"] = vec3(875.31,1036.46,283.63), ["Mode"] = "4" },	
	{ ["Name"] = "Favela05-01", ["Coords"] = vec3(937.88,1582.25,228.86), ["Mode"] = "4" },	
	{ ["Name"] = "Favela06-01", ["Coords"] = vec3(-2943.32,-42.31,24.94), ["Mode"] = "4" },	
	{ ["Name"] = "Favela07-01", ["Coords"] = vec3(-1725.22,-228.84,61.8), ["Mode"] = "4" },	
	{ ["Name"] = "Favela08-01", ["Coords"] = vec3(2052.23,3399.26,48.4), ["Mode"] = "4" },	
	{ ["Name"] = "Mafia01-01", ["Coords"] = vec3(-1876.53,2060.96,145.29), ["Mode"] = "4" },	
	{ ["Name"] = "Mafia02-01", ["Coords"] = vec3(-2676.7,1309.98,151.93), ["Mode"] = "4" },	
	{ ["Name"] = "Mafia03-01", ["Coords"] = vec3(-1497.82,123.05,55.58), ["Mode"] = "4" },	
	{ ["Name"] = "Mafia04-01", ["Coords"] = vec3(-880.86,-1465.28,7.64), ["Mode"] = "4" },	
	{ ["Name"] = "Mafia05-01", ["Coords"] = vec3(-1398.57,-619.02,34.07), ["Mode"] = "4" },	
	{ ["Name"] = "Mafia06-01", ["Coords"] = vec3(100.14,-1304.37,29.35), ["Mode"] = "4" },	
	{ ["Name"] = "BurgershotTray01", ["Coords"] = vec3(-1190.85,-894.39,14.05), ["Mode"] = "3" },
	{ ["Name"] = "BurgershotTray02", ["Coords"] = vec3(-1192.82,-893.83,14.0), ["Mode"] = "3" },
	{ ["Name"] = "BurgershotTray03", ["Coords"] = vec3(-1194.79,-893.33,14.04), ["Mode"] = "3" },
	{ ["Name"] = "BurgershotTray04", ["Coords"] = vec3(-1196.81,-892.8,14.08), ["Mode"] = "3" }
}
-----------------------------------------------------------------------------------------------------------------------------------------
-- LABELS
-----------------------------------------------------------------------------------------------------------------------------------------
local Labels = {
	["1"] = {
		{
			event = "chest:Open",
			label = "Compartimento Geral",
			tunnel = "shop",
			service = "Normal"
		},{
			event = "chest:Open",
			label = "Compartimento Pessoal",
			tunnel = "shop",
			service = "Personal"
		}
	},
	["2"] = {
		{
			event = "chest:Open",
			label = "Abrir",
			tunnel = "shop",
			service = "Normal"
		}
	},
	["3"] = {
		{
			event = "chest:Open",
			label = "Abrir",
			tunnel = "shop",
			service = "Tray"
		}
	},
	["4"] = {
		{
			event = "chest:Open",
			label = "Abrir",
			tunnel = "shop",
			service = "Chefe"
		}
	},
}
-----------------------------------------------------------------------------------------------------------------------------------------
-- THREADINIT
-----------------------------------------------------------------------------------------------------------------------------------------
CreateThread(function()
	for Name,v in pairs(Chests) do
		exports["target"]:AddCircleZone("Chest:"..Name,v["Coords"],0.25,{
			name = "Chest:"..Name,
			heading = 0.0,
			useZ = true
		},{
			Distance = 1.35,
			shop = v["Name"],
			options = Labels[v["Mode"]]
		})
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- CHEST:OPEN
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNetEvent("chest:Open")
AddEventHandler("chest:Open",function(Name,Init,Item)
	if vSERVER.Permissions(Name,Init,Item) and GetEntityHealth(PlayerPedId()) > 100 then
		SetNuiFocus(true,true)
		SendNUIMessage({ Action = "Open" })
		TriggerEvent("sounds:Private","chest",0.35)

		if Init ~= "Item" then
			vRP.PlayAnim(false,{"amb@prop_human_bum_bin@base","base"},true)
		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- CHESTCLOSE
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNUICallback("Close",function(Data,Callback)
	SendNUIMessage({ Action = "Close" })
	SetNuiFocus(false,false)
	vRP.Destroy()

	Callback("Ok")
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- TAKE
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNUICallback("Take",function(Data,Callback)
	if MumbleIsConnected() then
		vSERVER.Take(Data["item"],Data["slot"],Data["amount"],Data["target"])
	end

	Callback("Ok")
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- STORE
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNUICallback("Store",function(Data,Callback)
	if MumbleIsConnected() and not exports["hud"]:Wanted() then
		vSERVER.Store(Data["item"],Data["slot"],Data["amount"],Data["target"])
	end

	Callback("Ok")
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- UPDATE
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNUICallback("Update",function(Data,Callback)
	if MumbleIsConnected() then
		vSERVER.Update(Data["slot"],Data["target"],Data["amount"])
	end

	Callback("Ok")
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- CHEST
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNUICallback("Chest",function(Data,Callback)
	local Inventory,Chest,InvPeso,InvMaxPeso,ChestPeso,ChestMaxPeso,Slots = vSERVER.Chest()
	if Inventory then
		Callback({ Inventory = Inventory, Chest = Chest, invPeso = InvPeso, invMaxpeso = InvMaxPeso, chestPeso = ChestPeso, chestMaxpeso = ChestMaxPeso, Slots = Slots })
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- CHEST:UPDATE
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNetEvent("chest:Update")
AddEventHandler("chest:Update",function(Action,invPeso,invMaxpeso,chestPeso,chestMaxpeso)
	SendNUIMessage({ Action = Action, invPeso = invPeso, invMaxpeso = invMaxpeso, chestPeso = chestPeso, chestMaxpeso = chestMaxpeso })
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- CHEST:CLOSE
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNetEvent("chest:Close")
AddEventHandler("chest:Close",function(Action)
	SendNUIMessage({ Action = "Close" })
	SetNuiFocus(false,false)
	vRP.Destroy()
end)