shared_script "@vrp/lib/lib.lua" --Para remover esta pendencia de todos scripts, execute no console o comando "uninstall"

fx_version "adamant"
game "gta5"

this_is_a_map "yes"

client_script {
    "client/*.lua"
}

files {
    "client/*.lua"
}

data_file 'DLC_ITYP_REQUEST' 'stream/*.ytyp'
data_file 'DLC_ITYP_REQUEST' 'stream/*/*.ytyp'