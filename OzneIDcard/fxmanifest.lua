fx_version 'adamant'  -- ne surtout pas changer

game 'gta5' -- ne surtout pas changer

client_scripts {
    "src/RMenu.lua",
    "src/menu/RageUI.lua",
    "src/menu/Menu.lua",
    "src/menu/MenuController.lua",

    "src/components/*.lua",

    "src/menu/elements/*.lua",

    "src/menu/items/*.lua",

    "src/menu/panels/*.lua",

    "src/menu/panels/*.lua",
    "src/menu/windows/*.lua",

}


client_scripts {
	'client.lua'
}


server_scripts {
	'server.lua'
}



dependencies {
	'es_extended'
}
