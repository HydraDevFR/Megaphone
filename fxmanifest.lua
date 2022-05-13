fx_version 'bodacious'
game 'gta5'

version '1.0'
description 'MEGAPHONE @HydraDev'

client_scripts {
	'@NativeUI/NativeUI.lua',
	'megaphone/client.lua',
	'interact-sound/client/main.lua',
	'config.lua'
}

server_script 'interact-sound/server/main.lua'

ui_page "interact-sound/client/html/index.html"

files({
    'interact-sound/client/html/index.html',
    'interact-sound/client/html/sounds/coter2.ogg',
	'interact-sound/client/html/sounds/gn-coter.ogg',
	'interact-sound/client/html/sounds/gn-dispertion.ogg',
	'interact-sound/client/html/sounds/gn-lastcoter.ogg',
	'interact-sound/client/html/sounds/gn-suivre.ogg',
	'interact-sound/client/html/sounds/police-coter.ogg',
	'interact-sound/client/html/sounds/police-dispertion.ogg',
	'interact-sound/client/html/sounds/police-lastcoter.ogg',
	'interact-sound/client/html/sounds/police-suivre.ogg'
})