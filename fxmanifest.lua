fx_version 'cerulean'
games {'gta5'}
lua54 "yes"

author "Hirni"
description "A simple weapon clip script for ESX"
version "1.0.0"

client_scripts {
    '@es_extended/locale.lua',
    'config.lua',
    'client/client.lua',
}

server_scripts {
    '@es_extended/locale.lua',
    '@mysql-async/lib/MySQL.lua',
    'config.lua',
    'server/server.lua',
}