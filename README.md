<html>
<body>
<div>
<h1>challenge</h1>
minetest mod challenge to create route and flight challenges
<img src="https://github.com/josegamestest/challenge/blob/main/screenshot.png">
<h2>Two types of tools</h2>

<h3>challenge:tool_challenge_circle_open_#color</h3>
This tool places open circles on the map, each circle has
a different color according to the tool used, when the player passes by one of them, it plays a sound to identify that the player has passed it


<h3>challenge:tool_challenge_flag_point_3d_cor</h3>
This tool does almost the same as the previous one, but with a different feature, its name cannot be changed, making it easier to mark the marking points

<h3>challenge_remove_tool tool currently disabled</h3>
It's a tool to clean nearby objects 5 blocks away, this tool is still being made and can remove any objects around. this tool is currently deactivating damage


<h2>To UPDATE</h2>
When the player passes through the circle his name will be registered in it, the name of the node can be changed by the owner
</div>
	
<div>
<h2>landing helicopter training</h2>
Now the mod has some blocks that can help in landing training by drawing targets on the ground
when the player lands on the location a sound is emitted
<div>


<h2>RECIPES</h2>
<h3>challenge:tool_challenge_circle_open_#color</h3>
<pre>
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
</pre>

</div>
<div>
<h2>challenge:tool_flag_point_3d_#color</h2>
<pre>

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
</pre>
</div>
</body>
</html>
