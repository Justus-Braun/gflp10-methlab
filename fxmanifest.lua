fx_version "cerulean"
game "gta5"

version "1.0.0"
author "GFLP10#7754"
description "Methlab script for Milos Meth MLO"

lua54 'yes'

escrow_ignore {
    'server/main.lua',
    'config.lua',
    'locales/*',
    'client/notify.lua'
}

shared_script 'config.lua'

client_scripts {
    '@es_extended/locale.lua',
    "client/notify.lua",
    "client/main.lua",
    "locales/*",
}

server_scripts {
    -- '@es_extended/locale.lua',
    '@qb-core/shared/locale.lua',
    "@mysql-async/lib/MySQL.lua",
    "server/framework.lua",
    "server/main.lua",
    "locales/*",
}