resource_manifest_version '44febabe-d386-4d18-afbe-5e627f4af937'

-- Scripts
--server_script '@mysql-async/lib/MySQL.lua'

--client_script '@essentialmode/server/player/wrappers.lua'
client_scripts {
	'warmenu.lua',
	'client.lua'
}

server_scripts { 
	'server.lua',
}