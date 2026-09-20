up_key=keyboard_check_pressed(global.up)
down_key=keyboard_check_pressed(global.down)
left_key=keyboard_check_pressed(global.left)
right_key=keyboard_check_pressed(global.right)
accept_key=keyboard_check_pressed(global.confirmar)
cancel_key=keyboard_check_pressed(global.cancelar)
menu_key=keyboard_check_pressed(global.menu_key)

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
if ending{tx[0]=resx[0] ty[0]=resy[0] tx[1]=resx[1] ty[1]=resy[1]}
else {tx[0]=atvx[0] ty[0]=atvy[0] tx[1]=atvx[1] ty[1]=atvy[1]}

_x[0]=lerp(_x[0],tx[0],vel) _y[0]=lerp(_y[0],ty[0],vel)
_x[1]=lerp(_x[1],tx[1],vel) _y[1]=lerp(_y[1],ty[1],vel)
if ending and _x[1]>=resx[1]-1 and _y[0]<=resy[0]+1{
	if !vender_mode{
	instance_create_depth(x,y,depth-1,oMenu_status,{pos: pos_m})
}
	instance_destroy()}

///////retirado do primor

var _can_wfora=0
if vender_mode{ if accept_key{play_sfx(snd_select_ch1)_can_wfora= 1}}
else{
if (menu_key or (accept_key and wfora)){play_sfx(snd_select_ch1)_can_wfora= 1}
}


if _can_wfora and array_length(inv[pos_inv])>0{
	if !wfora{wfora=1 color_start = c_white color_end = c_red} else
	if wfora{
		if vender_mode{
			global.money+=inv[pos_inv][pos].price
		} else {
	var _inst_item=	instance_create_depth(oPlayer.x-10,oPlayer.y+10,400,oitem_overworld,{image_alpha: 0})
	_inst_item.item=inv[pos_inv][pos]
	}
		array_delete(inv[pos_inv],pos,1)
		wfora=0 color_start = c_white color_end = c_yellow
		}
}

var _sound_pos= pos var _sound_pos_inv= pos_inv
if !wfora{
pos += down_key - up_key
pos_inv+= right_key - left_key
}

if pos_inv >= array_length(inv) {pos_inv=0}
if pos_inv < 0 {pos_inv= array_length(inv)-1}
////if array_length(inv[pos_inv])>0
//pos=0

//pos= array_length(inv[pos_inv])-1

if pos >= array_length(inv[pos_inv]) {pos=0 _min=0 _max=_num}
if pos < 0 {pos= array_length(inv[pos_inv])-1
	for(var i=0;i<9999;i++){
		var _tnum=_num*i
		if _tnum> array_length(inv[pos_inv])-1{_max=_tnum _min=_max-_num i=9999}
	}
	}
if pos>=_max{_min+=_num _max+=_num} else if pos<_min{_min-=_num _max-=_num}


if _sound_pos!= pos or _sound_pos_inv!= pos_inv{
	 play_sfx(snd_menumove_ch1)	 
 }

if cancel_key{
	if !ending and !wfora{play_sfx(snd_smallswing) ending=1}
	else if !ending and wfora{play_sfx(snd_smallswing) wfora=0 color_start = c_white color_end = c_yellow}
	}

if !status_ready{status_ready=1}

if vender_mode=0{
	status_show=member
	if array_length(inv[pos_inv])>0{
	var _new_a=inv[pos_inv][pos]
	var _old_a=oitem_manager.invp[member.id_number,pos_inv]

	function status_pader(_memst,_oldst,_newst){
	var _all=((_memst-_oldst)+_newst)
	var _all2=_all-_memst
	var _v
	if _all2>0{_v="<"} else if _all2<0{_v=">"}
	var _sfi=""
	if _all2!=0{_sfi=string(_v) + string(_all) +"("+string(_all2)+")"}
	return _sfi
	}

	status[0]="" + string(member.atk) + status_pader(member.atk,_old_a.atk,_new_a.atk)
	status[1]="" + string(status_show.def) + status_pader(member.def,_old_a.def,_new_a.def)
	status[2]="" + string(status_show.mener) + status_pader(member.mener,_old_a.mener,_new_a.mener)
	status[3]="" + string(status_show.spd) + status_pader(member.spd,_old_a.spd,_new_a.spd)
	//status[6]="Max.HP:" + string(status_show.mhp) + status_pader(member.mhp,_old_a.mhp,_new_a.mhp)
	st_length= array_length(status)

	if accept_key and !wfora{
			if array_contains(inv[pos_inv][pos].port,member.id_number){
				play_sfx(snd_select_ch1)
				inv[pos_inv][pos]=_old_a
				oitem_manager.invp[member.id_number,pos_inv]=_new_a
	
				//(status - status_arma_old) + status_arma_new
				member.mhp=(member.mhp-_old_a.mhp)+_new_a.mhp
				member.atk=(member.atk-_old_a.atk)+_new_a.atk
				member.def=(member.def-_old_a.def)+_new_a.def
				member.mener=(member.mener-_old_a.mener)+_new_a.mener
				member.spd=(member.spd-_old_a.spd)+_new_a.spd
				play_sfx(equip)
			} else {play_sfx(snd_cantselect)}
		}
	}
} else {
	if array_length(inv[pos_inv])>0{
	status[0]="Atk:" + string(inv[pos_inv][pos].atk)
	status[1]="Def:" + string(inv[pos_inv][pos].def)
	status[2]=char_battle_info(member.id_number,2)+":"+ string(inv[pos_inv][pos].mener)
	status[3]="Spd:" + string(inv[pos_inv][pos].spd) 
	st_length= array_length(status)

	}
	
}

status_spr[0]=s_status_atk
status_spr[1]=s_status_def
status_spr[2]=char_battle_info(member.id_number,3)
status_spr[3]=s_status_spd
