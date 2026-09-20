//for (var i = 0; i<global.party_length; i++) {
//	draw_text(char_x[i],char_y[i],)
//}

//draw_text(mouse_x,mouse_y,$"{parrying}/{parry_cooldown}/{parry_duration}\n{obattle_manager.deses}%")

if instance_exists(oheart){
draw_text(oheart.x+10,oheart.y,$"{super_parry}+{counter_activation}")
}

switch (id_attack){
	
    case 1:
		draw_sprite(anim_sprite, floor(anim_frame), obattle_manager.char_x[alvo_char], obattle_manager.char_y[alvo_char])
	break
	
	case 2:
		draw_sprite_ext(anim_sprite,0,obattle_manager.char_x[alvo_char], obattle_manager.char_y[alvo_char], anim_size, anim_size, anim_rot, c_white, anim_alpha)
	break
}