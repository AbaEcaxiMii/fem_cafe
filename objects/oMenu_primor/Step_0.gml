up_key=keyboard_check_pressed(global.up)
down_key=keyboard_check_pressed(global.down)
left_key=keyboard_check_pressed(global.left)
right_key=keyboard_check_pressed(global.right)
accept_key=keyboard_check_pressed(global.confirmar)
cancel_key=keyboard_check_pressed(global.cancelar)

status_show=oParty_manager.party_members[status_pos]
status[0,0]= "''" + string(status_show.name) + "''"
status[0,1]="HP: " + string(status_show.hp) + "/" + string(status_show.mhp)
status[0,2]="Atk físico: " + string(status_show.atk)
status[0,3]="Atk Especial: " + string(status_show.atke)
status[0,4]="Def: " + string(status_show.def)
status[0,5]="Resiliência: " + string(status_show.res)
status[0,6]="Sorte: " + string(status_show.sor)
status[0,7]="Tensão: " + string(round(status_show.ten))

status[0,8]="Energia: " + string(global.energia)  + "%"
status[0,9]=string(global.money) + "$"

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
//resto

if keyboard_check_pressed(ord("W")){
	ggg+=1
}
if keyboard_check_pressed(ord("Q")){
	ggg-=1
}

op_length=array_length(option[menu_level])
status_length=array_length(status[menu_level])

var _sound_status_pos = status_pos
var _sound_pos= pos
var _sound_item= pos_item
var _sound_op_item= pos_options_item
var _sound_member_item= member_item_pos

if menu_level=5{
	if key_change_timer<0 and key_change=0{
pos += down_key - up_key
	}
} else {
pos += down_key - up_key// -1 0 1
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
member_item_pos += down_key - up_key
} else {
	member_item_pos=0
}

if menu_level=0{
status_pos += right_key - left_key
	}

if pos >= op_length {pos=0}
if pos < 0 {pos= op_length-1}

if status_pos >= oParty_manager.party_length {status_pos=0}
if status_pos < 0 {status_pos= oParty_manager.party_length-1}

if member_item_pos >= oParty_manager.party_length {member_item_pos=0}
if member_item_pos < 0 {member_item_pos= oParty_manager.party_length-1}

if pos_options_item >= 3 {pos_options_item=0}
if pos_options_item < 0 {pos_options_item=2}

if pos_item >= oitem_manager.item_length {pos_item=0}
if pos_item < 0 {pos_item= oitem_manager.item_length-1}

if (_sound_pos!= pos and op_length>1){
	audio_play_sound(snd_menumove_ch1,100,false)	 
 }

if _sound_status_pos!= status_pos and menu_level=0{
	 audio_play_sound(snd_menumove_ch1,100,false)	 
 }
 
if (_sound_item!= pos_item and array_length(oitem_manager.inv)>1 and menu_level=1){
	 audio_play_sound(snd_menumove_ch1,100,false)	 
 }
 
 if (_sound_op_item!= pos_options_item and options_item_mode=1 and member_item_mode=0)  {
	 audio_play_sound(snd_menumove_ch1,100,false)	 
 }
 
 if (_sound_member_item!= member_item_pos and member_item_mode=1)  {
	 audio_play_sound(snd_menumove_ch1,100,false)	 
 }

		var _sml=menu_level
	
		switch(menu_level){
		
		//////////Item habi opções
			case 0:
	if accept_key{
		switch(pos){

		//Itens
			case 0:
			audio_play_sound(snd_select_ch1,100,false)
			if array_length(oitem_manager.inv)>0{
			menu_level=1
			}
			break
		//Equipamento	
			case 4:
			audio_play_sound(snd_select_ch1,100,false)
			menu_level=1.1
			break
		//habilidades
			case 1:
			audio_play_sound(Shoot,100,false)
			menu_level=2
			break
		//opções
			case 2:
			audio_play_sound(savepoint,100,false)
			menu_level=3
			break
		}
	}if cancel_key{
			instance_destroy(oMenu)
		}
		break
		//////////Lista de itens
		case 1:
		if accept_key{
			
			if options_item_mode=1{
				if member_item_mode=0{
			switch(pos_options_item){
				case 0:
				//////usar
				//oitem_manager.inv[pos_item].effect()
				member_item_mode=1
				break
				
				case 1:
				/////jogar fora
				array_delete(oitem_manager.inv,pos_item,1)
				options_item_mode=0
				break
				
				case 2:
				/////cancelar
				options_item_mode=0
				break
			}
				} else if member_item_mode=1{
			oitem_manager.inv[pos_item].effect(member_item_pos)
			options_item_mode=0
			member_item_mode=0
		}
			audio_play_sound(snd_select_ch1,100,false)
			
		} else if options_item_mode=0 {
			audio_play_sound(snd_select_ch1,100,false)
			options_item_mode=1
		}
		
		} else if cancel_key{
			if options_item_mode=1 and member_item_mode=0{
			options_item_mode=0
			} else if member_item_mode=1 {
				 member_item_mode=0			
			} else if options_item_mode=0{
				menu_level =0
			}
		}
		break
		////////////volume fullscreen linguagem controles exit
		case 3:
		global.language=lg_number
		if right_key or left_key or up_key or down_key{
			switch(pos){
				case 0:
				global.masterVol += (right_key - left_key)/20
				global.masterVol=clamp(global.masterVol,0,2)
				break
				
				case 2:
				lg_number += left_key - right_key
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
			if (window_get_fullscreen()){
				window_set_fullscreen(false)
				window_set_size(800,600);
				} else {
					window_set_fullscreen(true);
					}
			break
		//controles
			case 3:
			audio_play_sound(snd_select_ch1,100,false)
			menu_level=4
			break
		//exit
			case 4:
			audio_play_sound(snd_select_ch1,100,false)
			game_end()
			break
		}
	} else if cancel_key{
			audio_play_sound(snd_select_ch1,100,false)
			menu_level=0
		}
		break
			
		///////////controlesparte1
		case 4:
		
		if cancel_key{
			menu_level=3
		}
		
		if accept_key{
		switch(pos){
			case 0:
				if admMundo.auto_correr=0 {admMundo.auto_correr=1} else if admMundo.auto_correr=1 {admMundo.auto_correr=0}
			audio_play_sound(snd_select_ch1,100,false)
			break
			
			case 1:
				if admMundo.auto_tiro=0 {admMundo.auto_tiro=1} else if admMundo.auto_tiro=1 {admMundo.auto_tiro=0}
			audio_play_sound(snd_select_ch1,100,false)
			break
			
			case 2:
			audio_play_sound(snd_select_ch1,100,false)
			menu_level=5
			break
		}
		}
		break
		
		///////////controlesparte2
		case 5:
		
		key_change_adjust_name(global.right,0)
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
			menu_level=4
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
			break
		}
		break
}
		if _sml!=menu_level{
			pos=0
			op_length=array_length(option[menu_level])
			status_length=array_length(status[menu_level])
			}
		if array_length(oitem_manager.inv)<=0 and menu_level=1 {menu_level=0}

if lg_number >= string(admMundo.lg_length) {lg_number=0}
if lg_number < 0 {lg_number= string(admMundo.lg_length)-1}