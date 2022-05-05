local colors={
{"black","#00000070"},
{"white","#FFFFFF70"},
{"red","#AA000070"},
{"blue","#0000AA70"},
{"green","#00ff0070"},
{"yellow","#ffff0070"},
}

local itens={{"flag_point_3d","flag_point_3d.png","flag_point_3d.obj"},}
for i = 1, #itens, 1 do
	for e = 1, #colors, 1 do
	
	minetest.register_craftitem("challenge:tool_"..itens[i][1].."_"..colors[e][1], {
	stack_max = 1,
	description = "challenge:tool"..itens[i][1].."_"..colors[e][1],
	inventory_image = "flag_point_3d.png^[multiply:"..colors[e][2],
	wield_image = "flag_point_3d.png^[multiply:"..colors[e][2],

	on_use =
		function(_, player, pointed_thing, pos)
			jogador=player:get_player_name()
			local position = vector.add({x=0, y=0, z=0},player:get_pos())
			--local position = vector.add(pos, {x = 0, y =-1, z = 0})
			if  minetest.get_node(position).name == "air" then
				local node_add=minetest.set_node(position, {name="challenge:"..itens[i][1].."_"..colors[e][1]})
					local meta = minetest.get_meta(position)
					meta:set_string("infotext", (jogador))
					meta:set_string("owner", jogador)
					local timer = minetest.get_node_timer(position)
					timer:start(0.2)
				minetest.after(0, function() player:get_inventory():remove_item("main", "challenge:tool_"..itens[i][1].."_"..colors[e][1]) end)
			end
		end,
	})

minetest.register_node("challenge:"..itens[i][1].."_"..colors[e][1],{
		description =itens[i][1].."_"..colors[e][1],
		ight_source = 5,
		walkable=false,
		--on_rotate = true,
		--drawtype = "glasslike_framed_optional",
		use_texture_alpha ="clip",
		sunlight_propagates = true,
		paramtype2 = "facedir",
		tiles = {itens[i][2].."^[multiply:"..colors[e][2]}, --texturas
		drawtype = "mesh",
		mesh = itens[i][3],
		pathfinding= true,
		inventory_image = "challenge_circle_open.png^[multiply:"..colors[e][2],
		wield_image = "challenge_circle_open.png^[multiply:"..colors[e][2],
		paramtype = "light",
		drop="challenge:tool"..itens[i][1].."_"..colors[e][1],
		groups = {cracky=3,oddly_breakable_by_hand=3,torch=1, not_in_creative_inventory=1},
		selection_box = {type = "fixed",	fixed = { -0.5, -0, -0.5, 0.5, 1, 0.5 }},
		collision_box = {type = "fixed",	fixed = { -0.5, -0, -0.5, 0.5, 1, 0.5 }},

	after_place_node = function (pos, placer)
			--local meta = minetest.get_meta(pos)
			local timer = minetest.get_node_timer(pos)
			timer:start(0.2)
			--minetest.chat_send_all("test")
			--[[jogador=placer:get_player_name()
			local fields="field[1.8,2;3,0.8;name;name;"..jogador.."]"
			local sair="button_exit[1.8,4;3,1.1;exit;save]"
					--animated_image[X,Y;W,H;name;texture_name;frame_count;frame_duration;frame_start]
			local image="animated_image[2.5,0.2;1,1;anim;anim.png;8;2;0]"
			local formulario = "formspec_version[5]size[6,6]"..image..fields..sair.."]"

			minetest.show_formspec(jogador,"man:test",formulario)
			minetest.register_on_player_receive_fields(function(clicker, formname, fields)

			if fields.name==nil or fields.name=="" then fields.name="Posted by_"..jogador.."_undefined_name" end
			if formname ~= "man:test" then return false end
				local meta = minetest.get_meta(pos)
				meta:set_string("infotext", (fields.name))
				meta:set_string("owner", jogador)
			return true
			end)]]
	end,

	on_rightclick = function(pos, node, clicker, itemstack, pointed_thing)
			local meta = minetest.get_meta(pos)
			local jogador=clicker:get_player_name()
			local owner = meta:get_string("owner")
			if owner~=jogador then
				minetest.chat_send_player(jogador,"This block is not yours") return
			end

			local fields="field[1.8,2;3,0.8;name;name;"..jogador.."]"
			local sair="button_exit[1.8,4;3,1.1;exit;save]"
					--animated_image[X,Y;W,H;name;texture_name;frame_count;frame_duration;frame_start]
			local image="animated_image[2.5,0.2;1,1;anim;anim.png;8;2;0]"
			local formulario = "formspec_version[5]size[6,6]"..image..fields..sair.."]"

			minetest.show_formspec(jogador,"man:test",formulario)
			minetest.register_on_player_receive_fields(function(clicker, formname, fields)

			if fields.name==nil or fields.name=="" then fields.name="Posted by_"..jogador.."_undefined_name" end
			if formname ~= "man:test" then return false end
				
				meta:set_string("infotext", (fields.name))
				minetest.chat_send_player(jogador,"Name changed to:"..fields.name)
			return true
			end)
		end,
	on_timer = function(pos,node)
		local timer = minetest.get_node_timer(pos)
		timer:start(0.2) 
		local meta = minetest.get_meta(pos)
		local all_objects = minetest.get_objects_inside_radius({x = pos.x, y = pos.y, z = pos.z}, 2)
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
end

--recipe
--white
minetest.register_craft({
	output = "challenge:tool_flag_point_3d_white",
	recipe = {
                  {"group:leaves",	"group:leaves",		"group:leaves"},
                  {"group:leaves",	"default:mese_crystal",	"group:leaves"},
                  {"group:leaves",	"group:leaves",		"group:leaves"},
			}})

--black
minetest.register_craft({ output = "challenge:tool_flag_point_3d_black", recipe = {
						{"challenge:tool_flag_point_3d_white", "default:coal_lump"},} })
--red
minetest.register_craft({ output = "challenge:tool_flag_point_3d_red", recipe = {
						{"challenge:tool_flag_point_3d_white", "flowers:rose"},} })

--blue
minetest.register_craft({ output = "challenge:tool_flag_point_3d_blue", recipe = {
						{"challenge:tool_flag_point_3d_white", "flowers:geranium"},} })
--green
minetest.register_craft({ output = "challenge:tool_flag_point_3d_green", recipe = {
						{"challenge:tool_flag_point_3d_white", "default:cactus"},} })
--yellow
minetest.register_craft({ output = "challenge:tool_flag_point_3d_yellow", recipe = {
						{"challenge:tool_flag_point_3d_white", "flowers:dandelion_yellow"},} })
