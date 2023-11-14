fx_version "cerulean"
game "gta5"

version "1.0.0"
author "GFLP10#7754"
description "Methlab script for Milos Meth MLO"

lua54 'yes'

shared_scripts {
    '@ox_lib/init.lua',
    'config.lua'
}

client_scripts {
    "client/notify.lua",
    "client/main.lua",
}

files {
    'locales/*.json'
}

server_scripts {
    "@mysql-async/lib/MySQL.lua",
    "server/framework.lua",
    "server/main.lua",
}