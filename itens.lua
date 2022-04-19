local colors={
{"black","#00000070"},
{"white","#FFFFFF70"},
{"red","#AA000070"},
{"blue","#0000AA70"},
{"green","#00ff0070"},
{"yellow","#ffff0070"},
}

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
    function(_, player, pointed_thing, pos)
      local throw_starting_pos = vector.add({x=0, y=1.5, z=0}, player:get_pos())
      minetest.after(0, function() player:get_inventory():remove_item("main", "challenge:"..itens[i][1].."_"..colors[e][1]) end)
		local posicao = player:get_pos()
		local node = minetest.get_node(posicao)
    if node.name == "air" then
        --minetest.set_node(posicao, {name = "challenge:add_circle"})
		minetest.add_entity(posicao, "challenge:"..itens[i][3].."_"..colors[e][1])
        minetest.get_node_timer(posicao):start(4.5)
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

on_step= function(self,pos,dtime)
	position = self.object:get_pos()
		if position == nil then return end
		local all_objects = minetest.get_objects_inside_radius(position, 2)
		local players = {}
		local _,obj for _,obj in ipairs(all_objects) do
			if obj:is_player() 
		then table.insert(players, obj) end end
		if #players == 1 then
			minetest.chat_send_all(#players)
			minetest.sound_play("catch2", {pos=position, gain = 1.0, max_hear_distance = 5})
			minetest.add_entity(position, "challenge:"..itens[i][3].."_"..colors[e][1])
			self.object:remove() 
end
end
})

minetest.register_entity("challenge:"..itens[i][3].."_"..colors[e][1],{   --propriedades da entidade
	hp_max = 50,
	physical = true,
	weight = 5,
	collide_with_objects = false,
	selectionbox = {-1,-1,-1,1,1,1},
	--visual = "cube"/"sprite"/"upright_sprite"/"mesh"/"wielditem",
	visual = "upright_sprite",
	textures = {itens[i][3]..".png^[multiply:"..colors[e][2]}, --texturas
	initial_sprite_basepos = {x=0, y=0},
	visual_size = {x=2, y=2},
	is_visible = true,
	automatic_rotate = 1,
	backface_culling = false,
	player_name = "",
	drop="",
on_activate = function(self,pos,dtime)
		minetest.after(5, function() --atraso de5 segundos
		position = self.object:get_pos()
		if position == nil then return end
			minetest.sound_play("catch2", {pos=position, gain = 1.0, max_hear_distance = 3})
			minetest.add_entity(position, "challenge:"..itens[i][2].."_"..colors[e][1])
			self.object:remove() 
	end)
end
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
