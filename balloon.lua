minetest.register_craftitem("challenge:balloon_item", {
  stack_max = 99,
  description = "balloon_item",
  inventory_image = "ballon.png",
})

minetest.register_node("challenge:balloon_on_the_floor", {
	description = "balloon_on_the_floor",
    tiles = {"ballon.png"},
	light_source = 5,
	walkable=true,
	paramtype = "light",
	is_ground_content = true,
	groups = {cracky = 2, oddly_breakable_by_hand = 2, soil = 1},

after_place_node = function (pos, placer)
			local timer = minetest.get_node_timer(pos)
			timer:start(10)
end,

on_timer = function(pos,node)
		local timer = minetest.get_node_timer(pos)
		timer:start(10) 
		local meta = minetest.get_meta(pos)
		local throw_starting_pos={}
		throw_starting_pos = vector.add({x=0, y=1, z=0},pos)
		local all_objects = minetest.get_objects_inside_radius(throw_starting_pos, 0.5)
		minetest.add_entity(throw_starting_pos, "challenge:ballon")
	end,
})

minetest.register_entity("challenge:ballon",{   --propriedades da entidade
	hp_max = 1,
	physical = true,
	weight = 5,
	collide_with_objects = false,
	selectionbox = {-1,-1,-1,1,1,1},
	--visual = "cube"/"sprite"/"upright_sprite"/"mesh"/"wielditem",
	visual = "mesh",
	mesh="ballon.obj",
	visual_size = {x = 3, y = 3},
	--textures = {"ballon.png"},
	textures = {"ballon2.png"},
	initial_sprite_basepos = {x=0, y=0},
	visual_size = {x=2, y=2},
	is_visible = true,
	
	backface_culling = false,
	player_name = "",
	drop="",
	automatic_rotate = 3,
	v_speed = 0.3,
	vector_up = vector.new(0, 1, 0),
	posicao_final="",

on_activate= function(self,pos,dtime,staticdata)
	local ent = self.object:get_luaentity()
	local posicao = self.object:get_pos()
	ent.posicao_final=posicao.y*5
end,

on_step= function(self,pos,dtime)
	local ent = self.object:get_luaentity()
	local posicao = self.object:get_pos()
	if posicao == nil then return end
	self.object:set_acceleration(vector.multiply(ent.vector_up, ent.v_speed))
	if posicao.y >=ent.posicao_final then
		self.object:remove()
	end

	local all_objects = minetest.get_objects_inside_radius(posicao, 2)
		local players = {}
		local _,obj for _,obj in ipairs(all_objects) do
		if obj:is_player() then 
		minetest.sound_play("catch2", {pos=posicao, gain = 1.0, max_hear_distance = 5})
			self.object:remove() 
	end end
end

})
