--flag_point recipe
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
------------------------------------------------------------------------------------------------------------------------------


--checkpoints recipe
--white
minetest.register_craft({
	output = "challenge:tool_challenge_circle_open_white",
	recipe = {
                  {"group:leaves",	"group:leaves",		"group:leaves"},
                  {"group:leaves",	"default:diamond",	"group:leaves"},
                  {"group:leaves",	"group:leaves",		"group:leaves"},
			}})

--black
minetest.register_craft({ output = "challenge:tool_challenge_circle_open_black", recipe = {
						{"challenge:tool_challenge_circle_open_white", "default:coal_lump"},} })
--red
minetest.register_craft({ output = "challenge:tool_challenge_circle_open_red", recipe = {
						{"challenge:tool_challenge_circle_open_white", "flowers:rose"},} })

--blue
minetest.register_craft({ output = "challenge:tool_challenge_circle_open_blue", recipe = {
						{"challenge:tool_challenge_circle_open_white", "flowers:geranium"},} })
--green
minetest.register_craft({ output = "challenge:tool_challenge_circle_open_green", recipe = {
						{"challenge:tool_challenge_circle_open_white", "default:cactus"},} })
--yellow
minetest.register_craft({ output = "challenge:tool_challenge_circle_open_yellow", recipe = {
						{"challenge:tool_challenge_circle_open_white", "flowers:dandelion_yellow"},} })
