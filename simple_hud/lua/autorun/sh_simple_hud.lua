print(" ")
print(" ")
print(" - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - ")
print(" -                                                           - ")
print(" -                        Simple HUD                         - ")
print(" -                                                           - ")
print(" -                   Create by Linventif                     - ")
print(" -        Join my discord : https://dsc.gg/linventif         - ")
print(" -         Watch my website : https://linventif.org          - ")
print(" -                                                           - ")
print(" - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - ")
print(" ")
print(" ")

simple_hud = {
	["config"] = {
		["version"] = 1
	}
}

AddCSLuaFile("simple_hud/sh_config.lua")
include("simple_hud/sh_config.lua")

if SERVER then
	for k, v in ipairs(file.Find("simple_hud/server/*.lua", "LUA")) do
		include("simple_hud/server/" .. v)
	end

	for k, v in ipairs(file.Find("simple_hud/client/*.lua", "LUA")) do
		AddCSLuaFile("simple_hud/client/" .. v)
	end
else
    if !file.Exists("linventif", "data") then
        file.CreateDir("linventif")
        file.CreateDir("linventif/simple_hud")
		file.Write("linventif/simple_hud/config.json", util.TableToJSON(hud.config))
    elseif !file.Exists("linventif/simple_hud", "data") then
        file.CreateDir("linventif/simple_hud")
		file.Write("linventif/simple_hud/config.json", util.TableToJSON(hud.config))
	else
		local read_config = util.JSONToTable(file.Read("linventif/simple_hud/config.json", "DATA"))
		if read_config.version > simple_hud.config.version then
			simple_hud.config = read_config
		else
			file.Write("linventif/simple_hud/config.json", util.TableToJSON(hud.config))
		end
    end

	for k, v in ipairs(file.Find("simple_hud/server/*.lua", "LUA")) do
		include("simple_hud/server/" .. v)
	end

	for k, v in ipairs(file.Find("simple_hud/client/*.lua", "LUA")) do
		include("simple_hud/client/" .. v)
	end
end