challenge = {}
--minetest.log("action", "[MOD]"..modname.." -- loaded from "..path)

dofile(minetest.get_modpath("challenge") .. DIR_DELIM .. "3d/chekpoints_3d.lua") 
dofile(minetest.get_modpath("challenge") .. DIR_DELIM .. "3d/flag_point_3d.lua")
dofile(minetest.get_modpath("challenge") .. DIR_DELIM .. "nodes_ground.lua") 
--dofile(minetest.get_modpath("challenge") .. DIR_DELIM .. "tools/move_tool.lua") 
