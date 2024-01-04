fx_version "bodacious"
game "gta5"
lua54 "yes"

ui_page "web/index.html"

client_scripts {
	"@vrp/lib/Utils.lua",
	"shared/*",
	"client/*"
}

server_scripts {
	"@vrp/lib/Utils.lua",
	"@vrp/config/License.lua",
	"shared/*",
	"server/*"
}

files {
	"web/*",
	"web/**/*"
}