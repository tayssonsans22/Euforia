fx_version "bodacious"
game "gta5"
lua54 "yes"

name "streetraces"
description "Street Races"
author "JesusBGK"
version "1.2"

ui_page "web-side/index.html"

client_scripts {
	"@vrp/lib/Utils.lua",
	"config.lua",
    "races_cl.lua"
}

server_scripts {
	"@vrp/lib/Utils.lua",
	"config.lua",
    "port_sv.lua",
    "races_sv.lua"
}

files {
	"web-side/*",
	"web-side/**/*"
}

escrow_ignore {
	"config.lua",
	"port_sv.lua"
}
dependency '/assetpacks'