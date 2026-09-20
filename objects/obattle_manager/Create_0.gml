//depth está em -room_height-800, dá pra mudar em Newenconter
global.can_move=0
global.battle_mode=1
global.battle_alvos=array_create(0) //usado apenas para marcar quais inimigos estão sendo mirados para o efeito de piscar
//instance_destroy(creator[0])
battle_state=0 //0 Ninguem está selecionado e inimigos não estão atacando 1 Personagem está selecionado 2 Personagem está performando um ataque 3 Inimigo está performando um ataque
row_entities[0]=array_create(0) //inimigos na fila de trás
row_entities[1]=array_create(0) //inimigos na fila do meio
row_entities[2]=array_create(0) //inimigos na fila da frete
inicio_battle()
box_rows_xy()

_time_music=oMusicManager.song_time
_music_playing=oMusicManager.song_playing

textbox_sep_border=5 //distancia da borda da tela para os lados da caixa de dialogo
border=8
deses=100 //desespero (tipo tensão deltarune)
deses_max=100
deses_color=c_red

color_start = c_white;
color_end = c_red;
transition_progress = 0; // Progresso da transição, de 0 a 1

button_height=sprite_get_height(sundertale_button)
button_sep=5

id_info_tb=create_textbox("tb_flavor_text_temporário",2)
intervalo_btw_attacks=0 //intervalo onde inimigos não podem atacar após um ataque
mintervalo_btw_attacks=4

choosing_spell=0 //se está selecionando alguma magia

call_flavor_text=1
end_of_battle=0

spells_classes_name=["Ofensiva","Suporte","Outro","Especial"]
spell_num=6 //numero de magias que pode aparecer por vez na seleção
spell_min=0
spell_max=spell_num

spell_turbinada=0
custo_extra_spell_turbinada=20

exp_gain_total=0
fundo_preto=0
fundo_preto_value=0

//////////efeitos de ataques/equipamentos/charmes
spell_evapora_agua_effect=0
//////////

