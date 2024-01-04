-----------------------------------------------------------------------------------------------------------------------------------------
-- CONFIG
-----------------------------------------------------------------------------------------------------------------------------------------
Config = {
    Command = "stance", -- comando para abrir o stancetuning
    Framework = "creative_network", -- alterar compatibilidade do script (creative_network, creative_v5, vrpex)
    Perm = "Admin", -- permissão para abrir o stancetuning coloque false para deixar sem verificação de permissão
    Item = "notebook1", -- item necessário para realizar o tuning
    NeedItem = false, -- ativar ou desativar a necessidade de ter um item para fazer o stance (true, false)
    Nation = false -- se usar a garagem do nation e utilizar framework vrpex deixe true
}

VehicleBlock = { -- blacklist de veículos
    "police",
    "police2",
    "police3",
}

StanceTuningLocations = { -- blips
	["mechanic16"] = {
		Pos = vec3(-1423.62,-450.23,35.28),
		Heading = 32.00,
        Permission = "Hayes"
	},
	["mechanic17"] = {
		Pos = vec3(-1417.29,-446.25,35.28),
		Heading = 32.00,
        Permission = "Hayes"
	},
}

-----------------------------------------------------------------------------------------------------------------------------------------
-- NOTIFY
-----------------------------------------------------------------------------------------------------------------------------------------
NotifyMessage = {
    NeedItem = { "amarelo", "Você precisa de 1x Suspensão para realizar alterações.", 5000, "Stance Tuning" },
    Command = { "vermelho", "Você não possui permissão.", 5000, "Stance Tuning" },
    VehCheck = { "amarelo", "Este veículo não aceita modificações!", 5000, "Stance Tuning" },
    Save = { "verde", "Configurações aplicadas com sucesso.", 5000, "Stance Tuning" },
    SavePreset = { "verde", "salvo com sucesso.", 5000, "Stance Tuning" },
    SetPreset = { "verde", "aplicado com sucesso.", 5000, "Stance Tuning" },
    RemovePreset = { "verde", "removido com sucesso.", 5000, "Stance Tuning" },
    Remove = { "verde", "Configurações removidas com sucesso.", 5000, "Stance Tuning" }
}

function Notify(source,Type,Message,Time,Title)
    TriggerClientEvent("Notify",source,Type,Message,Time,Title)
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- DEV
-----------------------------------------------------------------------------------------------------------------------------------------
-- TriggerEvent("stancetuning:Open") -- evento para abrir o stancetuning
-- TriggerEvent("stancetuning:Apply",Vehicle,vehName) -- evento para colocar na função de spawn da garagem
-- TriggerServerEvent("stancetuning:UpdateStance",NetworkGetNetworkIdFromEntity(Vehicle),false,false) -- evento para colocar na função de delete da garagem