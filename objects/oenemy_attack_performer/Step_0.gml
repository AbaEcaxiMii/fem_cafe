right_key = keyboard_check_pressed(global.right)
left_key = keyboard_check_pressed(global.left)
up_key = keyboard_check_pressed(global.up)
down_key = keyboard_check_pressed(global.down)
confirmar_key = keyboard_check_pressed(global.confirmar)
cancelar_key = keyboard_check_pressed(global.cancelar)

//depths
//obox_battle=obattle_manager.depth-50
//obox_light_goal=obattle_manager.depth-55
//obullet_battle=obattle_manager.depth-60
//oheart=obattle_manager.depth-80

if (confirmar_key or cancelar_key) and !parrying and parry_cooldown<=0{
	super_parry=0
	if cancelar_key and obattle_manager.deses>=50{super_parry=1 obattle_manager.deses-=50}
	parrying=1
	parry_duration=parry_duration_max
}

if parrying{
	if parry_duration--<=0{
		if !successful_parry{parry_cooldown=parry_duration_max}
		if successful_orange_parry and super_parry{counter_activation=1}
		super_parry=0
		parrying=0
	}
} else {
	parry_cooldown--
	parry_cooldown=clamp(parry_cooldown,0,parry_cooldown_max)
	}


//id_invoker é o literal id do inimigo que invocou
switch (id_attack){
	case 0:
		change_info_text("tb_enemy_faz_nada", 0, id_invoker.name)
		timer+=1
		if timer>=mtimer{encerrar_atk()}
	break

	case 1:
		if (anim_playing) {
			change_info_text("tb_enemy_arranhao", 0, id_invoker.name, obattle_manager.id_number[alvo_char])
		    anim_frame += anim_speed;
    
		    if (anim_frame >= anim_total) {
		        anim_playing = false;
		        if (!evento_aplicado) {
		            evento_aplicado=1
					damage_char(alvo_char)
		        }
		    }
		} else if confirmar_key{encerrar_atk()}
	break
	
	case 2:
		if anim_state=0 {
			change_info_text("tb_enemy_luva", 0, id_invoker.name)
			anim_alpha=1 //acredite em mim, tem que deixar aqui pro ataque ficar melhor
			anim_timer++
			anim_timer=clamp(anim_timer,0,anim_timer_max)
			anim_progress=anim_timer/anim_timer_max
			anim_size=anim_progress
			anim_rot=anim_progress*360
			if anim_timer=anim_timer_max{damage_char(alvo_char) anim_state=!anim_state tentativas--}
		} else {
			anim_alpha-=0.1
			if anim_alpha<=0{
				if tentativas=0{
					encerrar_atk()
				} else {
					alvo_char=choose_battle_alvo()
					anim_state=!anim_state anim_timer=0
					if !first_time{play_sfx(enemy_attack)}
					first_time=0
				}
			}
		}
		
		//if anim_timer=anim_timer_max{damage_char(alvo_char) alvo_char=choose_battle_alvo() anim_timer=0}
		//anim_alpha=anim_progress
		
	break
	
	case 3:
		change_info_text(,2)
		if cooldown--<0{
			cooldown=cooldown_max
			var _x_spawn=camera_get_view_x(view_camera[0])+20+irandom_range(0,camera_get_view_width(view_camera[0])-20)
			var _acima=choose(0,1)
			if _acima{
			var _y_spawn=camera_get_view_y(view_camera[0])+20
			} else {
			var _y_spawn=camera_get_view_y(view_camera[0])+camera_get_view_height(view_camera[0])-20
			}
			instance_create_depth(_x_spawn,_y_spawn,depth_bullet,odiamond, {acima: _acima})
		}
		
		if instance_exists(obox_light_goal){if obox_light_goal.reach_light{encerrar_atk()}}
		if counter_activation{encerrar_atk()}
	break
	
	case 4:
		change_info_text(,2)
		if freedom_box_cooldown--<0{
			instance_destroy(obox_battle)
			obox_spawn.box_turn_on=0
		}
		if cooldown--<0{
			cooldown=cooldown_max
			var _x_center=camera_get_view_x(view_camera[0])+camera_get_view_width(view_camera[0])/2
			var _x_spawn=_x_center+irandom_range(-40, 40)
			var _acima=choose(0,1)
			if _acima{
			var _y_spawn=camera_get_view_y(view_camera[0])+20
			} else {
			var _y_spawn=camera_get_view_y(view_camera[0])+camera_get_view_height(view_camera[0])-20
			}
			instance_create_depth(_x_spawn,_y_spawn,depth_bullet,odiamond, {acima: _acima})
		}
		
		if instance_exists(obox_light_goal){if obox_light_goal.reach_light{encerrar_atk()}}
		if counter_activation{encerrar_atk()}
	break
	
}