depth=obattle_manager.depth-60
enemy_select=0
row_select=1
id_alvos=array_create(0)
state=0
targeting_char=0 //se está mirando em parceiros

ty1=id_attack.ty1
ty2=id_attack.ty2

dano_base=0

evitar_sound_select_duplo_inicio=1 //quando inicia um ataque, dá pra escutar o som de confirmar a seleção da magia
//e do enemy_selector_battle ao mesmo tempo, isso evita que aconteça

switch (id_attack.id_number){
	case 0:
		//state=0 mirando 1 realizando o ataque
		anim_sprite = sb_faisca
		anim_frame = 0
		anim_speed = 15/30//anim_speed = (FPS da animação desejada) / (FPS do jogo)
		anim_total = sprite_get_number(anim_sprite);
		anim_playing = true
		evento_aplicado = false
		
		dano_base = obattle_manager.atk[id_invoker]
	break
	
	case 1:
		//state=0 selecionando amigo 1 realizando a cura
		targeting_char=1
		char_select=0

		anim_sprite = sb_cura
		anim_frame = 0
		anim_speed = 10/30//anim_speed = (FPS da animação desejada) / (FPS do jogo)
		anim_total = sprite_get_number(anim_sprite);
		anim_playing = true
		evento_aplicado = false
		
		dano_base = obattle_manager.atk[id_invoker] //50 troca depois
	break
	
	case 2:
		//state=0 mirando 1 ataque
		
		anim_sprite = sb_lombriga
		anim_x=camera_get_view_x(view_camera[0])+camera_get_view_width(view_camera[0])+sprite_get_width(anim_sprite)
		anim_frame = 0
		anim_speed = 10/30//anim_speed = (FPS da animação desejada) / (FPS do jogo)
		anim_total = sprite_get_number(anim_sprite);
		anim_playing = true
		evento_aplicado = false
		
		dano_base = obattle_manager.atk[id_invoker]
	break
	
	case 3:
		//state=0 mirando 1 ataque
		anim_sprite = sb_costura_de_pele
		for (var i = 0; i<3; i++){
			var _not_empty_rows=0
			for (var ii = 0; ii<i; ii++){
				if array_length(obattle_manager.row_entities[ii])>0{_not_empty_rows++}
			}
			if _not_empty_rows=0 or _not_empty_rows=2{
				anim_x[i]=camera_get_view_x(view_camera[0])-sprite_get_width(anim_sprite)
				anim_xscale[i]=1
				anim_x_end[i]=camera_get_view_x(view_camera[0])+camera_get_view_width(view_camera[0])+sprite_get_width(anim_sprite)
			} else {
				anim_x[i]=camera_get_view_x(view_camera[0])+camera_get_view_width(view_camera[0])+sprite_get_width(anim_sprite)
				anim_xscale[i]=-1
				anim_x_end[i]=camera_get_view_x(view_camera[0])-sprite_get_width(anim_sprite)
			}
			anim_y[i]=obattle_manager.row_y[i]
		}

		anim_playing_one[0] = true
		anim_playing_one[1] = true
		anim_playing_one[2] = true
		anim_playing = true
		evento_aplicado = false
		
		dano_base = obattle_manager.atk[id_invoker]
	break
	
	case 4:
		//state=0 selecionando amigo 1 realizando a o dano
		
		targeting_char=1
		char_select=0

		anim_sprite = sb_cura
		anim_frame = 0
		anim_speed = 10/30//anim_speed = (FPS da animação desejada) / (FPS do jogo)
		anim_total = sprite_get_number(anim_sprite);
		anim_playing = true
		evento_aplicado = false
	break

	case 5:
		var_temp_evita_barulho=1
		//Depois adicionar animação, ou não sei lá
	break
}

if turbinado{dano_base*=1.2} //cuidado que nem todas as magias usam essa variavél ainda tem que checa elas