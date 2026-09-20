right_key = keyboard_check_pressed(global.right)
left_key = keyboard_check_pressed(global.left)
up_key = keyboard_check_pressed(global.up)
down_key = keyboard_check_pressed(global.down)
confirmar_key = (keyboard_check_pressed(global.confirmar) or keyboard_check_pressed(vk_enter))
cancelar_key = keyboard_check_pressed(global.cancelar)
menu_key = keyboard_check_pressed(global.menu_key)

if keyboard_check_pressed(vk_f1){
	if instance_exists(ocrt_Control){
		with ocrt_Control{
			CRT.ShaderOn=!CRT.ShaderOn
		}
	}
}

if keyboard_check_pressed(vk_f2){
global.debug_mode=!global.debug_mode
}

if keyboard_check_pressed(vk_f3){
game_restart()
}

if keyboard_check_pressed(vk_f4){
var _full= window_get_fullscreen()	
window_set_fullscreen(!_full)
window_center()
}

if keyboard_check_pressed(vk_numpad0){
	room_warp_activation=!room_warp_activation
	if room_warp_activation{
		room_select=0
		for (var i = 0; i<array_length(room_warp_array); i++) {
			if room_warp_array[i]=room{room_select=i break}
		}
	} else {global.can_move=1}
}

if keyboard_check_pressed(vk_escape){
game_end()
}

if keyboard_check_pressed(vk_numpad1){
play_sfx(savepoint)
save()
}

if keyboard_check_pressed(vk_numpad2){
load()
}

if keyboard_check_pressed(vk_numpad4){
instance_create_depth(x,y,depth,omenu_saves,{proposito_save_load: 0})
}

if keyboard_check_pressed(vk_numpad5){
instance_create_depth(x,y,depth,omenu_saves,{proposito_save_load: 1})
}

if (keyboard_check_pressed(vk_control))
{
    if (!pausado)
    {
        pausado = true;
        msg_i=irandom(msg_l) //usa para escolher uma mensagem aléatoria agora
        // Salva screenshot e converte para sprite
        screen_save("pause_temp.png");
        sprite_pause = sprite_add("pause_temp.png", 1, false, false, 0, 0);
        
        instance_deactivate_all(true);
        audio_pause_all();
    }
    else
    {
        pausado = false;
        instance_activate_all();
        audio_resume_all();
        
        if (sprite_pause != -1) sprite_delete(sprite_pause);
        sprite_pause = -1;
        
        // Deleta o arquivo temporário
        file_delete("pause_temp.png");
    }
}


if room_warp_activation and !pausado{
	global.can_move=0
	var _sound_room_select= room_select
	room_select+=(down_key - up_key)
	if room_select>array_length(room_warp_array)-1{room_select=0} else
	if room_select<0{room_select=array_length(room_warp_array)-1}
	if _sound_room_select!= room_select{play_sfx(snd_menumove_ch1)}
	
	if confirmar_key{room_goto(room_warp_array[room_select])}
}