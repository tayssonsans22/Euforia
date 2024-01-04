shared_script "@ThnAC/native.lua"
shared_script "@ThnAC/natives.lua"
--shared_script "@vrp/lib/lib.lua" --Para remover esta pendencia de todos scripts, execute no console o comando "uninstall"

fx_version 'bodacious'
game 'gta5'

files {
    'data/**/handling.meta',
    'data/**/vehicles.meta',
    'data/**/carcols.meta',
    'data/**/carvariations.meta',
    "data/**/vehiclelayouts.meta",
    'data/**/dlctext.meta',	
}

data_file 'HANDLING_FILE' 'data/**/handling.meta'
data_file 'VEHICLE_LAYOUTS_FILE' 'data/**/vehiclelayouts.meta'
data_file 'VEHICLE_METADATA_FILE' 'data/**/vehicles.meta'
data_file 'CARCOLS_FILE' 'data/**/carcols.meta'
data_file 'VEHICLE_VARIATION_FILE' 'data/**/carvariations.meta'
data_file '_CONTENT_UNLOCKS_FILE' 'data/**/contentunlocks.meta'
data_file 'DLC_TEXT_FILE' 'data/**/dlctext.meta'

client_script {
    'data/**/vehicle_names.lua',
	'tuning.lua',
}              
 
               