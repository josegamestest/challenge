<html>
  <body>
<div> 
  <h1>challenge</h1>
minetest mod challenge to create route and flight challenges

<h2>Two types of tools</h2>
<b>Challenge_circle_tool</b></br>
This tool places open circles on the map,</br>
each circle has a different color according to the tool used,</br>
they close after a few seconds, then these circles open and</br>
when the player passes by one of them, it closes again</br>
<b>challenge_remove_tool</b></br>
It's a tool to clean nearby objects 5 blocks away,</br>
this tool is still being made and can remove any objects around.
</div>

<div>  
<h2>Update</h2>
  When the player passes through the circle his name will be temporarily registered in it,</br>
  if another player passes through the circle his name will be changed to the name of the new player.
</div>

<div>
<h2>Tip</h2>
To show the player's name in the tag </br>
basca uncomment on the line below 66 and 100</br>
<pre>
open_circle:set_properties({
                        infotext = info_name,
                        --nametag = info_name
})
</pre>
<pre>
closed_circle:set_properties({
                        infotext = info_name,
                        --nametag = info_name
                        })
</pre>
</div>
</body> </html>
