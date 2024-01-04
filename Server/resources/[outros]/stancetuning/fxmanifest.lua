fx_version "bodacious"
game "gta5"
lua54 "yes"

name "stancetuning"
description "Stance Tuning"
author "JesusBGK"
version "2.3"

ui_page "web-side/index.html"

client_scripts {
	"config/*.lua",
	"@vrp/lib/Utils.lua",
	"client-side/*"
}

server_scripts {
	"config/*.lua",
	"@vrp/lib/Utils.lua",
	"server-side/*"
}

files {
	"web-side/*",
	"web-side/**/*"
}

escrow_ignore {
	"config/*"
}
dependency '/assetpacks'