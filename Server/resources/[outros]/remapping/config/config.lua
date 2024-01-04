-----------------------------------------------------------------------------------------------------------------------------------------
-- CONFIG
-----------------------------------------------------------------------------------------------------------------------------------------
Config = {
    Command = "remap", -- comando para abrir o remapping
    Framework = "creative_network", -- alterar compatibilidade do script (creative_network, creative_v5, creative_v4, vrpex)
    Perm = "Admin", -- permissão para abrir o remapping coloque false para deixar sem verificação de permissão
    Item = "fueltech", -- item necessário para realizar o remap
    NeedItem = false, -- ativar ou desativar a necessidade de ter um item para fazer o remap (true, false)
    Nation = false, -- se usar a garagem do nation e utilizar framework vrpex deixe true
    ActiveAntilag = true, -- ativar ou desativar para que o antilag fique sempre ligado após tunar (true, false)
    InverseEnabled = true, -- ativar ou desativar o inversepower para que ao utilizar os presets de drifting o carro não fique indireitando e tenha torque de acordo com o ângulo (true, false)
    InverseLevel = 1, -- alterar o nível do inversepower, 1 para default, 2 para sensitive, 3 para drift
    DriftSmoke = true, -- ativar ou desativar a fumaça ao fazer drifting e burnout (true, false)
    SmokeSize = 0.10, -- tamanho da fumaça
    SmokeDensity = 10, -- densidade da fumaça
    BurnoutSize = 1.5 -- tamanho do burnout
}

VehicleBlock = { -- blacklist de veículos
    "police",
    "police2",
    "police3",
}

RemappingLocations = { -- blips
	["mechanic13"] = {
		Pos = vec3(174.19,-1011.83,28.64),
		Heading = 22.68,
        Permission = "Bennys"
	},
}
-----------------------------------------------------------------------------------------------------------------------------------------
-- NOTIFY
-----------------------------------------------------------------------------------------------------------------------------------------
NotifyMessage = {
    NeedItem = { "amarelo", "Você precisa de 1x Fuel Tech para realizar alterações.", 5000, "Remapping" },
    Command = { "vermelho", "Você não possui permissão.", 5000, "Remapping" },
    VehCheck = { "amarelo", "Este veículo não aceita modificações!", 5000, "Remapping" },
    Save = { "verde", "Configurações aplicadas com sucesso.", 5000, "Remapping" },
    SavePreset = { "verde", "salvo com sucesso.", 5000, "Remapping" },
    SetPreset = { "verde", "aplicado com sucesso.", 5000, "Remapping" },
    RemovePreset = { "verde", "removido com sucesso.", 5000, "Remapping" },
    Remove = { "verde", "Configurações removidas com sucesso.", 5000, "Remapping" }
}

function Notify(source,Type,Message,Time,Title)
    TriggerClientEvent("Notify",source,Type,Message,Time,Title)
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- DEV
-----------------------------------------------------------------------------------------------------------------------------------------
-- TriggerEvent("remapping:Open") -- evento para abrir o remapping
-- TriggerEvent("remapping:Antilag") -- evento para ligar ou desligar o antilag após tunado