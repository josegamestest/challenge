local cores={
{"white","#FFFFFF70"},
{"red","#AA000070"},
{"blue","#0000AA70"},
{"green","#00ff0070"},
}

local function is_ground(pos)
  local nn = minetest.get_node(pos).name
return minetest.get_item_group(nn, "stone") ~= 0
end 

for i = 1, #cores, 1 do

minetest.register_node("challenge:ground_"..cores[i][1], {
	description = "ground_"..cores[i][1],
    tiles = {"ground.png^[colorize:"..cores[i][2]},
	light_source = 5,
	walkable=true,
	paramtype = "light",is_ground_content = true,
	groups = {cracky = 2, oddly_breakable_by_hand = 2, soil = 1},

after_place_node = function (pos, placer)
			local timer = minetest.get_node_timer(pos)
			timer:start(0.2)
end,

on_timer = function(pos,node)
		local timer = minetest.get_node_timer(pos)
		timer:start(0.2) 
		local meta = minetest.get_meta(pos)
		local throw_starting_pos={}
		throw_starting_pos = vector.add({x=0, y=1, z=0},pos)
		local all_objects = minetest.get_objects_inside_radius(throw_starting_pos, 0.5)
		local players = {}
			local _,obj for _,obj in ipairs(all_objects) do
				if obj:is_player() then 
					local player_name = obj:get_player_name()
					meta:set_string("infotext", ("Chekpoint: "..player_name))
					table.insert(players, obj) 
					if #players == 1 then
					minetest.sound_play("catch2", {pos=pos, gain = 1.0, max_hear_distance = 5})
		end end end
	end,
})
end