//nota: para calcular o quanto realmente demora o cooldown vc tem que pegar (1000/spd)/30
//ex: 1000/12=83,3    83,3/30=2,78 Recy demora 2,78 segundos para volta a agir com 12 de spd
for (var imember = 0; imember<global.party_length; imember++) {
	name[imember]=global.party_members[imember].name
	slowhp[imember]=global.party_members[imember].hp
	hp[imember]=global.party_members[imember].hp
	mhp[imember]=global.party_members[imember].mhp
	atk[imember]=global.party_members[imember].atk
	def[imember]=global.party_members[imember].def
	mener[imember]=global.party_members[imember].mener
	ener[imember]=mener[imember]
	spd[imember]=global.party_members[imember].spd
	ty1[imember]=global.party_members[imember].ty1
	ty2[imember]=global.party_members[imember].ty2
	
	id_number[imember]=global.party_members[imember].id_number
	determination_slowhp[imember]=def[imember]
	//efetividade é só alterado por charmes ou magias, nunca equipamentos, além disso, é só usado em jogadores, nunca inimigos
	//outra coisa eu do futuro, se eu quiser tipo fazer um ataque que proteja a equipe contra ataques de agua, vc ativa uma var como agua_protecao_ataque=1
	//e se essa var estiver ligada no damage char vai detectar e diminuir os ataques de agua
	efetividade_geral[imember]=1
	efetividade_dano[imember]=1
	efetividade_cura[imember]=1
	efetividade_fogo[imember]=1 //o correto é fazer efetividade para cada tipo, mas eu não planejo alterar a efetivividade de todos os tipos, então surge conforme demanda
	
	//////////efeitos de charmes/equipamentos
	if charm_equipped(global.charm_list.amor_vida_charm,id_number[imember]){efetividade_cura[imember]*=1.2}
	if charm_equipped(global.charm_list.odio_vida_charm,id_number[imember]){efetividade_cura[imember]/=1.2 efetividade_dano[imember]*=1.2}
	if charm_equipped(global.charm_list.polimata_charm,id_number[imember]){efetividade_geral[imember]*=1.1}
	//////////
	
	
	function array_deep_copy(array) {
	    var _copy = [];
	    for (var i = 0; i < array_length(array); i++) {
	        if (is_array(array[i])) {
	            _copy[i] = array_deep_copy(array[i]); // Recursão para arrays internos
	        } else {
	            _copy[i] = array[i];
	        }
	    }
	    return _copy;
	}

	spells_classes[imember] = array_deep_copy(global.spells_classes[id_number[imember]]);
	
	//array_copy(spells_classes[imember], 0, global.spells_classes[ id_number[imember] ], 0, array_length(global.spells_classes[ id_number[imember] ]))
	//não usa a copy nesse caso por a array spell_classes é complexa demais
	
for (var i = 0; i < 3; i++) { // passa pelas 3 classes
    // Itera de trás para frente para evitar problemas de índice
    for (var ii = array_length(spells_classes[imember][i]) - 1; ii >= 0; ii--) {
        if array_contains(global.spells_bloqueadas[id_number[imember]], spells_classes[imember][i][ii]) {
            array_delete(spells_classes[imember][i], ii, 1);
        }
    }
}
	
	ang_flecha[imember] = 0
	anima[imember] = 1 
	ciclo_hprefresh_sn[imember]=0
	cooldown_uso[imember]=0
	mcooldown_uso[imember]=1000 //o cooldown vai de 1000 a 0
	if charm_equipped(global.charm_list.fast_charm,id_number[imember]){mcooldown_uso[imember]/=2}
	char_x[imember]=0
	char_y[imember]=0
	attack_finished[imember]=0
	char_dead[imember]=0
	defense_pose[imember]=0
	button_select[imember]=0
	spell_select[imember]=0
	spell_class_select[imember]=0
	warning_wound[imember]=0 //avisa que vai morrer (hp<0 mas slowhp>0)
	
	multiplicador_def[imember]=1 //o quanto o status é multiplicado (2x o ataque)
	ponto_extra_def[imember]=0 //o quanto o status ganha em ponto (+2 de defesa)
	multiplicador_atk[imember]=1
	ponto_extra_atk[imember]=0
	
	//os boost é usado para determinar os modificadores, ex: Usei escudo magico então boost_multiplicador_def+=1
	//Assim, multiplicador_def=2, ou seja, def*=2
	boost_multiplicador_def[imember]=0 
	boost_ponto_extra_def[imember]=0
	boost_multiplicador_atk[imember]=0
	boost_ponto_extra_atk[imember]=0
	
	
	
}

//array_magias[id_number][class][i]

char_is_selected=0
char_selected=-1
char_select=0

