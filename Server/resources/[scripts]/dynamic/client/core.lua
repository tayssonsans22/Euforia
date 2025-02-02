-----------------------------------------------------------------------------------------------------------------------------------------
-- VRP
-----------------------------------------------------------------------------------------------------------------------------------------
local Tunnel = module("vrp", "lib/Tunnel")
local Proxy = module("vrp", "lib/Proxy")
vRPS = Tunnel.getInterface("vRP")
vRP = Proxy.getInterface("vRP")
-----------------------------------------------------------------------------------------------------------------------------------------
-- CONNECTION
-----------------------------------------------------------------------------------------------------------------------------------------
vSERVER = Tunnel.getInterface("dynamic")
-----------------------------------------------------------------------------------------------------------------------------------------
-- VARIABLES
-----------------------------------------------------------------------------------------------------------------------------------------
local Dynamic = false
-----------------------------------------------------------------------------------------------------------------------------------------
-- ANIMAL
-----------------------------------------------------------------------------------------------------------------------------------------
local HashAnimal = nil
local SpawnAnimal = false
local FollowAnimal = false
-----------------------------------------------------------------------------------------------------------------------------------------
-- ADDBUTTON
-----------------------------------------------------------------------------------------------------------------------------------------
exports("AddButton", function(title, description, trigger, par, id, server)
	SendNUIMessage({ addbutton = true, title = title, description = description, trigger = trigger, par = par, id = id, server = server })
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- SUBMENU
-----------------------------------------------------------------------------------------------------------------------------------------
exports("SubMenu", function(title, description, id)
	SendNUIMessage({ addmenu = true, title = title, description = description, menuid = id })
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- OPENMENU
-----------------------------------------------------------------------------------------------------------------------------------------
exports("openMenu", function()
	SendNUIMessage({ show = true })
	SetNuiFocus(true, true)
	Dynamic = true
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- CLICKED
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNUICallback("clicked", function(Data, Callback)
	if Data["trigger"] and Data["trigger"] ~= "" then
		if Data["server"] == "true" then
			TriggerServerEvent(Data["trigger"], Data["param"])
		else
			TriggerEvent(Data["trigger"], Data["param"])
		end
	end

	Callback("Ok")
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- CLOSE
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNUICallback("close", function(Data, Callback)
	SetNuiFocus(false, false)
	Dynamic = false

	Callback("Ok")
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- DYNAMIC:CLOSESYSTEM
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNetEvent("dynamic:closeSystem")
AddEventHandler("dynamic:closeSystem", function()
	if Dynamic then
		SendNUIMessage({ close = true })
		SetNuiFocus(false, false)
		Dynamic = false
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- GLOBALFUNCTIONS
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand("globalFunctions", function()
	if not LocalPlayer["state"]["Commands"] and not LocalPlayer["state"]["Handcuff"] and not LocalPlayer["state"]["Prison"] and not Dynamic and not IsPauseMenuActive() then
		local Ped = PlayerPedId()
		local Coords = GetEntityCoords(Ped)

		if GetEntityHealth(Ped) > 100 then
			if HashAnimal ~= nil then
				exports["dynamic"]:AddButton("Seguir", "Seguir o proprietário.", "dynamic:animalFunctions", "follow", "animals", false)
				exports["dynamic"]:AddButton("Colocar no Veículo", "Colocar o animal no veículo.", "dynamic:animalFunctions", "putvehicle", "animals", false)
				exports["dynamic"]:AddButton("Remover do Veículo", "Remover o animal no veículo.", "dynamic:animalFunctions", "removevehicle", "animals", false)
				exports["dynamic"]:SubMenu("Domésticos", "Tudo sobre animais domésticos.", "animals")
			end

			if LocalPlayer["state"]["Premium"] then
				exports["dynamic"]:AddButton("Vestir Premium", "Vestir-se com as vestimentas guardadas.", "player:Outfit", "aplicarpre", "wardrobe", true)
				exports["dynamic"]:AddButton("Guardar Premium", "Salvar suas vestimentas do corpo.", "player:Outfit", "salvarpre", "wardrobe", true)
			end

			exports["dynamic"]:AddButton("Vestir", "Vestir-se com as vestimentas guardadas.", "player:Outfit", "aplicar", "wardrobe", true)
			exports["dynamic"]:AddButton("Guardar", "Salvar suas vestimentas do corpo.", "player:Outfit", "salvar", "wardrobe", true)
			exports["dynamic"]:SubMenu("Armário", "Colocar/Retirar roupas.", "wardrobe")

			exports["dynamic"]:AddButton("Chapéu", "Colocar/Retirar o chapéu.", "player:Outfit", "Hat", "clothes", true)
			exports["dynamic"]:AddButton("Máscara", "Colocar/Retirar a máscara.", "player:Outfit", "Mask", "clothes", true)
			exports["dynamic"]:AddButton("Óculos", "Colocar/Retirar o óculos.", "player:Outfit", "Glasses", "clothes", true)
			exports["dynamic"]:AddButton("Camisa", "Colocar/Retirar a camisa.", "player:Outfit", "Shirt", "clothes", true)
			exports["dynamic"]:AddButton("Jaqueta", "Colocar/Retirar a jaqueta.", "player:Outfit", "Torso", "clothes", true)
			exports["dynamic"]:AddButton("Mãos", "Ajustas as mãos.", "player:Outfit", "Arms", "clothes", true)
			exports["dynamic"]:AddButton("Colete", "Colocar/Retirar o colete.", "player:Outfit", "Vest", "clothes", true)
			exports["dynamic"]:AddButton("Calça", "Colocar/Retirar a calça.", "player:Outfit", "Pants", "clothes", true)
			exports["dynamic"]:AddButton("Sapatos", "Colocar/Retirar o sapato.", "player:Outfit", "Shoes", "clothes", true)
			exports["dynamic"]:AddButton("Acessórios", "Colocar/Retirar os acessórios.", "player:Outfit", "Accessory", "clothes", true)
			exports["dynamic"]:SubMenu("Roupas", "Colocar/Retirar roupas.", "clothes")

			local Vehicle = vRP.ClosestVehicle(7)
			if IsEntityAVehicle(Vehicle) then
				if not IsPedInAnyVehicle(Ped) then
					if vRP.ClosestPed(3) then
						exports["dynamic"]:AddButton("Colocar no Veículo", "Colocar no veículo mais próximo.", "player:cvFunctions", "cv", "closestpeds", true)
						exports["dynamic"]:AddButton("Remover do Veículo", "Remover do veículo mais próximo.", "player:cvFunctions", "rv", "closestpeds", true)

						exports["dynamic"]:SubMenu("Jogador", "Pessoa mais próxima de você.", "closestpeds")
					end
				else
					exports["dynamic"]:AddButton("Sentar no Motorista", "Sentar no banco do motorista.", "player:seatPlayer", "0", "vehicle", false)
					exports["dynamic"]:AddButton("Sentar no Passageiro", "Sentar no banco do passageiro.", "player:seatPlayer", "1", "vehicle", false)
					exports["dynamic"]:AddButton("Sentar em Outros", "Sentar no banco do passageiro.", "player:seatPlayer", "2", "vehicle", false)
					exports["dynamic"]:AddButton("Mexer nos Vidros", "Levantar/Abaixar os vidros.", "player:Windows", "", "vehicle", false)

					exports["dynamic"]:SubMenu("Veículo", "Funções do veículo.", "vehicle")
				end

				exports["dynamic"]:AddButton("Porta do Motorista", "Abrir porta do motorista.", "player:Doors", "1", "doors", true)
				exports["dynamic"]:AddButton("Porta do Passageiro", "Abrir porta do passageiro.", "player:Doors", "2", "doors", true)
				exports["dynamic"]:AddButton("Porta Traseira Esquerda", "Abrir porta traseira esquerda.", "player:Doors", "3", "doors", true)
				exports["dynamic"]:AddButton("Porta Traseira Direita", "Abrir porta traseira direita.", "player:Doors", "4", "doors", true)
				exports["dynamic"]:AddButton("Porta-Malas", "Abrir porta-malas.", "player:Doors", "5", "doors", true)
				exports["dynamic"]:AddButton("Capô", "Abrir capô.", "player:Doors", "6", "doors", true)

				exports["dynamic"]:SubMenu("Portas", "Portas do veículo.", "doors")
			end

			if MumbleIsConnected() then
				local Experience = vSERVER.Experience()
				for Name,Exp in pairs(Experience) do
					exports["dynamic"]:AddButton(Name, "Você possuí <blue>"..Exp.." pontos</blue> no nível <blue>"..ClassCategory(Exp).."</blue>.", "", "", "Experience", false)
				end

				exports["dynamic"]:SubMenu("Experiência", "Todas as suas habilidades.", "Experience")

				local Stats = vSERVER.PedStats()
				for Name,Points in pairs(Stats) do
					exports["dynamic"]:AddButton(Name, "Você possuí um total de <blue>"..Points.." "..Name.."</blue>.", "", "", "Stats", false)
				end

				exports["dynamic"]:SubMenu("Estatísticas", "Estatísticas do seu personagem.", "Stats")
			end

			exports["dynamic"]:AddButton("Estatísticas da Cidade", "Tudo sobre nossa cidade.", "admin:Dynamic", "stats", "others", true)
			exports["dynamic"]:AddButton("Rebocar", "Colocar/Remover o veículo na prancha.", "inventory:InvokeTow", "", "others", false)
			exports["dynamic"]:AddButton("Propriedades", "Marcar/Desmarcar propriedades no mapa.", "propertys:Blips", "", "others", false)
			exports["dynamic"]:AddButton("Armazéns", "Marcar/Desmarcar armazéns no mapa.", "warehouse:Blips", "", "others", false)
			exports["dynamic"]:AddButton("Ferimentos", "Verificar ferimentos no corpo.", "paramedic:Injuries", "", "others", false)
			exports["dynamic"]:AddButton("Desbugar", "Recarregar o personagem.", "player:Debug", "", "others", true)
			exports["dynamic"]:SubMenu("Outros", "Todas as funções do personagem.", "others")

			exports["dynamic"]:openMenu()
		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- EMERGENCYFUNCTIONS
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand("emergencyFunctions", function()
	if (LocalPlayer["state"]["Policia"] or LocalPlayer["state"]["Paramedico"]) and not IsPauseMenuActive() then
		if not LocalPlayer["state"]["Commands"] and not LocalPlayer["state"]["Handcuff"] and not Dynamic and MumbleIsConnected() then
			local Ped = PlayerPedId()
			if LocalPlayer["state"]["Policia"] then
				exports["dynamic"]:AddButton("Companheiros", "Verifique seus companheiros em serviço.", "admin:Dynamic", "statsPolicia", false, true)

				exports["dynamic"]:AddButton("10-13", "Oficial desmaiado/ferido.", "dynamic:Tencode", "13", "tencode", true)
				exports["dynamic"]:AddButton("10-20", "Localização.", "dynamic:Tencode", "20", "tencode", true)
				exports["dynamic"]:AddButton("10-38", "Abordagem de trânsito.", "dynamic:Tencode", "38", "tencode", true)
				exports["dynamic"]:AddButton("10-78", "Apoio com prioridade.", "dynamic:Tencode", "78", "tencode", true)
				exports["dynamic"]:SubMenu("Emergência", "Avisos emergenciais.", "tencode")

				if GetEntityHealth(Ped) > 100 and not IsPedInAnyVehicle(Ped) then
					exports["dynamic"]:AddButton("Carregar", "Carregar a pessoa mais próxima.", "inventory:Carry", "", "player", true)
					exports["dynamic"]:AddButton("Colocar no Veículo", "Colocar no veículo mais próximo.", "player:cvFunctions", "cv", "player", true)
					exports["dynamic"]:AddButton("Remover do Veículo", "Remover do veículo mais próximo.", "player:cvFunctions", "rv", "player", true)
					exports["dynamic"]:AddButton("Remover Chapéu", "Remover da pessoa mais próxima.", "skinshop:Remove", "Hat", "player", true)
					exports["dynamic"]:AddButton("Remover Máscara", "Remover da pessoa mais próxima.", "skinshop:Remove", "Mask", "player", true)
					exports["dynamic"]:AddButton("Remover Óculos", "Remover da pessoa mais próxima.", "skinshop:Remove", "Glasses", "player", true)
					exports["dynamic"]:SubMenu("Jogador", "Pessoa mais próxima de você.", "player")

					exports["dynamic"]:AddButton("PMRJ | Manga curta", "Fardamento de oficial.", "player:Preset", "1", "prePolice", true)
					exports["dynamic"]:AddButton("PMRJ | Manga longa", "Fardamento de oficial.", "player:Preset", "2", "prePolice", true)
					exports["dynamic"]:AddButton("PMRJ | Rocam", "Fardamento de oficial.", "player:Preset", "3", "prePolice", true)
					exports["dynamic"]:AddButton("PMRJ | Recom", "Fardamento de oficial.", "player:Preset", "4", "prePolice", true)
					exports["dynamic"]:AddButton("PMRJ | 13º BPM", "Fardamento de oficial.", "player:Preset", "8", "prePolice", true)
					-- exports["dynamic"]:AddButton("PMRJ | Recom", "Fardamento de oficial.", "player:Preset", "9", "prePolice", true)
					-- exports["dynamic"]:AddButton("PMRJ | Recom", "Fardamento de oficial.", "player:Preset", "10", "prePolice", true)
					exports["dynamic"]:SubMenu("Fardamentos", "Todos os fardamentos policiais.", "prePolice")

					exports["dynamic"]:AddButton("Computador", "Computador de bordo policial.", "police:Open", "", false, false)
				end

				exports["dynamic"]:openMenu()
			elseif LocalPlayer["state"]["Paramedico"] then
				if GetEntityHealth(Ped) > 100 and not IsPedInAnyVehicle(Ped) then
					exports["dynamic"]:AddButton("Companheiros", "Verifique seus companheiros em serviço.", "admin:Dynamic", "statsParamedico", false,true)

					exports["dynamic"]:AddButton("Carregar", "Carregar a pessoa mais próxima.", "inventory:Carry", "", "player", true)
					exports["dynamic"]:AddButton("Colocar no Veículo", "Colocar no veículo mais próximo.", "player:cvFunctions", "cv", "player", true)
					exports["dynamic"]:AddButton("Remover do Veículo", "Remover do veículo mais próximo.", "player:cvFunctions", "rv", "player", true)
					exports["dynamic"]:AddButton("Remover Chapéu", "Remover da pessoa mais próxima.", "skinshop:Remove", "Hat", "player", true)
					exports["dynamic"]:AddButton("Remover Máscara", "Remover da pessoa mais próxima.", "skinshop:Remove", "Mask", "player", true)
					exports["dynamic"]:AddButton("Remover Óculos", "Remover da pessoa mais próxima.", "skinshop:Remove", "Glasses", "player", true)
					exports["dynamic"]:SubMenu("Jogador", "Pessoa mais próxima de você.", "player")

					exports["dynamic"]:AddButton("Medical Center", "Fardamento de doutor.", "player:Preset", "5", "preMedic", true)
					exports["dynamic"]:AddButton("Medical Center", "Fardamento de paramédico.", "player:Preset", "6", "preMedic", true)
					exports["dynamic"]:AddButton("Medical Center", "Fardamento de paramédico interno.", "player:Preset", "7", "preMedic", true)
					exports["dynamic"]:SubMenu("Fardamentos", "Todos os fardamentos médicos.", "preMedic")

					exports["dynamic"]:AddButton("Computador", "Computador de bordo policial.", "paramedic:Open", "", false, false)

					exports["dynamic"]:openMenu()
				end
			end
		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- ADMINFUNCTIONS
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand("adminFunctions", function()
	if LocalPlayer["state"]["Admin"] and not IsPauseMenuActive() then
		if not LocalPlayer["state"]["Commands"] and not LocalPlayer["state"]["Handcuff"] and not Dynamic and MumbleIsConnected() then
			local Ped = PlayerPedId()
			--if LocalPlayer["state"]["Admin"] then
				exports["dynamic"]:SubMenu("Gerênciamento", "Clique para mais informações.", "admin")
				exports["dynamic"]:AddButton("Whitelist", "Editar Whitelist de um ID.", "admin:Dynamic", "wl", "admin", true)
				exports["dynamic"]:AddButton("God", "Deixar o ID com tudo 100%.", "admin:Dynamic", "god", "admin", true)
				exports["dynamic"]:AddButton("Armour", "Deixar o ID com tudo Colete 100%.", "admin:Dynamic", "armour", "admin", true)
				exports["dynamic"]:AddButton("Announce", "Enviar um anúncio para todos.", "admin:Dynamic", "announce", "admin", true)
				exports["dynamic"]:AddButton("Rename", "Renomeie algum ID.", "admin:Dynamic", "rename", "admin", true)
				exports["dynamic"]:AddButton("Kick", "Expuldar o ID.", "admin:Dynamic", "kick", "admin", true)
				exports["dynamic"]:AddButton("Ban", "Banir o ID.", "admin:Dynamic", "ban", "admin", true)
				exports["dynamic"]:AddButton("Unban", "Desbanir o ID.", "admin:Dynamic", "unban", "admin", true)
				exports["dynamic"]:AddButton("Changework", "Mudar o emprego do ID.", "admin:Dynamic", "changework", "admin", true)
				exports["dynamic"]:AddButton("Changemode", "Limpar histórico criminal do ID.", "admin:Dynamic", "changemode", "admin", true)
				exports["dynamic"]:AddButton("Clearprison", "Limpar prisão do ID.", "admin:Dynamic", "clearprison", "admin", true)

				exports["dynamic"]:SubMenu("Clima", "Clique para mais informações.", "weather")
				exports["dynamic"]:AddButton("Timeset", "Mudar o Clima do jogo.", "admin:Dynamic", "timeset", "weather", true)
				exports["dynamic"]:AddButton("Temperatureset", "Mudar a Temperatura do jogo.", "admin:Dynamic", "temperatureset", "weather", true)
				exports["dynamic"]:AddButton("Blackoutset", "Ativar/Desativar o Blackout.", "admin:Dynamic", "blackoutset", "weather", true)

				exports["dynamic"]:SubMenu("Grupos", "Clique para mais informações.", "groups")
				exports["dynamic"]:AddButton("Ugroups", "Veja quais grupos do ID.", "admin:Dynamic", "ugroups", "groups", true)
				exports["dynamic"]:AddButton("Group", "Dar um grupo para o ID.", "admin:Dynamic", "group", "groups", true)
				exports["dynamic"]:AddButton("Ungroup", "Remover o grupo de um ID.", "admin:Dynamic", "ungroup", "groups", true)

				exports["dynamic"]:SubMenu("Personagens", "Clique para mais informações.", "peds")
				exports["dynamic"]:AddButton("Skin", "Mude a Skin do ID.", "admin:Dynamic", "skin", "peds", true)
				exports["dynamic"]:AddButton("Resetskin", "Resete a Skin do ID.", "admin:Dynamic", "resetskin", "peds", true)
				exports["dynamic"]:AddButton("Delete", "Delete a conta do ID.", "admin:Dynamic", "delete", "peds", true)

				exports["dynamic"]:SubMenu("Veículos", "Clique para mais informações.", "vehicles")
				exports["dynamic"]:AddButton("Tuning", "Tunar o veículo atual.", "admin:Dynamic", "tuning", "vehicles", true)
				exports["dynamic"]:AddButton("Fix", "Arrumar o veículo atual.", "admin:Dynamic", "fix", "vehicles", true)
				exports["dynamic"]:AddButton("Fuel", "Defina a Gasolina no veículo atual.", "admin:Dynamic", "fuel", "vehicles", true)
				exports["dynamic"]:AddButton("Hash", "Pegar a Hash do veículo atual.", "admin:Dynamic", "hash", "vehicles", true)
				exports["dynamic"]:AddButton("Setcar", "Envie um veículo para o ID.", "admin:Dynamic", "setcar", "vehicles", true)
				exports["dynamic"]:AddButton("Remcar", "Remove um veículo do ID.", "admin:Dynamic", "remcar", "vehicles", true)
				exports["dynamic"]:AddButton("Changelicense", "Atualize o status da CNH do ID.", "admin:Dynamic", "driverlicense", "vehicles", true)

				exports["dynamic"]:SubMenu("Financeiros", "Clique para mais informações.", "wallet")
				exports["dynamic"]:AddButton("Setbank", "Dar dinheiro para o ID.", "admin:Dynamic", "setbank", "wallet", true)
				exports["dynamic"]:AddButton("Rembank", "Remover dinheiro do ID.", "admin:Dynamic", "rembank", "wallet", true)
				exports["dynamic"]:AddButton(""..itemName("gemstone").."s.", "Inserir "..itemName("gemstone").."s no ID.", "admin:Dynamic", "gem", "wallet", true)

				exports["dynamic"]:SubMenu("Itens", "Clique para mais informações.", "item")
				exports["dynamic"]:AddButton("Clearinv", "Limpe o inventário do ID.", "admin:Dynamic", "clearinv", "item", true)
				exports["dynamic"]:AddButton("Item", "Pegar Itens para você.", "admin:Dynamic", "item", "item", true)
				exports["dynamic"]:AddButton("Item2", "Dar Itens para o ID.", "admin:Dynamic", "item2", "item", true)
				exports["dynamic"]:AddButton("Itemall", "Dar Itens para todos conectados.", "admin:Dynamic", "itemall", "item", true)

				exports["dynamic"]:SubMenu("Básicos", "Clique para mais informações.", "basic")
				exports["dynamic"]:AddButton("Wall", "Ativar/Desativar Wall.", "admin:Dynamic", "blips", "basic", true)
				exports["dynamic"]:AddButton("Nc", "Ativar/Desativar o NoClip.", "admin:Dynamic", "nc", "basic", true)
				exports["dynamic"]:AddButton("Flash", "Ativar/Desativar o efeito Flash.", "admin:Dynamic", "flash", "basic", true)
				exports["dynamic"]:AddButton("Cds", "Pegue sua coordenada atual.", "admin:Dynamic", "cds", "basic", true)
				exports["dynamic"]:AddButton("Tpcds", "Teletransporte para uma coordenada.", "admin:Dynamic", "tpcds", "basic", true)
				exports["dynamic"]:AddButton("Tptome", "Teletransporte um ID para você.", "admin:Dynamic", "tptome", "basic", true)
				exports["dynamic"]:AddButton("Tpto", "Teletransporte para um ID.", "admin:Dynamic", "tpto", "basic", true)
				exports["dynamic"]:AddButton("Tpway", "Teletransporte para uma marcação no GPS.", "admin:Dynamic", "tpway", "basic", true)
				exports["dynamic"]:AddButton("Limparea", "Limpar a área próxima a você.", "admin:Dynamic", "limparea", "basic", true)
				exports["dynamic"]:AddButton("Players", "Verifique quantos onlines existem.", "admin:Dynamic", "players", "basic", true)
				exports["dynamic"]:AddButton("PlayersConnected", "Verifique os players onlines.", "admin:Dynamic", "playersconnected", "basic", true)

				exports["dynamic"]:openMenu()
			--end
		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- KEYMAPPING
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterKeyMapping("globalFunctions", "Abrir menu principal.", "keyboard", "F9")
RegisterKeyMapping("emergencyFunctions", "Abrir menu de emergencial.", "keyboard", "F10")
RegisterKeyMapping("adminFunctions", "Abrir menu de administração.", "keyboard", "INSERT")
-----------------------------------------------------------------------------------------------------------------------------------------
-- DYNAMIC:WORK
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNetEvent("dynamic:Work")
AddEventHandler("dynamic:Work", function()
	if not IsPauseMenuActive() then
		if not LocalPlayer["state"]["Commands"] and not LocalPlayer["state"]["Handcuff"] and not Dynamic and MumbleIsConnected() then
			-- if GetClockHours() >= 06 and GetClockHours() <= 22 then
				if LocalPlayer["state"]["Work"] == true then
					exports["dynamic"]:AddButton("Finalizar", "Saia do seu serviço atual.", "dynamic:WorkStatus", "Sair", false, true)
				else
					exports["dynamic"]:AddButton("Reciclagem", "Trabalhe como <blue>"..ClassWork("Garbageman").."</blue>.", "dynamic:WorkStatus", "Garbageman", false, true)
					exports["dynamic"]:AddButton("Motorista", "Trabalhe como <blue>"..ClassWork("Bus").."</blue>.", "dynamic:WorkStatus", "Bus", false, true)
					-- exports["dynamic"]:AddButton("Taxista", "Trabalhe como <blue>"..ClassWork("Taxi").."</blue>.", "dynamic:WorkStatus", "Taxi", false, true)
					exports["dynamic"]:AddButton("Transportador", "Trabalhe como <blue>"..ClassWork("Transporter").."</blue>.", "dynamic:WorkStatus", "Transporter", false, true)
					--exports["dynamic"]:AddButton("Lenhador", "Trabalhe como <blue>"..ClassWork("Lumberman").."</blue>.", "dynamic:WorkStatus", "Lumberman", false, true)
					exports["dynamic"]:AddButton("Agricultor", "Trabalhe como <blue>"..ClassWork("Fruitman").."</blue>.", "dynamic:WorkStatus", "Fruitman", false, true)
					exports["dynamic"]:AddButton("Entregador", "Trabalhe como <blue>"..ClassWork("Milkman").."</blue>.", "dynamic:WorkStatus", "Milkman", false, true)
					--exports["dynamic"]:AddButton("Correios", "Trabalhe como <blue>"..ClassWork("PostOp").."</blue>.", "dynamic:WorkStatus", "PostOp", false, true)
					exports["dynamic"]:AddButton("Caminhoneiro", "Trabalhe como <blue>"..ClassWork("Trucker").."</blue>.", "dynamic:WorkStatus", "Trucker", false, true)
					exports["dynamic"]:AddButton("Minerador", "Trabalhe como <blue>"..ClassWork("Minerman").."</blue>.", "dynamic:WorkStatus", "Minerman", false, true)
					exports["dynamic"]:AddButton("Rebocador", "Trabalhe como <blue>"..ClassWork("Tows").."</blue>.", "dynamic:WorkStatus", "Tows", false, true)
					--exports["dynamic"]:AddButton("Mergulhador", "Trabalhe como <blue>"..ClassWork("Diver").."</blue>.", "dynamic:WorkStatus", "Diver", false, true)
					-- exports["dynamic"]:AddButton("Jardineiro", "Trabalhe como <blue>"..ClassWork("Cleaner").."</blue>.", "dynamic:WorkStatus", "Cleaner", false, true)
				end

				exports["dynamic"]:openMenu()
			-- else
			-- 	TriggerEvent("Notify", "azul", "Estamos fechados por agora, nosso horário de funcionamento é das <b>06</b> ás <b>22 Horas</b>.", "Central de Empregos", 5000)
			-- end
		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- DYNAMIC:ANIMALSPAWN
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNetEvent("dynamic:animalSpawn")
AddEventHandler("dynamic:animalSpawn", function(Model)
	if HashAnimal == nil then
		if not SpawnAnimal then
			SpawnAnimal = true

			local Ped = PlayerPedId()
			local Heading = GetEntityHeading(Ped)
			local Coords = GetOffsetFromEntityInWorldCoords(Ped, 0.0, 1.0, 0.0)
			local Object, Network = vRPS.CreatePed(Model, Coords["x"], Coords["y"], Coords["z"], Heading, 28)
			if Object then
				local SpawnAnimal = 0

				HashAnimal = LoadNetwork(Network)
				while not DoesEntityExist(HashAnimal) and SpawnAnimal <= 1000 do
					HashAnimal = LoadNetwork(Network)
					SpawnAnimal = SpawnAnimal + 1
					Wait(1)
				end

				SpawnAnimal = 0
				local PedControl = NetworkRequestControlOfEntity(HashAnimal)
				while not PedControl and SpawnAnimal <= 1000 do
					PedControl = NetworkRequestControlOfEntity(HashAnimal)
					SpawnAnimal = SpawnAnimal + 1
					Wait(1)
				end

				SetPedCanRagdoll(HashAnimal, false)
				SetEntityInvincible(HashAnimal, true)
				SetPedFleeAttributes(HashAnimal, 0, 0)
				SetEntityAsMissionEntity(HashAnimal, true, false)
				SetBlockingOfNonTemporaryEvents(HashAnimal, true)
				SetPedRelationshipGroupHash(HashAnimal, GetHashKey("k9"))
				GiveWeaponToPed(HashAnimal, GetHashKey("WEAPON_ANIMAL"), 200, true, true)

				SetEntityAsNoLongerNeeded(HashAnimal)

				TriggerEvent("dynamic:animalFunctions", "follow")

				vSERVER.RegisterAnimal(Network)
			end

			SpawnAnimal = false
		end
	else
		vSERVER.ClearAnimal()
		FollowAnimal = false
		HashAnimal = nil
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- DYNAMIC:ANIMALFUNCTIONS
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNetEvent("dynamic:animalFunctions")
AddEventHandler("dynamic:animalFunctions", function(Functions)
	if HashAnimal ~= nil then
		local Ped = PlayerPedId()
		if Functions == "follow" then
			if not FollowAnimal then
				TaskFollowToOffsetOfEntity(HashAnimal, Ped, 1.0, 1.0, 0.0, 5.0, -1, 2.5, 1)
				SetPedKeepTask(HashAnimal, true)
				FollowAnimal = true
			else
				SetPedKeepTask(HashAnimal, false)
				ClearPedTasks(HashAnimal)
				FollowAnimal = false
			end
		elseif Functions == "putvehicle" then
			if IsPedInAnyVehicle(Ped) and not IsPedOnAnyBike(Ped) then
				local Vehicle = GetVehiclePedIsUsing(Ped)
				if IsVehicleSeatFree(Vehicle, 0) then
					TaskEnterVehicle(HashAnimal, Vehicle, -1, 0, 2.0, 16, 0)
				end
			end
		elseif Functions == "removevehicle" then
			if IsPedInAnyVehicle(Ped) and not IsPedOnAnyBike(Ped) then
				TaskLeaveVehicle(HashAnimal, GetVehiclePedIsUsing(Ped), 256)
				TriggerEvent("dynamic:animalFunctions", "follow")
			end
		elseif Functions == "destroy" then
			vSERVER.ClearAnimal()
			FollowAnimal = false
			HashAnimal = nil
		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- DYNAMIC:MINER
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNetEvent("dynamic:Miner")
AddEventHandler("dynamic:Miner", function(source)
	local ped = PlayerPedId()
	ServiceBlip = AddBlipForCoord(2954.38, 2793.37, 40.74)
	SetBlipSprite(ServiceBlip, 8)
	SetBlipColour(ServiceBlip, 83)
	SetBlipScale(ServiceBlip, 0.9)
	SetBlipRoute(ServiceBlip, true)
	SetBlipAsShortRange(ServiceBlip, true)
	BeginTextCommandSetBlipName("STRING")
	AddTextComponentString("Mineradora")
	EndTextCommandSetBlipName(ServiceBlip)
	while true do 
		Wait(1000)
		local coords = GetEntityCoords(ped)
		local distance = #(coords - vector3(2954.38, 2793.37, 40.74))
		if distance <= 10.5 then
			RemoveBlip(ServiceBlip)
			ServiceBlip = nil
			return
		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- DYNAMIC:TAXI
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNetEvent("dynamic:Taxi")
AddEventHandler("dynamic:Taxi", function(source)
	local ped = PlayerPedId()
	ServiceBlip = AddBlipForCoord(896.25,-144.77,76.78)
	SetBlipSprite(ServiceBlip, 8)
	SetBlipColour(ServiceBlip, 83)
	SetBlipScale(ServiceBlip, 0.9)
	SetBlipRoute(ServiceBlip, true)
	SetBlipAsShortRange(ServiceBlip, true)
	BeginTextCommandSetBlipName("STRING")
	AddTextComponentString("Central de Taxi")
	EndTextCommandSetBlipName(ServiceBlip)
	while true do 
		Wait(1000)
		local coords = GetEntityCoords(ped)
		local distance = #(coords - vector3(896.25,-144.77,76.78))
		if distance <= 10.5 then
			RemoveBlip(ServiceBlip)
			ServiceBlip = nil
			return
		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- DYNAMIC:BUS
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNetEvent("dynamic:Bus")
AddEventHandler("dynamic:Bus", function(source)
	local ped = PlayerPedId()
	ServiceBlip = AddBlipForCoord(454.03,-602.67,28.58)
	SetBlipSprite(ServiceBlip, 8)
	SetBlipColour(ServiceBlip, 83)
	SetBlipScale(ServiceBlip, 0.9)
	SetBlipRoute(ServiceBlip, true)
	SetBlipAsShortRange(ServiceBlip, true)
	BeginTextCommandSetBlipName("STRING")
	AddTextComponentString("Central de Ônibus")
	EndTextCommandSetBlipName(ServiceBlip)
	while true do 
		Wait(1000)
		local coords = GetEntityCoords(ped)
		local distance = #(coords - vector3(454.03,-602.67,28.58))
		if distance <= 10.5 then
			RemoveBlip(ServiceBlip)
			ServiceBlip = nil
			return
		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- DYNAMIC:CLEAR
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNetEvent("dynamic:Cleaner")
AddEventHandler("dynamic:Cleaner", function(source)
	local ped = PlayerPedId()
	ServiceBlip = AddBlipForCoord(-1275.78,-1139.24,6.79)
	SetBlipSprite(ServiceBlip, 8)
	SetBlipColour(ServiceBlip, 83)
	SetBlipScale(ServiceBlip, 0.9)
	SetBlipRoute(ServiceBlip, true)
	SetBlipAsShortRange(ServiceBlip, true)
	BeginTextCommandSetBlipName("STRING")
	AddTextComponentString("Central de Jardinagem")
	EndTextCommandSetBlipName(ServiceBlip)
	while true do 
		Wait(1000)
		local coords = GetEntityCoords(ped)
		local distance = #(coords - vector3(-1275.78,-1139.24,6.79))
		if distance <= 10.5 then
			RemoveBlip(ServiceBlip)
			ServiceBlip = nil
			return
		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- DYNAMIC:Garbageman
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNetEvent("dynamic:Garbageman") 
AddEventHandler("dynamic:Garbageman", function(source) 
	local ped = PlayerPedId()
	ServiceBlip = AddBlipForCoord(-427.35,-1723.12,19.11) 
	SetBlipSprite(ServiceBlip, 8)
	SetBlipColour(ServiceBlip, 83)
	SetBlipScale(ServiceBlip, 0.9)
	SetBlipRoute(ServiceBlip, true)
	SetBlipAsShortRange(ServiceBlip, true)
	BeginTextCommandSetBlipName("STRING")
	AddTextComponentString("Central de Jardinagem")
	EndTextCommandSetBlipName(ServiceBlip)
	while true do 
		Wait(1000)
		local coords = GetEntityCoords(ped)
		local distance = #(coords - vector3(-427.35,-1723.12,19.11)) 
		if distance <= 10.5 then
			RemoveBlip(ServiceBlip)
			ServiceBlip = nil
			return
		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- DYNAMIC:TRANSPORT
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNetEvent("dynamic:Transport") 
AddEventHandler("dynamic:Transport", function(source) 
	local ped = PlayerPedId()
	ServiceBlip = AddBlipForCoord(232.99,203.68,105.38) 
	SetBlipSprite(ServiceBlip, 8)
	SetBlipColour(ServiceBlip, 83)
	SetBlipScale(ServiceBlip, 0.9)
	SetBlipRoute(ServiceBlip, true)
	SetBlipAsShortRange(ServiceBlip, true)
	BeginTextCommandSetBlipName("STRING")
	AddTextComponentString("Central de Jardinagem")
	EndTextCommandSetBlipName(ServiceBlip)
	while true do 
		Wait(1000)
		local coords = GetEntityCoords(ped)
		local distance = #(coords - vector3(232.99,203.68,105.38)) 
		if distance <= 10.5 then
			RemoveBlip(ServiceBlip)
			ServiceBlip = nil
			return
		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- DYNAMIC:AGRICUTOR
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNetEvent("dynamic:Agro") 
AddEventHandler("dynamic:Agro", function(source) 
	local ped = PlayerPedId()
	ServiceBlip = AddBlipForCoord(2004.82,5108.4,43.17) 
	SetBlipSprite(ServiceBlip, 8)
	SetBlipColour(ServiceBlip, 83)
	SetBlipScale(ServiceBlip, 0.9)
	SetBlipRoute(ServiceBlip, true)
	SetBlipAsShortRange(ServiceBlip, true)
	BeginTextCommandSetBlipName("STRING")
	AddTextComponentString("Central de Jardinagem")
	EndTextCommandSetBlipName(ServiceBlip)
	while true do 
		Wait(1000)
		local coords = GetEntityCoords(ped)
		local distance = #(coords - vector3(2004.82,5108.4,43.17)) 
		if distance <= 10.5 then
			RemoveBlip(ServiceBlip)
			ServiceBlip = nil
			return
		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- DYNAMIC:Milkman
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNetEvent("dynamic:Milkman") 
AddEventHandler("dynamic:Milkman", function(source) 
	local ped = PlayerPedId()
	ServiceBlip = AddBlipForCoord(2436.66,4773.5,34.37) 
	SetBlipSprite(ServiceBlip, 8)
	SetBlipColour(ServiceBlip, 83)
	SetBlipScale(ServiceBlip, 0.9)
	SetBlipRoute(ServiceBlip, true)
	SetBlipAsShortRange(ServiceBlip, true)
	BeginTextCommandSetBlipName("STRING")
	AddTextComponentString("Central de Vaqueiros")
	EndTextCommandSetBlipName(ServiceBlip)
	while true do 
		Wait(1000)
		local coords = GetEntityCoords(ped)
		local distance = #(coords - vector3(2436.66,4773.5,34.37)) 
		if distance <= 10.5 then
			RemoveBlip(ServiceBlip)
			ServiceBlip = nil
			return
		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- DYNAMIC:Trucker
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNetEvent("dynamic:Trucker") 
AddEventHandler("dynamic:Trucker", function(source) 
	local ped = PlayerPedId()
	ServiceBlip = AddBlipForCoord(1243.84,-3256.37,6.03) 
	SetBlipSprite(ServiceBlip, 8)
	SetBlipColour(ServiceBlip, 83)
	SetBlipScale(ServiceBlip, 0.9)
	SetBlipRoute(ServiceBlip, true)
	SetBlipAsShortRange(ServiceBlip, true)
	BeginTextCommandSetBlipName("STRING")
	AddTextComponentString("Central de Vaqueiros")
	EndTextCommandSetBlipName(ServiceBlip)
	while true do 
		Wait(1000)
		local coords = GetEntityCoords(ped)
		local distance = #(coords - vector3(1243.84,-3256.37,6.03)) 
		if distance <= 10.5 then
			RemoveBlip(ServiceBlip)
			ServiceBlip = nil
			return
		end
	end
end)