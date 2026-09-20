right_key = keyboard_check_pressed(global.right)
left_key = keyboard_check_pressed(global.left)
up_key = keyboard_check_pressed(global.up)
down_key = keyboard_check_pressed(global.down)
confirmar_key = keyboard_check_pressed(global.confirmar)
cancelar_key = keyboard_check_pressed(global.cancelar)
//id_invoker é o id_number de quem invocou
//DEPOIS COLOCAR SONS AQUI E NO RESTO DA BATALHA, QUE NEM NO CURA ACALORADA
switch (id_attack.id_number){
	case 0: //faisca
		
		switch (state){
			case 0:
				enemy_selector_battle()	
				if confirmar_key{audio_play_sound(snd_spellcast,100,false) state=1 empty_alvos_battle()} else if cancelar_key{encerrar_atk(2)}
			break
			
			case 1:
				if (anim_playing) {
					change_info_text("tb_char_faisca", 0, obattle_manager.id_number[id_invoker], id_alvos.name)
				    anim_frame += anim_speed;
				    if (anim_frame >= anim_total) {
						anim_frame = anim_total-1
				        anim_playing = false;
				        if (!evento_aplicado) {
				            evento_aplicado=1
							damage_enemy(id_alvos,dano_base)
				        }
				    }
				} else {if confirmar_key{encerrar_atk(1)}}
			break		
		}
		
	break
	
	case 1: //Cura acalorada
	
		switch (state){
			case 0:
				char_select+=(right_key - left_key)
				if char_select>global.party_length-1{char_select=0} else
				if char_select<0{char_select=global.party_length-1}
				if confirmar_key{audio_play_sound(snd_spellcast,100,false) state=1} else if cancelar_key{encerrar_atk(2)}
			break
			
			case 1:
				if (anim_playing) {
					change_info_text("tb_char_cura", 0, obattle_manager.id_number[id_invoker], obattle_manager.id_number[char_select])
				    anim_frame += anim_speed;
    
				    if (anim_frame >= anim_total) {
						anim_frame = anim_total-1
				        anim_playing = false;
				        if (!evento_aplicado) {
				            evento_aplicado=1
							damage_char_as_char(char_select,dano_base,1,1) //cura 50hp
				        }
				    }
				} else {targeting_char=0 if confirmar_key{encerrar_atk(1)}}
			break
		}
		
	break
	
	case 2: //Lombriga
	
		switch (state){
			case 0:
				enemy_selector_battle(1)
				if confirmar_key{audio_play_sound(snd_spellcast,100,false) state=1 empty_alvos_battle()} else if cancelar_key{encerrar_atk(2)}
			break
			
			case 1:
				if (anim_playing) {
					change_info_text("tb_char_lombriga",0,id_invoker)
				    anim_frame += anim_speed;
					anim_x-=20
				    if anim_x<(camera_get_view_x(view_camera[0])-sprite_get_width(anim_sprite)) {
						anim_frame = anim_total-1
				        anim_playing = false;
				        if (!evento_aplicado) {
				            evento_aplicado=1
							var _hp_sugado=damage_enemy(id_alvos,dano_base)
							obattle_manager.hp[id_invoker]+=_hp_sugado
				        }
				    }
				} else {if confirmar_key{encerrar_atk(1)}}
			break
		}
	
	break
	
	case 3: //Costura de pele
	
		switch (state){
			case 0:
				enemy_selector_battle(2)
				if confirmar_key{audio_play_sound(snd_spellcast,100,false) state=1 empty_alvos_battle()} else if cancelar_key{encerrar_atk(2)}
			break
			
			case 1:
				if (anim_playing) {
					change_info_text("tb_char_costura_de_pele",0,id_invoker)
				    if not anim_playing_one[0] and not anim_playing_one[1] and not anim_playing_one[2] {
				        anim_playing = false;
				        if (!evento_aplicado) {
				            evento_aplicado=1
							damage_enemy(id_alvos)
				        }
				    }
				} else {if confirmar_key{encerrar_atk(1)}}
			break
		}
	
	break
	
	case 4: //Machuca aliado
	
		switch (state){
			case 0:
				char_select+=(right_key - left_key)
				if char_select>global.party_length-1{char_select=0} else
				if char_select<0{char_select=global.party_length-1}
				if confirmar_key{audio_play_sound(snd_spellcast,100,false) state=1} else if cancelar_key{encerrar_atk(2)}
			break
			
			case 1:
				if (anim_playing) {
					change_info_text("tb_char_machuca", 0, obattle_manager.id_number[id_invoker], obattle_manager.id_number[char_select])
				    anim_frame += anim_speed;
    
				    if (anim_frame >= anim_total) {
						anim_frame = anim_total-1
				        anim_playing = false;
				        if (!evento_aplicado) {
				            evento_aplicado=1
							var _dmg=50
							if turbinado{_dmg*=1.2}
							damage_char_as_char(char_select,_dmg)
				        }
				    }
				} else {targeting_char=0 if confirmar_key{encerrar_atk(1)}}
			break
		}
		
	break

	case 5: //Evapora agua
		if var_temp_evita_barulho{
			audio_play_sound(snd_spellcast,100,false)
			var_temp_evita_barulho=0
		}
		change_info_text("tb_char_evapora_agua", 0, obattle_manager.id_number[id_invoker])
		obattle_manager.spell_evapora_agua_effect=1
		if confirmar_key{encerrar_atk(1)}
	break
}