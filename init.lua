--[[local default_path = minetest.get_modpath("challenge")
dofile(default_path.."/flags/chekpoints.lua")
dofile(default_path.."/flags/flag_point.lua")
dofile(default_path.."/nodes_ground.lua")
dofile(default_path.."/balloon.lua")
]]

challenge = {}
dofile(minetest.get_modpath("challenge") .. DIR_DELIM .. "flags/chekpoints.lua") 
dofile(minetest.get_modpath("challenge") .. DIR_DELIM .. "flags/flag_point.lua")
dofile(minetest.get_modpath("challenge") .. DIR_DELIM .. "flags/recipe.lua")


dofile(minetest.get_modpath("challenge") .. DIR_DELIM .. "nodes_ground.lua") 
dofile(minetest.get_modpath("challenge") .. DIR_DELIM .. "balloon.lua") 
