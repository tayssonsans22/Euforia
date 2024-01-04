fx_version "bodacious"
game "gta5"

files {
	"data/*.meta",
    "weapons/*.meta"
}

data_file "WEAPONCOMPONENTSINFO_FILE" "data/weaponcomponents.meta"
data_file "WEAPON_METADATA_FILE" "data/weaponarchetypes.meta"
data_file "WEAPONINFO_FILE" "weapons/*.meta"
data_file "WEAPONINFO_FILE_PATCH" "weapons/*.meta"
dependency '/assetpacks'