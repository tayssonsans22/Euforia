fx_version "bodacious"
game "gta5"
lua54 "yes"

name "skinweapon"
description "Skin Weapon"
author "JesusBGK"
version "2.2"

ui_page "web-side/build/index.html"

client_scripts {
	"client-side/*"
}

server_scripts {
	"server-side/*"
}

shared_scripts {
	"@vrp/lib/Utils.lua",
    "config/*"
}

files {
	"web-side/*",
	"web-side/**/*",
	"web-side/build/**/*",
	"stream/*.ytyp"
}

data_file "DLC_ITYP_REQUEST" "mt_boxpreta.ytyp"

escrow_ignore {
	"config/*"
}
dependency '/assetpacks'