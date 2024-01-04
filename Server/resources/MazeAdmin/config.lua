local Tunnel = module("vrp","lib/Tunnel")
local Proxy = module("vrp","lib/Proxy")
local Tools = module("vrp","lib/Tools")
vRP = Proxy.getInterface("vRP")
vRPclient = Tunnel.getInterface("vRP")

config = {}
config.comando = "admin"

config.creativev6 = true -- Caso use Creative V6

config.foto = "http://localhost/Carros/" -- DIRETORIO DAS IMAGENS DOS VEÍCULOS
config.fotoItens = "nui://vrp/config/inventory/" -- DIRETORIO DAS IMAGENS DOS VEÍCULOS

config.staff = {
    'Dono',
    'Admin'
}

config.perms = {
    ['acesso'] = "Admin",
    ['logs'] = "Admin",
    ['banir'] = "Admin",
    ['desbanir'] = "Admin",
    ['wl'] = "Admin",
    ['unwl'] = "Admin",
    ['kill'] = "Admin",
    ['kick'] = "Admin",
    ['kickall'] = "Admin",
    ['banco'] = "Admin",
    ['money'] = "Admin",
    ['limparinv'] = "Admin",
    ['renomear'] = "Admin",
    ['celular'] = "Admin",
    ['idade'] = "Admin",
    ['rg'] = "Admin",
    ['criartp'] = "Admin",
    ['deletartp'] = "Admin",
    ['addcar'] = "Admin",
    ['remcar'] = "Admin",
    ['car'] = "Admin",
    ['addhome'] = "Admin",
    ['remhome'] = "Admin",
    ['item'] = "Admin",
    ['algemar'] = "Admin",
    ['desalgemar'] = "Admin",
    ['dados'] = "Admin",
    ['addgroup'] = "Admin",
    ['ungroup'] = "Admin",
    ['prender'] = "Admin",
    ['soltar'] = "Admin"
}

config.webhook = {
    ['imagem'] = "", -- Foto para webhook 

    ['banir'] = "",
    ['desbanir'] = "",
    ['wl'] = "",
    ['unwl'] = "",
    ['kill'] = "",
    ['kick'] = "",
    ['kickall'] = "",
    ['banco'] = "",
    ['money'] = "",
    ['limparinv'] = "",
    ['renomear'] = "",
    ['celular'] = "",
    ['idade'] = "",
    ['rg'] = "",
    ['criartp'] = "",
    ['deletartp'] = "",
    ['addcar'] = "",
    ['remcar'] = "",
    ['car'] = "",
    ['addhome'] = "",
    ['remhome'] = "",
    ['item'] = "",
    ['algemar'] = "",
    ['desalgemar'] = "",
    ['dados'] = "",
    ['addgroup'] = "",
    ['ungroup'] = "",
    ['prender'] = "",
    ['soltar'] = ""
}

config.db = {
    ['dbcarros'] = "vehicles",
    ['carros'] = "vehicle",
    ['dbcasas'] = "propertys"
}

config.soltar = function(id)
    -- Aqui coloca a lógica de soltar da sua base
end

config.prender = function(source,id)
    -- Aqui coloca a lógica de prender da sua base, para gerar log no discord e painel retorne 2 valores, primeiro true e depois o tempo da prisão
    local tempo = vRP.prompt(source,"Tempo de Prisão:","")
	if tempo == "" then
		return
    end
    return true, tempo
end

------------------------------------------------------------------------------------------------------------------------------
--[ PREPARES ]----------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------------
-- Aqui pode editar onde as informações serão enviadas, troque apenas o nomes das tabelas e as informações dela, não altere os @ nem o admin/(nome aqui)
if config.creativev6 then
    vRP.Prepare("admin/setNome","UPDATE vrp_user_identities SET name = @nome, firstname = @firstname WHERE user_id = @user_id")
    vRP.Prepare("admin/setIdade","UPDATE vrp_user_identities SET age = @age WHERE user_id = @user_id")
    vRP.Prepare("admin/setRG","UPDATE vrp_user_identities SET registration = @rg WHERE user_id = @user_id")
    vRP.Prepare("admin/setCelular","UPDATE vrp_user_identities SET phone = @phone WHERE user_id = @user_id")
    vRP.Prepare("admin/setCasa","INSERT IGNORE INTO propertys(home,user_id,owner,tax,garage) VALUES(@home,@user_id,1,@tax,1)")
    vRP.Prepare("admin/remCasa","DELETE FROM propertys WHERE user_id = @user_id AND home = @home")
    vRP.Prepare("admin/countHouse","SELECT * FROM propertys")
else
    vRP.prepare("admin/setNome","UPDATE vrp_user_identities SET name = @nome, firstname = @firstname WHERE user_id = @user_id")
    vRP.prepare("admin/setIdade","UPDATE vrp_user_identities SET age = @age WHERE user_id = @user_id")
    vRP.prepare("admin/setRG","UPDATE vrp_user_identities SET registration = @rg WHERE user_id = @user_id")
    vRP.prepare("admin/setCelular","UPDATE vrp_user_identities SET phone = @phone WHERE user_id = @user_id")
    vRP.prepare("admin/setCasa","INSERT IGNORE INTO vrp_homes_permissions(home,user_id,owner,tax,garage) VALUES(@home,@user_id,1,@tax,1)")
    vRP.prepare("admin/remCasa","DELETE FROM vrp_homes_permissions WHERE user_id = @user_id AND home = @home")
    vRP.prepare("admin/countHouse","SELECT * FROM vrp_homes_permissions")
end
exports("license", function()
    return 'ad53c5e443a11aa9ed42ea496b896fd14005357c7abfa8e169827c39ecae23015c5823eb3ece82ee944e7cdbfcfb68182828'
end)