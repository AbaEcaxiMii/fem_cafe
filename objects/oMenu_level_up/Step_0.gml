up_key=keyboard_check_pressed(global.up)
down_key=keyboard_check_pressed(global.down)
left_key=keyboard_check_pressed(global.left)
right_key=keyboard_check_pressed(global.right)
accept_key=keyboard_check_pressed(global.confirmar)
cancel_key=keyboard_check_pressed(global.cancelar)
menu_key=keyboard_check(global.menu_key)

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

x=lerp(x,tx,0.3) y=lerp(y,ty,0.3)
//y=clamp(y,atvy,resy)
if ending and y<=resy+1{instance_destroy()}

///////retirado do primor

exp_necessary_level_up=30*global.level
if menu_key and global.exp>0{
	var _snd=sfx_battle_xpbar_fill
	if !audio_is_playing(sfx_stage_lightbits_small){play_sfx(sfx_stage_lightbits_small)}
	global.exp--
	global.exp_storage++
	if global.exp_storage>=exp_necessary_level_up{
		global.exp_storage=0 global.level++
		
		var _pos=0
		for (var i = 0; i<array_length(global.playable_members_total); i++) {
			global.playable_members_total[i].hp+=2
			global.playable_members_total[i].mhp+=2
			global.playable_members_total[i].atk+=2
			global.playable_members_total[i].def+=2
			global.playable_members_total[i].spd+=2
			global.playable_members_total[i].mener+=2
			if global.playable_members_total[i].id_number=2{global.playable_members_total[i].mener=100}
			
			level_up_tree_add(global.level, i)
			var _spells_earn=level_up_tree(global.level, i)
			if array_length(_spells_earn)>0{
				_snd=sfx_battle_levelup
				var _text=""
				for (var p = 0; p<array_length(_spells_earn); p++) {
					if p=0{_text+=$" {string(_spells_earn[p].name)}"}
					else if p=array_length(_spells_earn)-1{_text+=$" e {string(_spells_earn[p].name)}"}
					else {_text+=$", {string(_spells_earn[p].name)}"}
				}
				instance_create_depth(x,y,depth-10,oMenu_pop_up,{text: _text, pos: _pos, id_number: i})
				_pos++
			}
			
		}
		play_sfx(_snd)
		
	}
} else if cancel_key{
		play_sfx(snd_smallswing)
		ending=1
	}
		
 