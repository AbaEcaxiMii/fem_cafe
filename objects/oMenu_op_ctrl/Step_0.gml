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
	play_sfx(snd_menumove_ch1)	 
 }	

key_change_adjust_name(global.right,0)
key_change_adjust_name(global.left,1)
key_change_adjust_name(global.up,2)
key_change_adjust_name(global.down,3)
key_change_adjust_name(global.confirmar,4)
key_change_adjust_name(global.cancelar,5)
key_change_adjust_name(global.menu_key,6)
		
if cancel_key and key_change_timer<0 and key_change=0 {
	play_sfx(snd_smallswing)
	if !ending{instance_create_depth(x,y,depth-1,oMenu_op)}
	ending=1
}
		
if accept_key and key_change_timer<0 and key_change=0 {
	play_sfx(snd_select_ch1)
	key_change=1
	key_change_timer=10
	color_start = c_white;
	color_end = c_orange;
	transition_progress=1
}

if keyboard_check_pressed(vk_f5){
	play_sfx(sfx_stage_lightbits_med)

	global.right =vk_right
	//vk_right 39
	global.left =vk_left
	//vk_left 37
	global.up =vk_up
	//vk_up 38
	global.down=vk_down
	//vk_down 40
	global.confirmar=ord("A")
	//ord("Z") 90
	global.cancelar=ord("S")
	//ord("X") 88
	global.menu_key=ord("D")
	//ord("C") 67
	global.correr= global.cancelar
}
			
if key_change_timer--<0 and key_change and keyboard_check_pressed(vk_anykey){
	play_sfx(snd_select_ch1)
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
			global.menu_key=keyboard_lastkey
		break
	}
	key_change=0
	color_start = c_white;
	color_end = c_yellow;
}
	