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
//resto

status[0,7]="En: " + string(global.energia)  + "%"
status[0,8]=string(global.money) + "$"
status[2]=array_length(oitem_manager.bau_inv)

op_length=array_length(option[menu_level])
status_length=array_length(status[menu_level])

var _sound_pos= pos
var _sound_item= pos_item

if menu_level=0{pos += down_key - up_key}
if menu_level!=0{pos_item += down_key - up_key} else {pos_item=0}
if menu_level=2{pos_item += (right_key - left_key)*10}

if pos >= op_length {pos=0}
if pos < 0 {pos= op_length-1}

if menu_level!=2 {_min=0 _max=_num}

if menu_level=1{
if pos_item >= oitem_manager.item_length {pos_item=0}
if pos_item < 0 {pos_item= oitem_manager.item_length-1}
} else if menu_level=2{
if pos_item >= oitem_manager.bau_length {pos_item=oitem_manager.bau_length-1}
if pos_item < 0 {pos_item= 0}
if pos_item>=_max{_min+=_num _max+=_num} else if pos_item<_min{_min-=_num _max-=_num}
}

if (_sound_item!= pos_item and array_length(oitem_manager.inv)>1 and menu_level=1){
	 audio_play_sound(snd_menumove_ch1,100,false)	 
 }

if (_sound_pos!= pos and op_length>1){
	audio_play_sound(snd_menumove_ch1,100,false)	 
 }
		var _sml=menu_level
	
		switch(menu_level){
		
		//////////Item habi opções
			case 0:
	if accept_key{
		switch(pos){

		//guardar
			case 0:
			audio_play_sound(snd_select_ch1,100,false)
			if array_length(oitem_manager.inv)>0{
			menu_level=1
			}
			break
		//pegar
			case 1:
			audio_play_sound(Shoot,100,false)
			if array_length(oitem_manager.bau_inv)>0{
			menu_level=2
			}
			break
		}
	}if cancel_key{
			instance_destroy()
		}
		break
		//////////itens do inv
		case 1:
		if accept_key{
		array_push(oitem_manager.bau_inv,oitem_manager.inv[pos_item])
		array_delete(oitem_manager.inv,pos_item,1)
		} else if cancel_key{	
		menu_level =0
		}
		break
		////////////volume fullscreen linguagem controles exit
		case 2:
		if accept_key{
		var _it= oitem_manager.bau_inv[pos_item]
		if oitem_manager.item_length<oitem_manager.inv_max{
		array_push(oitem_manager.inv,_it)
		array_delete(oitem_manager.bau_inv,pos_item,1)
		}
		} else if cancel_key{	
		menu_level =0
		}
		break
}
		if _sml!=menu_level{
			pos=0
			pos_item=0
			op_length=array_length(option[menu_level])
			status_length=array_length(status[menu_level])
			}
		if array_length(oitem_manager.inv)<=0 and menu_level=1 {menu_level=0}
		if array_length(oitem_manager.bau_inv)<=0 and menu_level=2 {menu_level=0}
