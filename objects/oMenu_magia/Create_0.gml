if instance_exists(oMenu){depth=oMenu.depth-10} 
flag_draw=1

border=6
space=10
animation=0

width=202+border
height=(border*2+string_height("A")+(6)*space)
sprite_index=sTextbox_normal
back_sprite = sTextbox_back_normal

anim_frame = 0
anim_speed = -(30/30)
anim_total = sprite_get_number(sspike_block)
desc_x=camera_get_view_x(view_camera[0])
desc_y=camera_get_view_y(view_camera[0])
desc_yscale=0
desc_xscale=0

transition_time = 20; // Número de passos para a transição completa
//40
timer = 0;
color_start = c_white;
color_end = c_yellow;
transition_progress = 0; // Progresso da transição, de 0 a 1
transitioning = true;

atvx=camera_get_view_x(view_camera[0])+camera_get_view_width(view_camera[0])/2 - (width)/2
atvy=camera_get_view_y(view_camera[0])+camera_get_view_height(view_camera[0])/2 - (height)/2

resx=camera_get_view_x(view_camera[0])- (width)
resy=atvy

x=resx y=resy tx=atvx ty=atvy
ending=0

///////retirado do primor

//mudar para ele entram no lado e depth-10, desenhar emcima spike e usar para descrição (feito)

//ai no state=2 z é usado para reorganizar as magias e C para eleinar, as deixando vermelhas e adiconando
//na lista de magias bloqueadas de cada personagem(usa as outlines para reorganizar e muda a cor para vermelho para eliminar)

//fazer que na batalha passe por um check que vê se a magia está na lista de bloqeuadas e então não adiciona
//ela no leque
party_show_mode(1)
state=0 //0 escolhendo um personagem 1 escolhendo a classe 2 vendo as magias
char_selected=char_select

spells_classes_name=["Ofensiva","Suporte","Outro","Especial"]
spell_num=12 //numero de magias que pode aparecer por vez na seleção
spell_div=6 //6 magias por coluna
spell_min=0
spell_max=spell_num

spell_select=0
spell_class_select=0

spell_mode=0 //0 comum, só olhando as magias 1 muda as magias de ordem 
spell_organizar_old_info=0
spell_organizar_old_pos=0
spell_organizar_new_info=0
spell_organizar_new_pos=0
//info oq é a magia pos onde ela tava, old e new são os lugares que serão trocados

for (var imember = 0; imember<global.party_length; imember++) {
	name[imember]=global.party_members[imember].name
	id_number[imember]=global.party_members[imember].id_number
	
	spells_classes[imember]=array_create(0)
	array_copy(spells_classes[imember], 0, global.spells_classes[ id_number[imember] ], 0, array_length(global.spells_classes[ id_number[imember] ]))
}

state_char=function(){
	var _sound_char_select= char_select
	char_select+= right_key - left_key
	if char_select >= global.party_length {char_select=0}
	if char_select < 0 {char_select= global.party_length-1}
	if _sound_char_select!= char_select{
		 play_sfx(snd_menumove_ch1)	 
	}
	char_selected=char_select 
	if accept_key {play_sfx(snd_select_ch1) state=1} else if cancel_key{play_sfx(snd_smallswing) ending=1}
}

state_class=function(){
	var _sound_spell_class_select= spell_class_select
	spell_class_select+=(right_key - left_key)
	spell_select=0 //para evitar bugs
	var _len=4 //Ofensiva Suporte Outros Especial (4 classes)
	if spell_class_select>=_len{spell_class_select=0} else
	if spell_class_select<0{spell_class_select=_len-1}
	if _sound_spell_class_select!= spell_class_select{
		play_sfx(snd_menumove_ch1)	 
	}
	if accept_key {
		if array_length(spells_classes[char_selected][spell_class_select])>0{
			play_sfx(snd_select_ch1) state=2
		} else {
			play_sfx(snd_cantselect)
		}
	} else if cancel_key{play_sfx(snd_smallswing) state=0}
}

spell_organizar=function(){ //adicionar efeitos
	var _spell=spells_classes[char_selected][spell_class_select][spell_select]
	if accept_key{
		var _snd=snd_cantselect
		spell_organizar_new_info=_spell
		spell_organizar_new_pos=spell_select
		if spell_organizar_new_info!=spell_organizar_old_info and spell_organizar_new_pos!=spell_organizar_old_pos{
			array_set(spells_classes[char_selected][spell_class_select],spell_organizar_old_pos,spell_organizar_new_info)
			array_set(spells_classes[char_selected][spell_class_select],spell_organizar_new_pos,spell_organizar_old_info)
			spell_mode=0
			_snd=snd_select_ch1
		}
		play_sfx(_snd)
	} else if cancel_key{play_sfx(snd_smallswing) spell_mode=0}
	
}

state_spell=function(){
	var _sound_spell_select= spell_select
	spell_select+=(down_key-up_key)
	spell_select+=(right_key - left_key)*spell_div				
				
	///////// parte que mexe no spell_slect e no _min _max para mostrar as magias melhor
	_len=array_length(spells_classes[char_selected][spell_class_select])
	if spell_select >= _len {spell_select=0 spell_min=0 spell_max=spell_num}
	if spell_select < 0
	{
		spell_select= _len-1
			for(var i=0;i<9999;i++){
			var _tnum=spell_num*i
			if _tnum> _len-1{spell_max=_tnum spell_min=spell_max-spell_num i=9999}
			}
	}

	if spell_select>=spell_max{spell_min+=spell_num spell_max+=spell_num} else if spell_select<spell_min{spell_min-=spell_num spell_max-=spell_num}
	////////////
	if _sound_spell_select!= spell_select{
		play_sfx(snd_menumove_ch1)	 
	}
	
	if spell_mode{
		spell_organizar()
	} else {
		var _spell=spells_classes[char_selected][spell_class_select][spell_select]
		if accept_key {
			play_sfx(snd_select_ch1) spell_mode=1
			spell_organizar_old_info=_spell
			spell_organizar_old_pos=spell_select
		} else if cancel_key{
			play_sfx(snd_smallswing) state=1
		} else if menu_key{
			var _snd=Cancel1
			var _idi=id_number[char_selected]
			if !array_contains(global.spells_bloqueadas[_idi],_spell){ 
				array_push(global.spells_bloqueadas[_idi],_spell)
			} else if array_contains(global.spells_bloqueadas[_idi],_spell){
				_snd=snd_cantselect
				if (global.charms_points[_idi]-_spell.price>=global.charms_points_spend[_idi]){
					_snd=Cursor2
					var _index=array_get_index(global.spells_bloqueadas[_idi],_spell)
					array_delete(global.spells_bloqueadas[_idi],_index,1)
				}
			}
			play_sfx(_snd)
		}
	}
	
}