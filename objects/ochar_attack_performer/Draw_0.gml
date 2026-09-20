switch (id_attack.id_number){
	
    case 0:
		if state=1{
			draw_sprite(anim_sprite, floor(anim_frame), id_alvos.x,id_alvos.y)
		}
	break
	
	case 1:
		if state=1{
			draw_sprite(anim_sprite, floor(anim_frame), obattle_manager.char_x[char_select],obattle_manager.char_y[char_select])
		}
	break
	
	case 2:
		draw_sprite(anim_sprite, floor(anim_frame), anim_x, obattle_manager.row_y[row_select])
	break
	
	case 3:
		if state=1{
			for (var i = 0; i<3; i++){
				draw_sprite_ext(anim_sprite,0,anim_x[i],anim_y[i],anim_xscale[i],1,0,c_white,1)
				anim_x[i]+=anim_xscale[i]*10
				if anim_xscale[i]=-1{
					if anim_x[i]<=anim_x_end[i]{anim_playing_one[i]=false}
				} else {
					if anim_x[i]>=anim_x_end[i]{anim_playing_one[i]=false}
				}
			}
		}
	break
	
	case 4:
		if state=1{
			draw_sprite(anim_sprite, floor(anim_frame), obattle_manager.char_x[char_select],obattle_manager.char_y[char_select])
		}
	break
}