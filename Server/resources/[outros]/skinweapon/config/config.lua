-----------------------------------------------------------------------------------------------------------------------------------------
-- VARIABLES
-----------------------------------------------------------------------------------------------------------------------------------------
Config = {
	Command = "skinw", -- comando para abrir o sistema de skins
	Framework = "creative_network", -- alterar compatibilidade do script (creative_network, creative_v5, vrpex)
	Perm = "Admin", -- permissão para abrir o sistema de skins pelo server, coloque false para não precisar de permissão
	Transfer = true -- ativar ou desativar a transferência de skins (true, false)
}
-----------------------------------------------------------------------------------------------------------------------------------------
-- SKINGLOBAL
-----------------------------------------------------------------------------------------------------------------------------------------
-- "Lendária" "Épica" "Rara" "Normal"
SkinGlobal = {
	["COMPONENT_AMT_CRIMSONQUEEN"] = { "AMT 380 Crimson Queen",75,"WEAPON_SNSPISTOL","Épica","nui://skinweapon/web-side/images/crimson.png" },
	["COMPONENT_AMT_BLOSSOM"] = { "AMT 380 Blossom",75,"WEAPON_SNSPISTOL","Épica","nui://skinweapon/web-side/images/blossom.png" },
	["COMPONENT_FIVESEVEN_TRIPPYFOX"] = { "FN Five Seven Trippy Fox",75,"WEAPON_PISTOL_MK2","Épica","nui://skinweapon/web-side/images/fox.png" },
	["COMPONENT_FIVESEVEN_NAMIFADE"] = { "FN Five Seven Nami Fade",75,"WEAPON_PISTOL_MK2","Épica","nui://skinweapon/web-side/images/namifade.png" },
	["COMPONENT_FIVESEVEN_BLUE"] = { "FN Five Seven Shadow Blue ",75,"WEAPON_PISTOL_MK2","Épica","nui://skinweapon/web-side/images/blue.png" },
	["COMPONENT_FIVESEVEN_SHIPPUDEN"] = { "FN Five Seven Shippuden",75,"WEAPON_PISTOL_MK2","Épica","nui://skinweapon/web-side/images/shippuden.png" },
	["COMPONENT_FIVESEVEN_MANDRAK"] = { "FN Five Seven Mandrak",75,"WEAPON_PISTOL_MK2","Épica","nui://skinweapon/web-side/images/mandrak.png" },
	["COMPONENT_FIVESEVEN_PEACE"] = { "FN Five Seven Peace",75,"WEAPON_PISTOL_MK2","Épica","nui://skinweapon/web-side/images/peace.png" },
	["COMPONENT_GLOCK_SCARFACE"] = { "Glock Flex X Scarface",75,"WEAPON_COMBATPISTOL","Épica","nui://skinweapon/web-side/images/scarface.png" },
	["COMPONENT_GLOCK_SEATERROR"] = { "Glock Sea Terror",75,"WEAPON_COMBATPISTOL","Épica","nui://skinweapon/web-side/images/sea.png" },
	["COMPONENT_GLOCK_REDSAMURAI"] = { "Glock Red Samurai",75,"WEAPON_COMBATPISTOL","Épica","nui://skinweapon/web-side/images/samurai.png" },
	["COMPONENT_GLOCK_DRAGON"] = { "Glock Dragon Rose",75,"WEAPON_COMBATPISTOL","Épica","nui://skinweapon/web-side/images/rose.png" },
	["COMPONENT_GLOCK_FADE"] = { "Glock Fade",75,"WEAPON_COMBATPISTOL","Épica","nui://skinweapon/web-side/images/fade.png" },
	["COMPONENT_GLOCK_BEAST"] = { "Glock Hyper Beast",75,"WEAPON_COMBATPISTOL","Épica","nui://skinweapon/web-side/images/beast.png" },
	["COMPONENT_GLOCK_FLA"] = { "Glock Flamengo",75,"WEAPON_COMBATPISTOL","Épica","nui://skinweapon/web-side/images/fla.png" },
	["COMPONENT_GLOCK_NEO"] = { "Glock Neo Noir",75,"WEAPON_COMBATPISTOL","Épica","nui://skinweapon/web-side/images/neo.png" },
	["COMPONENT_GLOCK_NIKE"] = { "Glock Nike",75,"WEAPON_COMBATPISTOL","Épica","nui://skinweapon/web-side/images/nike.png" },
	["COMPONENT_GLOCK_PURPLE"] = { "Glock Purple Edition",75,"WEAPON_COMBATPISTOL","Épica","nui://skinweapon/web-side/images/purple.png" },
	["COMPONENT_GLOCK_WEED"] = { "Glock Weed Smoke",75,"WEAPON_COMBATPISTOL","Épica","nui://skinweapon/web-side/images/weed.png" },
	["COMPONENT_DESERT_OMATSURI"] = { "Desert Eagle Omatsuri",75,"WEAPON_PISTOL50","Épica","nui://skinweapon/web-side/images/omatsuri.png" },
	["COMPONENT_MAGNUM_KITSUNE"] = { "Magnum 44 Kitsune",75,"WEAPON_REVOLVER","Épica","nui://skinweapon/web-side/images/kitsune.png" },
	["COMPONENT_AK103_DRAGON"] = { "AK-103 Dragon",100,"WEAPON_ASSAULTRIFLE","Lendária","nui://skinweapon/web-side/images/dragon.png" },
	["COMPONENT_AK103_NEON"] = { "AK-103 Neon Rider",100,"WEAPON_ASSAULTRIFLE","Lendária","nui://skinweapon/web-side/images/neon.png" },
	["COMPONENT_AK103_LOTUS"] = { "AK-103 Lotus",100,"WEAPON_ASSAULTRIFLE","Lendária","nui://skinweapon/web-side/images/lotus.png" },
	["COMPONENT_AK103_DONUT"] = { "AK-103 Donut",100,"WEAPON_ASSAULTRIFLE","Lendária","nui://skinweapon/web-side/images/donut.png" },
	["COMPONENT_AK103_HELL"] = { "AK-103 Hell Flames",100,"WEAPON_ASSAULTRIFLE","Lendária","nui://skinweapon/web-side/images/hell.png" },
	["COMPONENT_AK103_BEAST"] = { "AK-103 Demonic Beast",100,"WEAPON_ASSAULTRIFLE","Lendária","nui://skinweapon/web-side/images/demonic.png" },
	["COMPONENT_AK103_DEMON"] = { "AK-103 Demon",100,"WEAPON_ASSAULTRIFLE","Lendária","nui://skinweapon/web-side/images/demon.png" },
	["COMPONENT_AK74_GOLD"] = { "AK-74 Golden",100,"WEAPON_ASSAULTRIFLE_MK2","Lendária","nui://skinweapon/web-side/images/golden.png" },
	["COMPONENT_AK74_SILVER"] = { "AK-74 Silvery",100,"WEAPON_ASSAULTRIFLE_MK2","Lendária","nui://skinweapon/web-side/images/silvery.png" },
	["COMPONENT_G36C_GOLD"] = { "G36C Gold Standard",100,"WEAPON_SPECIALCARBINE","Lendária","nui://skinweapon/web-side/images/standard.png" },
	["COMPONENT_G36C_MONKEY"] = { "G36C Wandering Monkey",100,"WEAPON_SPECIALCARBINE","Lendária","nui://skinweapon/web-side/images/monkey.png" },
	["COMPONENT_G36C_ONI"] = { "G36C Broken Oni",100,"WEAPON_SPECIALCARBINE","Lendária","nui://skinweapon/web-side/images/oni.png" },
	["COMPONENT_G36C_ROSES"] = { "G36C Skull Roses",100,"WEAPON_SPECIALCARBINE","Lendária","nui://skinweapon/web-side/images/roses.png" },
	["COMPONENT_G36C_SKULL"] = { "G36C Samurai Skull",100,"WEAPON_SPECIALCARBINE","Lendária","nui://skinweapon/web-side/images/skull.png" },
	["COMPONENT_G36C_STREAKS"] = { "G36C Red Streaks",100,"WEAPON_SPECIALCARBINE","Lendária","nui://skinweapon/web-side/images/streaks.png" },
	["COMPONENT_G36C_MECHA"] = { "G36C Mecha Samurai",100,"WEAPON_SPECIALCARBINE","Lendária","nui://skinweapon/web-side/images/mecha.png" },
	["COMPONENT_G36C_ANGRY"] = { "G36C Oni Mask Angry",100,"WEAPON_SPECIALCARBINE","Lendária","nui://skinweapon/web-side/images/angry.png" },
	["COMPONENT_SIG_BARBIE"] = { "Sig Sauer 556 Barbie",100,"WEAPON_SPECIALCARBINE_MK2","Lendária","nui://skinweapon/web-side/images/barbie.png" },
	["COMPONENT_SIG_FLOWER"] = { "Sig Sauer 556 Pink Flower",100,"WEAPON_SPECIALCARBINE_MK2","Lendária","nui://skinweapon/web-side/images/flower.png" },
	["COMPONENT_SIG_GRAFITTI"] = { "Sig Sauer 556 Grafitti",100,"WEAPON_SPECIALCARBINE_MK2","Lendária","nui://skinweapon/web-side/images/grafitti.png" },
	["COMPONENT_SIG_HULK"] = { "Sig Sauer Hulk",100,"WEAPON_SPECIALCARBINE_MK2","Lendária","nui://skinweapon/web-side/images/hulk.png" },
	["COMPONENT_SIG_PUNK"] = { "Sig Sauer 556 Punk",100,"WEAPON_SPECIALCARBINE_MK2","Lendária","nui://skinweapon/web-side/images/punk.png" },
	["COMPONENT_SIG_RED"] = { "Sig Sauer 556 Stripe Red",100,"WEAPON_SPECIALCARBINE_MK2","Lendária","nui://skinweapon/web-side/images/stripered.png" },
	["COMPONENT_SIG_WAVE"] = { "Sig Sauer 556 Wave",100,"WEAPON_SPECIALCARBINE_MK2","Lendária","nui://skinweapon/web-side/images/wave.png" },
	["COMPONENT_M4A4_JAPAN"] = { "M4A4 Japan",100,"WEAPON_CARBINERIFLE_MK2","Lendária","nui://skinweapon/web-side/images/japan.png" },
	["COMPONENT_M4A4_REST"] = { "M4A4 Rest In Peace",100,"WEAPON_CARBINERIFLE_MK2","Lendária","nui://skinweapon/web-side/images/rest.png" },
	["COMPONENT_M4A4_TRUST"] = { "M4A4 Trust No One",100,"WEAPON_CARBINERIFLE_MK2","Lendária","nui://skinweapon/web-side/images/trust.png" },
	["COMPONENT_M4A4_GLASS"] = { "M4A4 Through a Glass",100,"WEAPON_CARBINERIFLE_MK2","Lendária","nui://skinweapon/web-side/images/glass.png" },
	["COMPONENT_M4A4_GEISHA"] = { "M4A4 Evil Geisha",100,"WEAPON_CARBINERIFLE_MK2","Lendária","nui://skinweapon/web-side/images/geisha.png" }
}

