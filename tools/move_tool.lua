minetest.register_craftitem("challenge:challenge_move_tool", {
	description = "challenge_move_tool",
	inventory_image = "challenge_move_tool.png",
	stack_max = 1,
                                                                           
on_use =function(_,player, pointed_thing, pos)
		local object = pointed_thing.ref
		if object == nil then return end
		local obj_pos = object:get_pos()
		local pla_pos = player:get_pos()
		if object then
		local node = minetest.get_node(pla_pos)
				object:set_pos(pla_pos) 
	end
end,
})


