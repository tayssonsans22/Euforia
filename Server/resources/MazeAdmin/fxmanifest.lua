fx_version 'adamant'
game 'gta5'

ui_page 'nui/nui.html'

files {
	'nui/**'
}

client_scripts {
	"@vrp/lib/Utils.lua",
	"config.lua",
	"client.lua"
}

server_scripts{
	"@vrp/config/Item.lua",
	"@vrp/config/Groups.lua",
	"@vrp/config/Vehicle.lua",
	"@vrp/lib/Utils.lua",
	"config.lua",
	"server.lua"
}