config = {}

config.logo = ""
config.webhook = ""

config.creative = false
config.creativeV6 = true
config.progress = "progress"
config.permADM = "Admin"

-------------------------------
------- Lugares ---------------
-------------------------------
config.desmanche = {
    ['Geral'] = {
        ['perm'] = {
            ['perm'] = 'Desmanche01' -- 991.71,-126.4,74.05,82.21
        },
        ['locs'] = {
            ['x'] = 991.71, ['y'] = -126.4, ['z'] = 74.05
        }
    }
}

-------------------------------
------- Desmanche -------------
-------------------------------
config.verificacao = false -- Caso queria que verifique o veiculo, detido e tudo mais
config.item = {
    precisa = false, -- true para precisar de item para desmanche, false para não precisar
    nomeitem = "cartao", -- Spawn do item para o desmanche
    nomenotify = "Cartão de Desmanche", -- Nome para aparecer na notify 
    qntitem = 10 -- Quantidade do item para desmanchar
}

-------------------------------
------- Tempo -----------------
-------------------------------
config.time = {
    desmanchar = 1, -- Segundos
    porta = 1, 
    capo = 1,
    roda = 1,
    motor = 1
}

-------------------------------
------- Pagamento -------------
-------------------------------
config.pagamento = {
    dinheiro = false, -- Se true pagara por item como rodas, se false irá dar dinheiro ou dinheiro sujo
    item = true, -- Se o pagamento é em dinheiro e não item como dinheirosujo
    dinheirosujo = "dollars2" -- Item ganho após desmanchar
}

config.porcentagem = { -- Quando desmanchado por dinheiro  ou dinheiro sujo
    motor = 0.2,
    portaCarro = 0.02,
    capoCarro = 0.05,
    pneuCarro = 0.02,
    portaCarroImportado = 0.04,
    pneuCarroImportado = 0.04,
    capoImportado = 0.04,
    portaCaminhao = 0.05,
    capoCaminhao = 0.05,
    pneuCaminhao = 0.05,
    pneuMoto = 0.02,
    carenagem = 0.05,
}

-------------------------------
--------- Notify --------------
-------------------------------
config.notify = {
    Notify = 'Notify',
    negado = 'negado',
    aviso = 'aviso'
}

exports("license", function()
    return '1ee4e10e83d288bec5691268bea8ce05361ef78ec29ef04ce653c100777517d21a08d0b5df9f9125649a889b14ec80090e25'
end)

return config

--[[
Caso use opção de ganhar item    
Criar itens 
{
    portacarro
    motor
    pneucarro
    capocarro
    portacarroimportado
    pneucarroimportado
    portacaminhao
    pneucaminhao
    pneumoto
    carenagem
}
]]