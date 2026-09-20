

sprite_index=item.spr

if place_meeting(x,y,ointeragir)
	{
		if item_add(item) == true
			{
				msg_show(item.spr,oPlayer.x,oPlayer.y,c_white,0,1)	
				//instance_destroy()
			}
	}