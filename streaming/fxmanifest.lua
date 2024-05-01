lua54 'yes'
fx_version 'cerulean'
game 'gta5'

files {
	'stream/**/interiorproxies.meta',
	'stream/**/carcols.meta',
	'stream/**/carvariations.meta',
	'stream/**/handling.meta',
	'stream/**/vehiclelayouts.meta',
	'stream/**/vehicles.meta',
	'stream/**/interiorproxies.meta',

	'stream/**/weaponcomponents.meta',
	'stream/**/weaponarchetypes.meta',
	'stream/**/weaponanimations.meta',
	'stream/**/pedpersonality.meta',
	'stream/**/weapons.meta',
}

data_file 'VEHICLE_LAYOUTS_FILE'	'stream/**/vehiclelayouts.meta'
data_file 'HANDLING_FILE'			'stream/**/handling.meta'
data_file 'VEHICLE_METADATA_FILE'	'stream/**/vehicles.meta'
data_file 'CARCOLS_FILE'			'stream/**/carcols.meta'
data_file 'VEHICLE_VARIATION_FILE'	'stream/**/carvariations.meta'

data_file 'WEAPONCOMPONENTSINFO_FILE' 'stream/**/weaponcomponents.meta'
data_file 'WEAPON_METADATA_FILE' 'stream/**/weaponarchetypes.meta'
data_file 'WEAPON_ANIMATIONS_FILE' 'stream/**/weaponanimations.meta'
data_file 'PED_PERSONALITY_FILE' 'stream/**/pedpersonality.meta'
data_file 'WEAPONINFO_FILE' 'stream/**/weapons.meta'


client_script 'cl_weaponNames.lua'

data_file 'WEAPONINFO_FILE' 'weapons.meta'