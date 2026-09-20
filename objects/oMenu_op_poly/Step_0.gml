up_key=keyboard_check_pressed(global.up)
down_key=keyboard_check_pressed(global.down)
left_key=keyboard_check_pressed(global.left)
right_key=keyboard_check_pressed(global.right)
accept_key=keyboard_check_pressed(global.confirmar)
cancel_key=keyboard_check_pressed(global.cancelar)

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
//y=clamp(y,atvy,resy)
if ending and y<=resy+1{instance_destroy()}

///////retirado do primor
var _sound_pos= pos
pos += down_key - up_key
op_length=array_length(option)
if pos >= op_length {pos=0}
if pos < 0 {pos= op_length-1}
if (_sound_pos!= pos and op_length>1){
	audio_play_sound(snd_menumove_ch1,100,false)	 
 }
		if right_key or left_key or up_key or down_key{
			switch(pos){
				case 0:
				global.masterVol += (right_key - left_key)/20
				global.masterVol=clamp(global.masterVol,0,2)
				break
				
				case 2:
				 global.language += right_key - left_key
				 if global.language<0{global.language=lg_length-1} else if global.language>lg_length-1{global.language=0}
				// global.language=clamp(global.language,0,lg_length-1)
				audio_play_sound(snd_menumove_ch1,100,false)
				break
			}
		}
	if accept_key{
		switch(pos){
		//Volume
			case 0:
			global.masterVol=1
			break
		//fullscreen
			case 1:
			audio_play_sound(snd_select_ch1,100,false)
			var _full=window_get_fullscreen() _full= !_full
				window_set_fullscreen(_full)
			break
		//controles
			case 3:
			audio_play_sound(snd_select_ch1,100,false)
			ending=1
			instance_create_depth(x,y,depth-1,oMenu_op_ctrl)
			break
		//
			case 4:
			global.auto_correr= !global.auto_correr
			audio_play_sound(snd_select_ch1,100,false)
			break
			
			case 5:
			global.auto_tiro= !global.auto_tiro
			audio_play_sound(snd_select_ch1,100,false)
			break
		}
	} else if cancel_key{
			audio_play_sound(snd_select_ch1,100,false)
			ending=1
		}
		
 