Categories = {
    {
        id = 1,
        name = "AMT 380",
        weapon = "WEAPON_SNSPISTOL",
        img = "nui://skinweapon/web-side/images/amt380.png",
        skins = {}
    },
    {
        id = 2,
        img = "nui://skinweapon/web-side/images/fiveseven.png",
        name = "FN Five Seven",
        weapon = "WEAPON_PISTOL_MK2",
        skins = {}
    },
    {
        id = 3,
        name = "Glock",
        weapon = "WEAPON_COMBATPISTOL",
        img = "nui://skinweapon/web-side/images/glock.png",
        skins = {}
    },
    {
        id = 4,
        name = "Desert Eagle",
        weapon = "WEAPON_PISTOL50",
        img = "nui://skinweapon/web-side/images/desert.png",
        skins = {}
    },
    {
        id = 5,
        name = "Magnum 44",
        weapon = "WEAPON_REVOLVER",
        img = "nui://skinweapon/web-side/images/magnum.png",
        skins = {}
    },
    {
        id = 6,
        name = "AK-103",
        weapon = "WEAPON_ASSAULTRIFLE",
        img = "nui://skinweapon/web-side/images/ak103.png",
        skins = {}
    },
    {
        id = 7,
        name = "AK-74",
        weapon = "WEAPON_ASSAULTRIFLE_MK2",
        img = "nui://skinweapon/web-side/images/ak74.png",
        skins = {}
    },
    {
        id = 8,
        name = "M4A4",
        weapon = "WEAPON_CARBINERIFLE_MK2",
        img = "nui://skinweapon/web-side/images/m4a4.png",
        skins = {}
    },
    {
        id = 9,
        name = "G36C",
        weapon = "WEAPON_SPECIALCARBINE",
        img = "nui://skinweapon/web-side/images/g36c.png",
        skins = {}
    },
    {
        id = 10,
        name = "Sig Sauer 556",
        weapon = "WEAPON_SPECIALCARBINE_MK2",
        img = "nui://skinweapon/web-side/images/sigsauer556.png",
        skins = {}
    }
}
-----------------------------------------------------------------------------------------------------------------------------------------
-- DEV
-----------------------------------------------------------------------------------------------------------------------------------------
-- client event para abrir o sistema de skins sem permição "skinweapon:OpenClient"
-- server event para abrir o sistema de skins com permissão "skinweapon:Open"


