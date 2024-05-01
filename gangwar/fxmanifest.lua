fx_version 'adamant'
game 'gta5'

server_scripts {
    'utils/**',
    '@oxmysql/lib/MySQL.lua',
    'entrance.lua',
}

client_scripts {
    'libs/RageUI/RMenu.lua',
    'libs/RageUI/menu/RageUI.lua',
    'libs/RageUI/menu/Menu.lua',
    'libs/RageUI/menu/MenuController.lua',
    'libs/RageUI/components/*.lua',
    'libs/RageUI/menu/elements/*.lua',
    'libs/RageUI/menu/items/*.lua',
    'libs/RageUI/menu/panels/*.lua',
    'libs/RageUI/menu/windows/*.lua',

    'scripts/loader.lua',
    'ipl/load/**/*.lua',
}
ui_page 'web/dist/index.html'
files {
    'web/dist/**',
    'loading/dist/**',
    'meta/*.meta',
    'data/**/*.meta',
}

shared_scripts {
    'shared/*.lua',
}

data_file 'HANDLING_FILE' 'data/**/handling.meta'
data_file 'VEHICLE_METADATA_FILE' 'data/**/vehicles.meta'
data_file 'CARCOLS_FILE' 'data/**/carcols.meta'
data_file 'VEHICLE_VARIATION_FILE' 'data/**/carvariations.meta'
data_file 'VEHICLE_LAYOUTS_FILE' 'data/**/vehiclelayouts.meta'
data_file 'VEHICLE_SHOP_DLC_FILE' 'data/**/shop_vehicle.meta'

data_file 'WEAPONINFO_FILE_PATCH' 'meta/weapons.meta'
data_file 'PED_METADATA_FILE' 'meta/peds.meta'

dependencies {
    '/server:4890', -- Node16+
}

loadscreen 'loading/dist/index.html'
loadscreen_cursor 'yes'