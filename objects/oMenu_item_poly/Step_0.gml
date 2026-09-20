up_key=keyboard_check_pressed(global.up)
down_key=keyboard_check_pressed(global.down)
left_key=keyboard_check_pressed(global.left)
right_key=keyboard_check_pressed(global.right)
accept_key=keyboard_check_pressed(global.confirmar)
cancel_key=keyboard_check_pressed(global.cancelar)
a_key=keyboard_check_pressed(global.Botaodash)

animation+=0.1
if animation>100{animation=0}

//texto brilhante
if (transitioning) {
    timer += 1;
    transition_progress = timer / transition_time;
    
    if (transition_progress >= 1) {
        transition_progress = 1;
        timer = 0;
        transitioning = false;
        // Troca de cor
        var temp = color_start;
        color_start = color_end;
        color_end = temp;
        transition_progress = 0;
        transitioning = true;
    }
}
//
//if cancel_key{ending=1}
if ending{tx=resx ty=resy} else {tx=atvx ty=atvy}
var _dis_res = distance_to_point(resx,resy)

x=lerp(x,tx,0.3) y=lerp(y,ty,0.6)
y=clamp(y,atvy,resy)
if ending and y>=resy-1{instance_destroy()}

///////retirado do primor

var _can_wfora=0
if vender_mode{if accept_key{_can_wfora= 1}}
else{
if (a_key){_can_wfora= 1}
}

if _can_wfora and array_length(inv[pos_inv])>0 and member_item_mode=0 and options_item_mode=0{
	if !wfora{wfora=1 color_start = c_white color_end = c_red} else
	if wfora{
		if vender_mode{global.money+=inv[pos_inv][pos_item].price
			array_delete(inv[pos_inv],pos_item,1)
			} else {jogar_fora_item()}
		wfora=0 color_start = c_white color_end = c_yellow
		}
}

var _sound_item= pos_item
var _sound_op_item= pos_options_item
var _sound_member_item= member_item_pos

if !wfora{
if options_item_mode=0 and member_item_mode=0 and vender_mode=0{
pos_inv += right_key - left_key
pos_inv=clamp(pos_inv,0,array_length(inv)-1)
}
if vender_mode{
	pos_inv += right_key - left_key
	pos_inv=clamp(pos_inv,0,1)
	}

if options_item_mode=0{
pos_item += down_key - up_key
}

if options_item_mode=1 and member_item_mode=0{
pos_options_item += down_key - up_key
} else {
	pos_options_item=0
}

if member_item_mode=1{
member_item_pos += right_key - left_key
} else {
	member_item_pos=0
}

}

if member_item_pos >= oParty_manager.party_length {member_item_pos=0}
if member_item_pos < 0 {member_item_pos= oParty_manager.party_length-1}

if pos_options_item >= 3 {pos_options_item=0}
if pos_options_item < 0 {pos_options_item=2}

if pos_item >= array_length(inv[pos_inv]) {pos_item=0 _min=0 _max=_num}
if pos_item < 0 {pos_item= array_length(inv[pos_inv])-1
	for(var i=0;i<9999;i++){
		var _tnum=_num*i
		if _tnum> array_length(inv[pos_inv])-1{_max=_tnum _min=_max-_num i=9999}
	}
	}

if pos_item>=_max{_min+=_num _max+=_num} else if pos_item<_min{_min-=_num _max-=_num}

if (_sound_item!= pos_item and array_length(inv[pos_inv])>1){
	 audio_play_sound(snd_menumove_ch1,80,false)	 
 }
 
 if (_sound_op_item!= pos_options_item and options_item_mode=1 and member_item_mode=0)  {
	 audio_play_sound(snd_menumove_ch1,80,false)	 
 }
 
 if (_sound_member_item!= member_item_pos and member_item_mode=1)  {
	 audio_play_sound(snd_menumove_ch1,80,false)	 
 }
 
// if array_length(inv[pos_inv])<=0{ending=1}
if !vender_mode{ 
if member_item_mode{oMenu_health.dark_mode=1 oMenu_health.pos_other=member_item_pos}
else {oMenu_health.dark_mode=0}
}
 
 if accept_key and !wfora{
			
			if options_item_mode=1{
				if member_item_mode=0{
			switch(pos_options_item){
				
					case 0:
					//////usar
					if pos_inv=0{member_item_mode=1} else {
					show_hp_msg=0
					inv[pos_inv][pos_item].effect(member_item_pos)
					options_item_mode=0
					member_item_mode=0	
					}
					break
				
					case 1:
					/////jogar fora
					if pos_inv=0{jogar_fora_item()} else {audio_play_sound(DashDown,80,false,0.5)}
					break
			}
				} else if member_item_mode=1{
	var _dis_char=camera_get_view_width(view_camera[0])/(oParty_manager.party_length+1)
	var _w_spr=sprite_get_width(inv[pos_inv][pos_item].spr)
	var _h_spr=sprite_get_height(inv[pos_inv][pos_item].spr)
	var _x=(camera_get_view_x(view_camera[0])+ _dis_char*(member_item_pos+1))-_w_spr/2
	var _y=oMenu_health.y-_h_spr
	msg_show(inv[pos_inv][pos_item].hp,_x,_y,c_green) show_hp_msg=0
			inv[pos_inv][pos_item].effect(member_item_pos)
			options_item_mode=0
			member_item_mode=0
		}
			audio_play_sound(snd_select_ch1,80,false)
			
		} else if options_item_mode=0 and array_length(inv[pos_inv])>0 and (pos_inv=0 or pos_inv=2) and !vender_mode{
			audio_play_sound(snd_select_ch1,80,false)
			options_item_mode=1
		}
		
		} else if cancel_key{
			if member_item_mode=1 {
				 member_item_mode=0
				 options_item_mode=0
			} else if options_item_mode=0 and !ending and !wfora{
				ending=1
			} else if !ending and wfora{
				wfora=0 color_start = c_white color_end = c_yellow
				} else if options_item_mode=1{options_item_mode=0}
		}
		
pos_item = clamp(pos_item,0,array_length(inv[pos_inv])-1) //evita bug, não tirar