-- CREATIVE
-- local Skin = GlobalState["Skins"][Item..":"..Passport]

-- if Skin then -- inventário client
-- 	GiveWeaponComponentToPed(Ped,Name,Skin)
-- end


-- VRPEX
-- local Weapon = string.gsub(itemName,"wbody|","") -- inventário
-- local Skin = GlobalState["Skins"][Weapon..":"..user_id]

-- function tvRP.giveWeapons(weapons,clear_before,Skin) -- vrp client
-- 	local player = PlayerPedId()
-- 	if clear_before then
-- 		RemoveAllPedWeapons(player,true)
-- 		weapon_list = {}		  
-- 	end

-- 	for k,weapon in pairs(weapons) do
-- 		local hash = GetHashKey(k)
-- 		local ammo = weapon.ammo or 0
-- 		GiveWeaponToPed(player,hash,ammo,false)
-- 		weapon_list[string.upper(k)] = weapon
		
-- 		if Skin then
-- 			GiveWeaponComponentToPed(player,k,Skin)
-- 		end
-- 	end
-- end

-- for Weapon,_ in pairs(data.weapons) do -- vrp server
-- 	local Skin = GlobalState["Skins"][Weapon..":"..user_id]
-- 	if Skin then
-- 		TriggerClientEvent("skinweapon:Apply",source,Skin,k)
-- 	end
-- end

-- function vRP.updateWeapons(user_id,weapons) -- vrp server, função atualizar armas na db
-- 	if user_id then
-- 		local data = vRP.getUserDataTable(user_id)
-- 		if data then
-- 			data.weapons = weapons
-- 		end
-- 	end
-- end