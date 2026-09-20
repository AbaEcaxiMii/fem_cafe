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
if ending and y>=resy-1{instance_destroy()}

///////retirado do primor
var _sound_pos= pos
pos += down_key - up_key
op_length=array_length(option)
if pos >= op_length {pos=0}
if pos < 0 {pos= op_length-1}
if (_sound_pos!= pos and op_length>1){
	audio_play_sound(snd_menumove_ch1,100,false)	 
 }	key_change_adjust_name(global.right,0)
		key_change_adjust_name(global.left,1)
		key_change_adjust_name(global.up,2)
		key_change_adjust_name(global.down,3)
		key_change_adjust_name(global.confirmar,4)
		key_change_adjust_name(global.cancelar,5)
		key_change_adjust_name(global.super_skip,6)
		key_change_adjust_name(global.Botaotiro,7)
		key_change_adjust_name(global.Botaodash,8)
		key_change_adjust_name(global.correr,9)
		
		if cancel_key and key_change_timer<0 and key_change=0 {
			if !ending{instance_create_depth(x,y,depth-1,oMenu_op)}
			ending=1
		}
		
		if accept_key and key_change_timer<0 and key_change=0 {
			key_change=1
			key_change_timer=10
		}
		if keyboard_check_pressed(vk_f5){
			audio_play_sound(sfx_stage_lightbits_med,100,false)
			global.right =39
//vk_right
global.left =37
//vk_left
global.up =38
//vk_up
global.down=40
//vk_down
global.confirmar=90
//ord("Z") //n pode mudar
global.cancelar=88
//ord("X")
global.super_skip=67
//ord("C")
global.Botaotiro=83
//ord("S")
global.Botaodash=65
//ord("A")
global.correr=88
//ord("X")
		}
			
		if key_change_timer--<0 and key_change and keyboard_check_pressed(vk_anykey){
			audio_play_sound(snd_select_ch1,100,false)
		switch(pos){
			case 0:
					
					global.right=keyboard_lastkey
			break
			
			case 1:
					
					global.left=keyboard_lastkey
			break
			
			case 2:
					
					global.up=keyboard_lastkey
			break
			
			case 3:
					
					global.down=keyboard_lastkey
			break
			
			case 4:
					
					global.confirmar=keyboard_lastkey
			break
			
			case 5:
					
					global.cancelar=keyboard_lastkey
			break
			
			case 6:
					
					global.super_skip=keyboard_lastkey
			break
			
			case 7:
					
					global.Botaotiro=keyboard_lastkey
			break
			
			case 8:
					
					global.Botaodash=keyboard_lastkey
			break
			
			case 9:
					
					global.correr=keyboard_lastkey
			}
			key_change=0
		}
	