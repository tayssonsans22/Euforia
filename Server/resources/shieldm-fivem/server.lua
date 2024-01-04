local serverId = 123
local serverKey = 'c81d3ef5-72c7-4600-9398-2905abb854ac'

local function ShieldmReleaseOnWhenConnected(name, setKickReason, deferrals)
    userIp = tostring(GetPlayerEndpoint(source))

    PerformHttpRequest("https://shieldm.neep.com.br/api/v1/server/" .. serverId .. "/allow/" .. userIp, function(err, data, headers)
        local result = ''

        if data then 
            result = 'Liberado com sucesso'
        elseif err and err == 400 then 
            result = 'Liberado anteriormente'
        else 
            result = 'Erro: ' .. err
        end

        --print(string.format("Jogador %s conectando - IP: %s - Status: %s", name, userIp, result))
    end, "GET", "", {["X-SHIELDM-APIKEY"] = serverKey })
end

AddEventHandler("playerConnecting", ShieldmReleaseOnWhenConnected)
