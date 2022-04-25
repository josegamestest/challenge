<html>
  <body>
<div> 
  <h1>challenge</h1>
minetest mod challenge to create route and flight challenges

<h2>Tree types of tools</h2>
<b>Challenge_circle_tool</b></br>
This tool places open circles on the map,</br>
each circle has a different color according to the tool used,</br>
they close after a few seconds, then these circles open and</br>
when the player passes by one of them, it closes again</br>
<b>challenge_remove_tool</b></br>
It's a tool to clean nearby objects 5 blocks away,</br>
this tool is still being made and can remove any objects around.

challenge_move_tool
when you click on an object with this tool,<br>
the object will be attracted to you, thus changing its position
to update
</div>

<div>  
<h2>Update</h2>
  When the player passes through the circle his name will be temporarily registered in it,</br>
  if another player passes through the circle his name will be changed to the name of the new player.
</div>

<div>
  <h3>NEW 3D NODE</h3>
  Added two more types of markers, one can be<br>
  modified when a player walks through it
  The other is modifiable by click.blocks can be<br>
  modified by swiping but not by clicking

  When you put it on the ground, the circle<br>
  asks for a name, which by default is the player's name.<br>
  If confirmed, the new name will be what is written<br>
  in the box, if not there will be a message saying that<br>
  the block belongs to the player, but a name has not yet been defined<br>
  Note "3d is more stable and is not removed with clearobjects

<div>
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