have_enemies=function(){
	if battle_state=0 and keyboard_check_pressed(ord("K")){instance_destroy(obattle_enemy)}
	if battle_state=0 and !instance_exists(obattle_enemy){
		audio_sound_loop_start(Victorious,7)
		audio_sound_loop_end(Victorious,17)
		set_song_ingame(Victorious,0,0)	
	return false
	} //retorna como falsa e sai
	//atualização da vida, ener, agilidade, quem tá morto e modificadores de status
	if keyboard_check_pressed(ord("J")){change_background(number_bg+1)}
	for (var i = 0; i<global.party_length; i++) {
		if keyboard_check_pressed(ord("H")){hp[i]=mhp[i]}
		hp[i]=clamp(hp[i],-999,mhp[i])
		
		//avisa que está com a vida vermelha
		if hp[i]<=0 and !warning_wound[i]{warning_wound[i]=1 play_sfx(wound)} else if hp[i]>0{warning_wound[i]=0}
		
		if battle_state=0 or battle_state=3{
			char_dead[i]=(slowhp[i]<=0)
			if slowhp[i]>hp[i]{
				if determination_slowhp[i]--<=0{
					determination_slowhp[i]=def[i]
					slowhp[i]-=1
				}
			} else {slowhp[i]=hp[i]}
		}
		
		if battle_state=0{
			
			if cooldown_uso[i]>0{
				cooldown_uso[i]-=spd[i]
				if cooldown_uso[i]<=0{
					play_sfx(snd_menumove_ch1)
					battle_state=1
					char_select=i
					defense_pose[i]=0
				}
			}

			//mcooldown_uso
			if attack_finished[i]{attack_finished[i]=0 cooldown_uso[i]=mcooldown_uso[i]}
			cooldown_uso[i]=clamp(cooldown_uso[i],0,mcooldown_uso[i])
			
			//Não tem necessidade de ficar atualizando os status a todo momento
			//reseta os status para os originais temporariamente
			multiplicador_def[i]=1
			ponto_extra_def[i]=0
			multiplicador_atk[i]=1
			ponto_extra_atk[i]=0
			
			def[i]=global.party_members[i].def
			atk[i]=global.party_members[i].atk
			//aplica os modificadores
			multiplicador_def[i]+=boost_multiplicador_def[i]
			multiplicador_atk[i]+=boost_multiplicador_atk[i]
			def[i]*=multiplicador_def[i]+(defense_pose[i])
			def[i]+=ponto_extra_def[i]
			
			atk[i]*=multiplicador_atk[i]
			atk[i]+=ponto_extra_atk[i]
		}
	
		switch (id_number[i]){
			case 0: //Dolissue
				//Ganha ES ao descansar
			break
		
			case 1: //Lambary
				//fogo ganha quimando inimigos ou vc msm
			break
		
			case 2: //S.N
				if ciclo_hprefresh_sn[i]=1{
					ener[i]=0
					//+10HP
					ciclo_hprefresh_sn[i]=0
				}
			
				if battle_state=0{ener[i]+=1}
			break
		}
	}

	//navegação nos menus
	switch (battle_state){
		case 0:
			spell_turbinada=0
			var _sound_char_select= char_select
			char_select+=(right_key - left_key)
			if char_select>global.party_length-1{char_select=0} else
			if char_select<0{char_select=global.party_length-1}
			if _sound_char_select!= char_select{play_sfx(snd_menumove_ch1)}
			char_selected=-1
			if confirmar_key{
				var _snd=snd_cantselect
				if !char_dead[char_select] and !defense_pose[char_select]{
					_snd=snd_select_ch1
					battle_state=1
				}
				play_sfx(_snd)
			}
			//change_info_text("tb_Generic")
			//execute_funny_text
			if call_flavor_text{
				call_flavor_text=0
				var _execute_flavor_text=irandom(instance_number(obattle_enemy)-1)
				var _inst=instance_find(obattle_enemy,_execute_flavor_text)
				_inst.execute_funny_text=1
			}
		break
	
		case 1:
			char_selected=char_select
		
			if choosing_spell=0 and !instance_exists(obattle_check_act){ //escolhendo botão
				var _sound_button_select= button_select[char_select]
				button_select[char_select]+=(down_key-up_key)
				if button_select[char_select]>2{button_select[char_select]=0} else
				if button_select[char_select]<0{button_select[char_select]=2}
				if _sound_button_select!= button_select[char_select]{play_sfx(snd_menumove_ch1)}
			} else if choosing_spell=1 and !instance_exists(obattle_check_act) { //escolhendo a magia (tem que escrever assim a condição senão dá para mudar a classe usando o checar)
				var _sound_spell_select= spell_select[char_selected]
				var _sound_spell_class_select= spell_class_select[char_selected]
				spell_select[char_selected]+=(down_key-up_key)				
				spell_class_select[char_selected]+=(right_key - left_key)
				
				if menu_key
				{
					spell_turbinada=!spell_turbinada
					if spell_turbinada{play_sfx(sfx_gui_battle_abilityring_open)} else {play_sfx(sfx_gui_battle_abilityring_close)}
				}
				
				var _len=4 //Ofensiva Suporte Outros Especial (4 classes)
				if spell_class_select[char_selected]>=_len{spell_class_select[char_selected]=0} else
				if spell_class_select[char_selected]<0{spell_class_select[char_selected]=_len-1}
				
				
				///////// parte que mexe no spell_slect e no _min _max para mostrar as magias melhor
				_len=array_length(spells_classes[char_select][spell_class_select[char_selected]])
				if spell_select[char_selected] >= _len {spell_select[char_selected]=0 spell_min=0 spell_max=spell_num}
				if spell_select[char_selected] < 0
				{
					spell_select[char_selected]= _len-1
					for(var i=0;i<9999;i++){
						var _tnum=spell_num*i
						if _tnum> _len-1{spell_max=_tnum spell_min=spell_max-spell_num i=9999}
					}
				}

				if spell_select[char_selected]>=spell_max{spell_min+=spell_num spell_max+=spell_num} else if spell_select[char_selected]<spell_min{spell_min-=spell_num spell_max-=spell_num}
				if _sound_spell_select!= spell_select[char_selected]{play_sfx(snd_menumove_ch1)}
				if _sound_spell_class_select!= spell_class_select[char_selected]{play_sfx(snd_menumove_ch1)}
				////////////

			}
		
			if confirmar_key and !instance_exists(obattle_check_act){
				
				if choosing_spell=0{
					
					switch (button_select[char_select]){
						case 0: //atacar
							var _snd=snd_cantselect
							if cooldown_uso[char_select]=0{
								_snd=snd_select_ch1
								choosing_spell=1
								change_info_text("nor",2) //flavor text fica invisivel para poder enxergar as magias
							}
							play_sfx(_snd)
						break
						
						case 1: //Defender
							play_sfx(snd_weaponpull_fast)
							cooldown_uso[char_select]+=mcooldown_uso[char_select]/4
							battle_state=0
							defense_pose[char_select]=1
							deses+=2
						break
						
						case 2: //checar
							play_sfx(snd_select_ch1)
							instance_create_depth(char_x[char_select],char_y[char_select],depth-10,obattle_check_act)
							change_info_text(,2)
						break
					}

					cooldown_uso[char_select]=clamp(cooldown_uso[char_select],0,mcooldown_uso[char_select])	
					
				} else if choosing_spell=1{
					var _snd=snd_cantselect
					if array_length(spells_classes[char_selected][spell_class_select[char_selected]])>0{
						var _spell=spells_classes[char_selected][spell_class_select[char_selected]][spell_select[char_selected]]
						//depois checar se ter energia o suficiente e levar em conta que o sn usa vida
						//tirei para testes
						if deses>=(_spell.custo_deses+custo_extra_spell_turbinada) and ener[char_selected]>=(_spell.custo_ener+custo_extra_spell_turbinada){
							_snd=snd_select_ch1
							battle_state=2
							choosing_spell=0
							invocar_atk_char(_spell)
						}
					}
					play_sfx(_snd)
				}
			}
		
			if cancelar_key and !instance_exists(obattle_check_act){
				if choosing_spell=0{
					play_sfx(snd_smallswing)
					battle_state=0
				} else if choosing_spell{
					spell_turbinada=0
					play_sfx(snd_smallswing)
					choosing_spell=0
					change_info_text("nor",3) //flavor text volta a ficar visivel
				}
			
			}
			//inimigos paralisam, energia para de aumentar e vida para de cair
		break
	}
	
	return true
}

no_more_enemies=function(){
	end_of_battle=1
	change_info_text("text_victory",0,exp_gain_total)
	for (var i = 0; i<global.party_length; i++) {
			hp[i]=mhp[i]
			slowhp[i]=hp[i]
			cooldown_uso[i]=0
			ener[i]=mener[i]
			char_dead[i]=0
			defense_pose[i]=0
	}
	if confirmar_key{end_battle()}
}


//	instance_activate_object(oenemy_overworld) USAR ISSO NO DESTROY
//		for(var i=0;i<array_length(creator);i++){
//			instance_destroy(creator[i])
//		}