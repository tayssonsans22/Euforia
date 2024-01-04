fx_version "bodacious"
game "gta5"
lua54 "yes"

name "remapping"
description "Remapping"
author "JesusBGK"
version "2.2"

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
	"web-side/**/*",
	"dlcturbosounds_sounds.dat54.rel",
    "dlc_turbosounds/turbosounds.awc"
}

data_file "AUDIO_WAVEPACK" "dlc_turbosounds"
data_file "AUDIO_SOUNDDATA" "dlcturbosounds_sounds.dat"

escrow_ignore {
	"config/*"
}
dependency '/assetpacks'