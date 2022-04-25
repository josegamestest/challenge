local colors={
{"black","#00000070"},
{"white","#FFFFFF70"},
{"red","#AA000070"},
{"blue","#0000AA70"},
{"green","#00ff0070"},
{"yellow","#ffff0070"},
}
local info_name="00"
local open=false
itens={
		{"challenge_circle_tool","challenge_circle_closed","challenge_circle_open"},
      }
for i = 1, #itens, 1 do
for e = 1, #colors, 1 do

minetest.register_craftitem("challenge:"..itens[i][1].."_"..colors[e][1], {
  stack_max = 1,
                                                                           
  description = itens[i][1].."_"..colors[e][1],
  inventory_image = itens[i][1]..".png^[multiply:"..colors[e][2],
  on_use =
    function(_,player, pointed_thing, pos)
      local throw_starting_pos = vector.add({x=0, y=1.5, z=0}, player:get_pos())
      minetest.after(0, function() player:get_inventory():remove_item("main", "challenge:"..itens[i][1].."_"..colors[e][1]) end)
		local posicao = player:get_pos()
		local node = minetest.get_node(posicao)
			
    if node.name == "air" then
			jogador=player:get_player_name()
				minetest.get_node_timer(posicao):start(4.5)
		local fields="field[0.9,1.3;3.6,1.3;name;name;]"
		local sair="button_exit[5.1,1.3;1.5,1.3;exit;save]"
		local formulario = "formspec_version[5]size[8,4]"..fields..sair.."]"

		minetest.show_formspec(jogador,"man:test",formulario)
		minetest.register_on_player_receive_fields(function(player, formname, fields)

		if fields.name==nil or fields.name=="" then fields.name=jogador end
		if formname ~= "man:test" then return false end
			local open_circle
			open_circle=minetest.add_entity(posicao, "challenge:"..itens[i][2].."_"..colors[e][1])
			open_circle:set_properties({ infotext = fields.name, nametag = fields.name })
		return true
		end)
		
		
        
    end
    end,
})

minetest.register_entity("challenge:"..itens[i][2].."_"..colors[e][1],{   --propriedades da entidade
	hp_max = 50,
	physical = true,
	weight = 5,
	collide_with_objects = false,
	selectionbox = {-1,-1,-1,1,1,1},
	--visual = "cube"/"sprite"/"upright_sprite"/"mesh"/"wielditem",
	visual = "upright_sprite",
	textures = {itens[i][2]..".png^[multiply:"..colors[e][2]}, --texturas
	initial_sprite_basepos = {x=0, y=0},
	visual_size = {x=2, y=2},
	is_visible = true,
	automatic_rotate = 1,
	backface_culling = false,
	player_name = "",
	drop="",


on_activate = function(self,pos,staticdata,dtime)
        if staticdata ~= "" and staticdata ~= nil then
            local data = minetest.deserialize(staticdata) or {}
        end
end,

on_step =function(self,pos,dtime)

--on_activate = function(self,pos,dtime)
	position = self.object:get_pos()
	if position == nil then return end
		local all_objects = minetest.get_objects_inside_radius(position, 2)
		local players = {}
		local _,obj for _,obj in ipairs(all_objects) do
		if obj:is_player() then 
			local player_name = obj:get_player_name()
			info_name=player_name
			table.insert(players, obj) 

			if #players == 1 then
					
				if open==false then
					open=true
					local selfobject=self.object
					minetest.sound_play("catch2", {pos=position, gain = 1.0, max_hear_distance = 5})
					selfobject:set_properties(
						{infotext = player_name,
							nametag = player_name,
							textures = {itens[i][3]..".png^[multiply:"..colors[e][2]},
						})
						minetest.after(5, function(selfobject)
							open=false
							selfobject:set_properties(
								{infotext = player_name,
									nametag = player_name,
									textures = {itens[i][2]..".png^[multiply:"..colors[e][2]},
								}) 
							end,selfobject)
end end 
end end end 
})
end end
    

minetest.register_craftitem("challenge:challenge_remove_tool", {
  stack_max = 1,
  description ="challenge_remove_tool",
  inventory_image = "challenge_remove_tool.png^[multiply:"..colors[3][2],
  on_use=function(itemstack, user, pointed_thing,pos)
	for _, ob in pairs(minetest.get_objects_inside_radius(user:get_pos(), 5)) do
	if not ob:is_player() and (not entity or not entity.name:find()) then 
        ob:remove() 
	end
	end 
end,
})
