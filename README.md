# challenge
minetest mod challenge to create route and flight challenges

Two types of tools
challenge_circle_tool
This tool places open circles on the map, each circle has a different color according to the tool used, they close after a few seconds, then these circles open and when the player passes by one of them, it closes again
challenge_remove_tool
It's a tool to clean nearby objects 5 blocks away, this tool is still being made and can remove any objects around.

#Update
When the player passes through the circle his name will be temporarily registered in it, if another player passes through the circle his name will be changed to the name of the new player.

#Tip
To show the player's name in the tag
basca uncomment on the line below 66 and 100

aberto:set_properties({
                        infotext = info_name,
                        --nametag = info_name
})


fechado:set_properties({
                        infotext = info_name,
                        --nametag = info_name
                        })
self.object:remove() 
