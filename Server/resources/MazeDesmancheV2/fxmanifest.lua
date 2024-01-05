fx_version 'bodacious'
games {'gta5'}
dependency 'vrp'

client_scripts {
    "@vrp/lib/utils.lua", 
    "@vrp/config/Item.lua",
	"@vrp/config/Vehicle.lua",
    "client.lua"
}

server_scripts {
	"@vrp/lib/utils.lua",
    "@vrp/config/Item.lua",
	"@vrp/config/Groups.lua",
	"@vrp/config/Vehicle.lua",
    "server.lua"
}

files {"config.lua"}