game 'gta5'
fx_version 'cerulean'

lua54 'yes'
description 'resource_description'
author 'author_name'
version '1.0.0'

shared_scripts {
    '@ox_lib/init.lua',
    'Shared/*.lua'
}

server_scripts {
    'Server/*.lua'
}

client_scripts {
    'Client/*.lua'
}