

function create_type(_name, _num, _desv, _vant) constructor
{
	name= _name
	num= _num
	des= _desv
	van= _vant
}


function create_enemy(_name, _mhp, _atk, _def, _spd, _type1, _type2, _exp_reward, _id_number) constructor
{
	name= _name
	mhp= _mhp
	spd= _spd
	atk= _atk
	def= _def
	ty1= _type1
	ty2= _type2
	exp_reward= _exp_reward
	id_number= _id_number
}

function create_equip(_name, _namep, _desc, _spr, _mhp, _mener, _atk, _def, _spd, _price, _wora=0 ,_port=[0,1,2], _effect= function(){}, _rev_effect= function(){},_item_type=1) constructor
	{
		name= _name
		namep= _namep
		desc= _desc
		spr= _spr
		mhp= _mhp
		mener= _mener
		atk= _atk
		def= _def
		spd= _spd
		price= _price
		//quem pode usar(portar)
		port= _port
		//Armor(0), Weapon(1) e Main(2), main é tipo a arma principal, não dá muitos status mas tem efeitos bons, a outra arma só auxilia
		wora= _wora
		//ativar algum efeito
		effect= _effect
		//desativar o efeito
		rev_effect= _rev_effect
		item_type= _item_type
	}

//item_type 0=item comer 1=equipamento 2=key_itens 3=sell_itens (Eu só uso o 2 neste jogo lol)
function create_item(_name, _desc, _spr, _effect,_item_type=0) constructor
	{
		name= _name
		desc= _desc
		spr= _spr
		effect= _effect
		item_type= _item_type
	}

function create_charm(_name, _namep, _desc,_spr, _price,_id_number) constructor
{
		name= _name
		namep= _namep 
		desc= _desc
		spr= _spr
		id_number= _id_number
		price= _price
}

//adicionar os niveis de ten
function create_spell(_name, _custo_ener, _custo_deses, _contac, _desc1, _desc2, _price, _type1, _type2, _class, _id_number) constructor
	{
		name= _name
		custo_ener= _custo_ener
		custo_deses= _custo_deses
		contac= _contac //contato fisico (1) a distancia (2)
		desc1= _desc1 //Descrição curta
		desc2= _desc2 //Descrição mais detalhada
		price= _price //quantos pontos ela vai dar quando é bloqueada
		ty1= _type1
		ty2= _type2
		class= _class //0 Ofensiva 1 Suporte 2 Outros 3 Especial
		id_number= _id_number //id de como deve agir
	}

function item_chave_function_default(_text_id="item_nada_aconteceu") constructor
{
	create_textbox(_text_id)
	oMenu.ending=1
	instance_destroy(oother_menus)
}

global.types_list= //reinmplementar o sistema e tipos pra ser mais como toby fox e intuitivo
{
	holy: new create_type( //tipo dos anjos na ultima area
		"Divino",0,
		[0]
		,[1,2,3,4,5,6,7,8,9,10,11,12,13]
		),
		
	normal: new create_type(
		"Normal",1,
		[13]
		,[]
		),
		
	fire: new create_type(
		"Fogo",2,
		[3,4,13]
		,[6,7,10,14]
		),
	
	agua: new create_type(
		"Água",3,
		[9,12,13,14]
		,[2,8]
		),
	
	terra: new create_type(
		"Terra",4,
		[5,6,10,13]
		,[2,9,10]
		),

	ar: new create_type(
		"Ar",5,
		[13]
		,[5,9] //terra não alcança ar e ar é um pessimo condutor de eletricidade (Não coloquei fogo pq ele já perde para outros 3 elementos coitado)
		),

	metal: new create_type(
		"Metal",6,
		[2,6,9,13] //metal é um bom condutor de eletricidade
		,[7,10,12,14]
		),

	carne: new create_type(
		"Carne",7,
		[2,6,8,9,12,13]
		,[10]
		),
		
	tecn: new create_type(
		"Tecnologico",8,
		[3,9,11,13]
		,[7,10,12]
		),
		
	elet: new create_type( //Nota, se é um robo, não significa que é eletrico
		"Elétrico",9,
		[4,5,13]
		,[3,6,7,8]
		),
		
	silk: new create_type(
		"Tecido",10,
		[2,4,7,8,10,13]
		,[5] //pedurar coisas no ar
		),

	psi: new create_type(
		"Psiquico",11,
		[12,13]
		,[4,5,6,8,9] //a coisa mais comum de poderes psiquicos é levitar rochas, amassar metais, mexer com ondas eletromagneticas e tecnologia
		),
	
	psita:  new create_type( 
		"Parasita",12,
		[6,8,13]
		,[3,7,11]//é na agua que tem ovos de parasitas
		),
		
	recl:  new create_type( //Tem proteção contra tudo, mas nenhuma vantagem (Todos os tipos tem desv)
		"Recluso",13,
		[13] //só uma pessoa reclusa consegue ferir outra reclusa 
		,[]
		),
		
	planta: new create_type(
		"Planta",14,
		[2,6,13]
		,[3]
		),
}

global.enemies_list=
{
	echidna: new create_enemy(
		"Echidna",
		999,
		1,
		1,
		1,
		global.types_list.normal,
		global.types_list.normal,
		0,
		0
		),
	
	dummy: new create_enemy(
		"Dummy",
		10,
		15,
		1,
		2,
		global.types_list.normal,
		global.types_list.normal,
		10,
		1
		),

	froggit: new create_enemy(
		"Froggit",
		10,
		30,
		0,
		10,
		global.types_list.normal,
		global.types_list.normal,
		14,
		2
		),
	
	blocker: new create_enemy(
		"Blocker",
		10,
		20,
		0,
		3,
		global.types_list.normal,
		global.types_list.normal,
		27,
		3
	)
}

global.equip_list=
{
	main_def: new create_equip(
	"Main comum",
	"Main C",
	"Arma principal, ela não muda status, só mecanicas",
	sequip_main_def,
	10,
	5,
	8,
	8,
	4,
	67,
	2,
	[0]
	),
	
	esp_def: new create_equip(
	"Espada comum",
	"Esp. C",
	"Uma espada comum, para um item de default",
	sequip_esp_def,
	0,
	0,
	12,
	1,
	0,
	10,
	1
	),
	
	arm_def: new create_equip(
	"Armadura comum",
	"Arm. C",
	"Uma armadura comum, para um item de default",
	sequip_arm_def,
	0,
	0,
	0,
	10,
	5,
	7
	),
	
	arm_def2: new create_equip(
	"Armadura outra",
	"Arm. outra",
	"outra armadura, diferenciar",
	sequip_arm_def,
	0,
	0,
	2,
	8,
	17,
	20
	),
	
	///iniciais/nada
	main_nada: new create_equip(
	"Main nada",
	"Main nada",
	"hshshshs",
	sequip_main_def,
	0,
	0,
	0,
	0,
	0,
	0,
	2
	),
	
	esp_nada: new create_equip(
	"Espada nada",
	"Esp. nada",
	"sghshsu",
	sequip_esp_def,
	0,
	0,
	0,
	0,
	0,
	0,
	1
	),
	
	arm_nada: new create_equip(
	"Armadura nada",
	"Arm. nada",
	"aaaaaaaaa",
	sequip_arm_def,
	0,
	0,
	0,
	0,
	0,
	0,
	),
	
}

global.item_list=
{		
			chave: new create_item(
			"Chave",
			"Uma chave para abrir uma porta",
			skitem_chave,
			function(){ new item_chave_function_default()},
			2
			),
		
			cartao: new create_item(
			"Cartão de acesso",
			"Usado para abrir diversas por- a que saber? vc já sabe oq faz eu não preciso ficar explicando tudo",
			scartaoacesso1,
			function(){ new item_chave_function_default()},
			2
			),
			
			blonotas: new create_item(
			"Bloco de notas",
			"Um conjunto de informações sobre o sistema de batalha",
			scartaoacesso1,
			function(){ new item_chave_function_default("bloconotas")},
			2
			),

}

global.charm_list=
{
	fast_charm: new create_charm(
	"Aura de apressado",
	"Aura.Apressado",
	"Corta o tempo necessário para agir do usuário pela metade",
	sfast_charm,
	1,
	0
	),
	
	gcharm: new create_charm(
	"Charme genérico para testes",
	"C.Genérico",
	"Não faz nada, na vdd, nem era pra ser usado",
	sgeneric_charm,
	1,
	1
	),

	postura_raiva_charm: new create_charm(
	"Postura de Raiva",
	"Post.Raiva",
	"Quanto maior o desespero, maior será o dano das magias",
	sgeneric_charm,
	2,
	2
	),

	postura_defesa_charm: new create_charm(
	"Postura de defesa",
	"Post.def.",
	"O dano das magias agora é baseado em defesa",
	sgeneric_charm,
	2,
	3
	),

	postura_agilidade_charm: new create_charm(
	"Postura de agilidade",
	"Post.agilidade.",
	"O dano das magias agora é baseado em agilidade",
	sgeneric_charm,
	2,
	4
	),
	
	ninho_charm: new create_charm(
	"Ninho de aliados",
	"Ninho.aliados",
	"Com o tempo, o usuário irá produzir pequenos animais baseados no seu estilo de magia, então, ao realizar uma cura, atacaram todos os inimigos aleátorimente",
	sgeneric_charm,
	4,
	5
	),
	
	estatua_mortal_charm: new create_charm(
	"Estátua mortal",
	"Estátua mortal",
	"Pedrifica o espirito do usuario durante a batalha, reduzindo drasticamente sua agilidade, contudo, aumentara o ataque em 80%",
	sgeneric_charm,
	3,
	6
	),
	
	morri_pronto_charm: new create_charm(
	"Morri pronto",
	"Morri pronto",
	"Começa a batalha já pronto para agir",
	sgeneric_charm,
	3,
	7
	),
	
	amor_vida_charm: new create_charm(
	"Amor à vida",
	"Amor.vida",
	"Aumenta a efetividade de qualquer cura realizada pelo usuario em 20%",
	sgeneric_charm,
	2,
	8
	),

	odio_vida_charm: new create_charm(
	"Odio à vida",
	"Odio.vida",
	"Diminui a efetividade de qualquer cura realizada pelo usuario em 20%, mas aumenta o dano em 20%",
	sgeneric_charm,
	2,
	9
	),
	
	polimata_charm: new create_charm(
	"Polímata",
	"Polímata",
	"Esse charme contentem o conhecimento em batalha de milhares de outras crianças. Aumenta a efetividade de todas as magias em 10%",
	sgeneric_charm,
	2,
	10
	),

	
}

global.spells_list=
{
			ember: new create_spell(
			"Faísca",
			10,
			0,
			0,
			"Gera uma pequena faísca",
			"Gera uma faísca que levemente machuca os inimigos",
			1,
			global.types_list.fire,
			global.types_list.normal,
			0,
			0
			),
			
			fire_heal: new create_spell(
			"Cura acalorada",
			4,
			10,
			0,
			"Cura 50HP",
			"Envolve um aliado em um vortex de fogo, seu calor revigora o espirito +50HP",
			2,
			global.types_list.fire,
			global.types_list.normal,
			1,
			1
			),
			
			lombriga: new create_spell(
			"Lombriga",
			6,
			0,
			1,
			"Suga a vida de uma fileira",
			"Uma lombriga ataca todos em uma fileira, sugando parte dos seus nutriente no processo",
			3,
			global.types_list.carne,
			global.types_list.normal,
			0,
			2
			),
			
			costura_pele: new create_spell(
			"Costura de pele",
			10,
			20,
			0,
			"Ataca e retarda todo mundo",
			"Rapidamente costura os inimigos no chão, os machucando e diminuindo a velocidade de todos",
			4,
			global.types_list.silk,
			global.types_list.metal,
			0,
			3
			),

			fire_hurt_char: new create_spell(
			"Machuca personagem",
			0,
			0,
			0,
			"Perde 50HP",
			"Eu preciso testar o damage_char quando dá dano, pq eu programaria uma magia que só machuca um aliado ksksks",
			99,
			global.types_list.normal,
			global.types_list.normal,
			1,
			4
			),

			evapora_agua: new create_spell(
			"Evapora agua",
			1,
			0,
			0,
			"Diminui o poder de ataques de agua",
			"O usuário cria um calor seletivo que evapora toda agua ao redor, protegendo contra ataques de agua",
			2,
			global.types_list.fire,
			global.types_list.psi,
			2,
			5
			),
}

global.icon_health[0]=icon_recy //icons usados no menu health
global.icon_health[1]=icon_sophia
global.icon_health[2]=icon_emma
function level_up_tree(_level, _id_number){ //só te passa que magias o personagem deveria ganhar naquele level
	var _spells_earn=array_create(0)
	switch (_id_number){
	
		case 0: //Dolissue
			switch(_level){
				
				case 99:
					array_push(_spells_earn,global.spells_list.costura_pele)
					array_push(_spells_earn,global.spells_list.ember)
					array_push(_spells_earn,global.spells_list.evapora_agua)
				break
				
			break
			}
		break
		
		case 1: //Lambary
			switch(_level){
				
				case 99:
					array_push(_spells_earn,global.spells_list.costura_pele)
					array_push(_spells_earn,global.spells_list.ember)
					array_push(_spells_earn,global.spells_list.evapora_agua)
				break
				
			break
			}
		break
		
		case 2: //S.N
			switch(_level){
				
				case 99:
					array_push(_spells_earn,global.spells_list.costura_pele)
					array_push(_spells_earn,global.spells_list.ember)
					array_push(_spells_earn,global.spells_list.evapora_agua)
				break
				
			break
			}
		break
	
	break
	}
	
	return _spells_earn
}

function level_up_tree_add(_level, _id_number){ //adiciona as magias
	var _spells_earn=level_up_tree(_level, _id_number)
	if array_length(_spells_earn)>0{
		for (var p = 0; p<array_length(_spells_earn); p++) {
			spell_add(_spells_earn[p], _id_number)
		}
	}
}

function charm_equipped(_charm, _id_number){
	return array_contains(global.charms[_id_number], _charm)
}

function jogar_fora_item(){ //não usado
var _inst_item=	instance_create_depth(oPlayer.x-10,oPlayer.y+10,oPlayer.depth+10,oitem_overworld,{image_alpha: 0})
		_inst_item.item=inv[pos_inv][pos_item]
		array_delete(inv[pos_inv],pos_item,1)
		options_item_mode=0
}

function NewEnconter(_enemies,_apr=0,_bg=0){ //_apr=1 mas por enquanto é 0
	if not global.battle_mode{
	enemy_list_id=array_create(0)
	array_push(enemy_list_id,id)
	if _apr{
	enemy_list=array_create(0)
	array_push(enemy_list,_enemies)
	for(var i=0;i<instance_number(oenemy_overworld);i++){
		var _inst=instance_find(oenemy_overworld,i)
		if _inst!=id{
			if distance_to_object(_inst)<=120 and hp>0{
			array_push(enemy_list_id,_inst.id)
			array_push(enemy_list,_inst.list_name)
			}
		}
	}
	_enemies=enemy_list
	} else {
	enemy_list=_enemies
	//enemy_list_id=id
	}
	//global.enemy_list=enemy_list
	
	
	
	global.can_move=false
	var _meio_w=camera_get_view_x(view_camera[0])+ (camera_get_view_width(view_camera[0])/2)
	var _meio_h=camera_get_view_y(view_camera[0])+ (camera_get_view_height(view_camera[0])/2)
	layer_create(-room_height-800,"Battle Layer")
	layer_create(-room_height-700,"Background Battle Layer")
	var _layer_id_b = layer_get_id("Battle Layer") //layer de instancia onde ficam os objetos da batalha
	var _layer_id_not_bg = layer_get_id("Background Battle Layer") //é uma layer comum, não de background
	var _layer_id_bg = layer_background_create(_layer_id_not_bg,sblack) //layer de background, onde fica o bg né
	//instance_create_layer(_meio_w,_meio_h,_layer_id_b,ointro_battle,{fast_mode: 1})
	instance_create_layer(
		camera_get_view_x(view_camera[0]),
		camera_get_view_y(view_camera[0]),
		_layer_id_b,
		obattle_manager,
		{enemies: _enemies, creator: enemy_list_id, layer_id_b: _layer_id_b, layer_id_bg: _layer_id_bg, layer_id_not_bg: _layer_id_not_bg, number_bg: _bg}
	);
	}

}

function background_create_variables(_number_bg){
	bg_x=0 //posição x e y do bg
	bg_y=0
	bg_go_x=0 //velocidade horizontal
	bg_go_y=0 //velocidade vertical
	switch (_number_bg){
		case 0:
			bg_go_x=1
			bg_go_y=1
			layer_background_change(layer_id_bg,sback_teste)
			layer_background_blend(layer_id_bg,c_teal)
			layer_background_htiled(layer_id_bg,true)
			layer_background_vtiled(layer_id_bg,true)
		break
		
		case 1:
			glow_power=0
			glow_speed=0.01
			layer_background_change(layer_id_bg,sback_teste)
			layer_background_blend(layer_id_bg,c_teal)
			layer_background_htiled(layer_id_bg,true)
			layer_background_vtiled(layer_id_bg,true)
			
			glow_fx = fx_create("_effect_glow");
			fx_set_single_layer(glow_fx, true);
			fx_set_parameter(glow_fx, "g_GlowQuality", 3)
			fx_set_parameter(glow_fx, "g_GlowIntensity", glow_power)
			layer_set_fx(layer_id_not_bg, glow_fx);
		break

		case 2:
			layer_background_change(layer_id_bg,sback_teste)
			layer_background_blend(layer_id_bg,c_teal)
			layer_background_htiled(layer_id_bg,true)
			layer_background_vtiled(layer_id_bg,true)
			
			ripples_fx = fx_create("_filter_ripples");
			fx_set_single_layer(ripples_fx, true);
			layer_set_fx(layer_id_not_bg, ripples_fx);
		break

		case 3:
			bg_go_x=1
			bg_go_y=1
			distort_power=60
			distort_speed=1
			layer_background_change(layer_id_bg,sback_smile)
			layer_background_blend(layer_id_bg,c_red)
			layer_background_htiled(layer_id_bg,true)
			layer_background_vtiled(layer_id_bg,true)
			
			distort_fx = fx_create("_filter_distort");
			fx_set_single_layer(distort_fx, true);
			fx_set_parameter(distort_fx, "g_DistortScale", 5)
			layer_set_fx(layer_id_not_bg, distort_fx);
		break
		
		case 4:
			var _bg_spd=1
			bg_go_x=_bg_spd
			bg_go_y=_bg_spd
			layer_background_change(layer_id_bg,sback_teste)
			layer_background_blend(layer_id_bg,c_teal)
			layer_background_htiled(layer_id_bg,true)
			layer_background_vtiled(layer_id_bg,true)

			layer_create(-701,"Background Battle Layer2")
			layer_id_not_bg2 = layer_get_id("Background Battle Layer2")
			layer_id_bg2 = layer_background_create(layer_id_not_bg2,sblack)
			
			bg_x2=0
			bg_y2=0
			bg_go_x2=_bg_spd
			bg_go_y2=-_bg_spd
			layer_background_alpha(layer_id_bg2,0.5)
			layer_background_change(layer_id_bg2,sback_teste)
			layer_background_blend(layer_id_bg2,c_teal)
			layer_background_htiled(layer_id_bg2,true)
			layer_background_vtiled(layer_id_bg2,true)
		break
	}
}

function change_background(_number_bg){ //não é feito para qualquer transição, usado só para momentos especificos, e só está preparado para esses momoentos especificos :P
	if _number_bg>3{_number_bg=0} //adiciona temp para teste
	//deixar assim como era no inicio
	number_bg=_number_bg
	bg_x=0 //posição x e y do bg
	bg_y=0
	bg_go_x=0 //velocidade horizontal
	bg_go_y=0 //velocidade vertical
	layer_background_change(layer_id_bg,sblack)
	layer_background_blend(layer_id_bg,c_white)
	layer_background_htiled(layer_id_bg,false)
	layer_background_vtiled(layer_id_bg,false)
	layer_clear_fx(layer_id_bg)
	//mudar para as novas variavéis
	background_create_variables(number_bg)
}

function inicio_battle(){
	///colocando musica
	set_song_ingame(Burn_Brighter_Battle,0,0)
	////ajeitando o bg
	background_create_variables(number_bg)
	//invocando inimigos nas fileiras
	for(var i=0;i<array_length(enemies);i++){
		var _row=irandom(2)
		var _id=instance_create_depth(x,y,depth,obattle_enemy,{enemy_identity: enemies[i], enemy_number_creation: i, enemy_row: _row})
		array_push(row_entities[_row],_id)
	}

}

function change_info_text(_text_id,_what_do=0, _1_info="[Sem informação]",_2_info="[Sem informação]", _3_info="[Sem informação]", _4_info="[Sem informação]", _5_info="[Sem informação]", _6_info="[Sem informação]"){
	//0 mudar o texto 1 destruir 2 Deixar invisivel 3 deixar visivel
	var _id=obattle_manager.id_info_tb
		if _what_do<=1{
			
			if instance_exists(_id){
				if _what_do=1{instance_destroy(_id)}
				if _what_do=0{
					if _id.text_id!=_text_id{
						instance_destroy(_id)
						obattle_manager.id_info_tb=create_textbox(_text_id,2,_1_info,_2_info, _3_info, _4_info, _5_info, _6_info)
					}
				}
			} else if _what_do=0{obattle_manager.id_info_tb=create_textbox(_text_id,2,_1_info,_2_info, _3_info, _4_info, _5_info, _6_info)}

		} else {
			if instance_exists(_id){
			if _what_do=2 {_id.inv_mode=1} else if _what_do=3 {_id.inv_mode=0}
									}
		}
	
	//return 
	
	}	

function char_battle_info(_id_number,_what_info=0){ //0 cor 1 nome 2 Ener sigla 3 Ener simbolo
	var _char_battle_color=c_white
	var _char_battle_name="AAA"
	var _char_battle_ener_name="PSI"
	var _char_battle_ener_simb=s_status_res
	//ES usar o res FG usa o star mis CN usa tenp (Placeholder)
	switch (_id_number){
		case 0:
			//Dolissue
			_char_battle_color=c_yellow // amarelo
			_char_battle_name=global.party_list.doli.name
			_char_battle_ener_name="ES" //ESTABILIDADE
			_char_battle_ener_simb=s_status_res
		break
		
		case 1:
			//Lambary
			_char_battle_color=c_orange //laranja com vermelho
			_char_battle_name=global.party_list.lamb.name
			_char_battle_ener_name="FG" //FOGO/CHAMA
			_char_battle_ener_simb=s_star_mis
		break
		
		case 2:
			//S.N
			_char_battle_color=c_purple //marrom com rosa?
			_char_battle_name=global.party_list.sn.name
			_char_battle_ener_name="CN" //CARNE
			_char_battle_ener_simb=s_status_tenp
		break
	}

	if _what_info=0{
		return _char_battle_color
	} else if _what_info=1{
		return _char_battle_name
	} else if _what_info=2{
		return _char_battle_ener_name
	} else if _what_info=3{
		return _char_battle_ener_simb
	}
}

function choose_battle_alvo(_choose_type=0){ //0 só um aléatorio 1 todo mundo
	var _alvos_possiveis=array_create(0)
	for (var i = 0; i<global.party_length; i++){
		if !obattle_manager.char_dead[i]{array_push(_alvos_possiveis,i)}
	}
	var _alvo_escolhido
	if array_length(_alvos_possiveis)>0{
		if _choose_type=0{_alvo_escolhido=_alvos_possiveis[irandom(array_length(_alvos_possiveis)-1)]} else {_alvo_escolhido=_alvos_possiveis}
	} else {_alvo_escolhido=0} //caso todo mundo esteja morto eles atacam o primeiro na party, só pra não bugar
	//_alvo_escolhido=0 Teste para sempre atacar o primeiro
	return _alvo_escolhido
}

function invocar_atk_enemy(_id_attack,_id_invoker=id){
	if !instance_exists(oenemy_attack_performer){
	obattle_manager.battle_state=3
	instance_create_depth(x,y,depth,oenemy_attack_performer,{id_attack: _id_attack, id_invoker: _id_invoker})
	}
}

function invocar_atk_char(_id_attack,_id_invoker=char_selected){
	if !instance_exists(ochar_attack_performer){
	obattle_manager.battle_state=2
	instance_create_depth(x,y,depth,ochar_attack_performer,{id_attack: _id_attack, id_invoker: _id_invoker, turbinado: spell_turbinada})
	}
}

function empty_alvos_battle(){array_delete(global.battle_alvos,0,array_length(global.battle_alvos))}

function encerrar_atk(_de_quem=0){ //0 inimigos 1 char 2 cancela um atk de um char, fazendo ele voltar pro menu de magias
	if _de_quem=2{
		audio_play_sound(snd_smallswing,100,false)
		obattle_manager.battle_state=1 obattle_manager.choosing_spell=1
	} else {
		obattle_manager.battle_state=0
		obattle_manager.intervalo_btw_attacks=obattle_manager.mintervalo_btw_attacks
		obattle_manager.call_flavor_text=1 //trocar o flavor text para outro após o ataque
		if _de_quem=0{ //inimigos
			id_invoker.attack_finished=1
			change_info_text("",3)
			instance_destroy(obox_spawn)
			instance_destroy(obullet_battle)
		} else {
			obattle_manager.attack_finished[id_invoker]=1
			obattle_manager.ener[id_invoker]-=id_attack.custo_ener //gasta a energia
			obattle_manager.deses-=id_attack.custo_deses+(obattle_manager.custo_extra_spell_turbinada*turbinado) //gasta o desespero
		}
	}
	empty_alvos_battle()
	instance_destroy()
}

function is_orange_attack(_id_attack){
	return array_contains(global.orange_attacks,_id_attack)
}

function draw_enemy_sinal(_value, _mvalue, _value_shield, _mvalue_shield, _orange){
	if obattle_manager.battle_state!=3{
		var _xpor=x
		var _ypor=y-(sprite_height/2)-10
		var _porcentimer=(_value/_mvalue)
		var _porcentimer_shield=(_value_shield/_mvalue_shield)
		var _sinal_color=c_white
		_porcentimer=clamp(_porcentimer,0,1)
		_porcentimer_shield=clamp(_porcentimer_shield,0,1)
		if _orange{_sinal_color=c_orange}
		
		draw_sprite_ext(ssinal_enemy,1,_xpor,_ypor,1,1,0,c_white,1)
		draw_sprite_ext(ssinal_enemy,0,_xpor,_ypor,1,_porcentimer_shield,0,c_white,1)
		draw_sprite_ext(ssinal_enemy,2,_xpor,_ypor,1,1,0,c_white,1)
		draw_sprite_ext(ssinal_enemy,3,_xpor,_ypor,1,_porcentimer,0,_sinal_color,1)
		draw_text(_xpor+10,_ypor,shield_charging_attack)
	}
}

function msg_show(_msg, _x=x, _y=y, _c=c_white, _mode=0, _type_msg=0){
var _instt=instance_create_depth(_x,_y,-999999,onumber_show,{msg: _msg, c: _c, type_msg: _type_msg})
_instt.mode=_mode
}

function blink_hit_create()
{
blend_alpha=0
blend_color= c_white
piscando=false
blend_fase=1
piscando_timer= 0.1
}

function blink_hit_step_padrao(){return array_contains(global.battle_alvos,id)}

function blink_hit_step(_function_piscando=blink_hit_step_padrao())
{
	piscando= _function_piscando
	if (piscando) {
    if blend_fase=1 {
        blend_alpha += piscando_timer; // Aumenta suavemente o branco
		if blend_alpha>=1{blend_fase=0}
    } else {
        blend_alpha -= piscando_timer; // Volta suavemente ao normal
		if blend_alpha<=0{blend_fase=1}
    }
} else {if blend_alpha>0{blend_alpha -= piscando_timer}}

// Limita o blend_alpha entre 0 e 1
    blend_alpha = clamp(blend_alpha, 0, 1);

}

function blink_hit_draw(_sprite=sprite_index,_image_index=image_index,_x=x,_y=y,_xs=image_xscale,_ys=image_yscale,_angle=image_angle,_color=image_blend,_alpha=image_alpha,_need_draw_self=1)
{
	if _need_draw_self {draw_sprite_ext(_sprite,_image_index,_x,_y,_xs,_ys,_angle,_color,_alpha)}  ///draw_self()
	if blend_alpha>0{
		gpu_set_fog(true,blend_color,0,0)
		draw_sprite_ext(_sprite,_image_index,_x,_y,_xs,_ys,_angle,_color,blend_alpha)
		gpu_set_fog(false,blend_color,0,0)
	}
}

function box_rows_xy(){
	box_x=camera_get_view_x(view_camera[0])+90
	if battle_state=3 and oenemy_attack_performer.orange_attack{
		box_y=camera_get_view_y(view_camera[0])+camera_get_view_height(view_camera[0])
	} else {
		box_y=camera_get_view_y(view_camera[0])+150
	}
	var _space_for_enemys=box_y-camera_get_view_y(view_camera[0])-15 //o msm da _hpbox_y, demostradores de vida
	var _not_empty_rows=0
	for (var ii = 0; ii<3; ii++){
		if array_length(row_entities[ii])>0{_not_empty_rows++}
	}
	sep_rows=_space_for_enemys/(_not_empty_rows+1)
	var _horizontal_alinhamento_row=1
	for (var ii = 0; ii<3; ii++){
		if array_length(row_entities[ii])>0{
		row_y[ii]=camera_get_view_y(view_camera[0])+sep_rows*_horizontal_alinhamento_row
		_horizontal_alinhamento_row++
		//alinha horizontalmente as fileiras, por exemplo: Se as duas primieras fileiras tem inimigos mas a ultima não
		//essa vai ficar fora do mapa e as outras duas vão parecer que só existe 2 fileiras e não 3
		} else {row_y[ii]=camera_get_view_y(view_camera[0])} //fora de vista
	}

	//row_y[1]=fileira do meio
	//row_y[0]=fileira de tras
	//row_y[2]=fileira da frente
}

function enemy_selector_battle(_type_selection=0){
	//0 Só um inimigo 1 uma fileira 2 Todos os inimigos
	var _row_no_entities=1 //essa fileira não tem entidades
	var _sound_row_select= row_select
	row_select+=(down_key-up_key)
	while _row_no_entities{
		if row_select>2{row_select=0} else
		if row_select<0{row_select=2}
		if array_length(obattle_manager.row_entities[row_select])>0{ //essa fileira tem entidades, então = 0
		_row_no_entities=0} else {
		//continua indo para cima ou baixo até achar um fileira com algum inimigo
		if (down_key-up_key)=0{row_select++} else {row_select+=(down_key-up_key)} //evitar que, quando a batalha inicie e não tenha ninguem na fileira de tras, esse codigo fique repitindo pois o player não apertou nada ainda				
		}
	}
	if evitar_sound_select_duplo_inicio{_sound_row_select= row_select}
	if _sound_row_select!= row_select and _type_selection!=2{audio_play_sound(snd_menumove_ch1,100,false)}
	//apartir deste ponto é garantido que vc tá numa fileira com inimigos
	var _sound_enemy_select= enemy_select
	enemy_select+=(right_key - left_key)
	var _len=array_length(obattle_manager.row_entities[row_select])
	if enemy_select>=_len{enemy_select=0} else
	if enemy_select<0{enemy_select=_len-1}
	if evitar_sound_select_duplo_inicio{_sound_enemy_select= enemy_select}
	if _sound_enemy_select!= enemy_select and _type_selection=0 {audio_play_sound(snd_menumove_ch1,100,false)}
	
	evitar_sound_select_duplo_inicio=0
	
	if _type_selection=0{ //apenas um inimigo
		empty_alvos_battle()
		id_alvos=obattle_manager.row_entities[row_select][enemy_select]
		array_push(global.battle_alvos,id_alvos)
	} else if _type_selection=1{ //mira uma fileira inteira
		empty_alvos_battle()
		array_delete(id_alvos,0,array_length(id_alvos))
		var _id_alvos=obattle_manager.row_entities[row_select]
		array_copy(id_alvos, 0, _id_alvos, 0, array_length(_id_alvos)) //tem que fazer assim, senão quando deleta a id_alvos, deleta a row_entitites junto
		array_copy(global.battle_alvos, 0, id_alvos, 0, array_length(id_alvos))
	} else if _type_selection=2{ //mira todos
		empty_alvos_battle()
		array_delete(id_alvos,0,array_length(id_alvos))
		var _id_alvos=array_create(0)
		for (var _row_i = 0; _row_i<3; _row_i++){ //passa por todas as fileiras
			for (var _row_ii = 0; _row_ii<array_length(obattle_manager.row_entities[_row_i]); _row_ii++){ //passa por todos os inimigos em cada fileira
				array_push(_id_alvos,obattle_manager.row_entities[_row_i][_row_ii])
			}
		}
		
		array_copy(id_alvos, 0, _id_alvos, 0, array_length(_id_alvos)) //tem que fazer assim, senão quando deleta a id_alvos, deleta a row_entitites junto
		array_copy(global.battle_alvos, 0, id_alvos, 0, array_length(id_alvos))
	}
	//o global.battle_alvos É APENAS para mostrar quais inimigos ficam piscando, id_alvos é com oq a gente trabalha msm
}

function check_types_inter(_type1, _type2, _enemy_type1, _enemy_type2){
	var _multi=1
	for(var i=0;i<array_length(_type1.van);i++){
		if _type1.van[i]=_enemy_type1.num{_multi*=2}
		if _type1.van[i]=_enemy_type2.num{_multi*=2}
	}
	
	for(var i=0;i<array_length(_type2.van);i++){
		if _type2.van[i]=_enemy_type1.num{_multi*=2}
		if _type2.van[i]=_enemy_type2.num{_multi*=2}
	}
	
	for(var i=0;i<array_length(_type1.des);i++){
		if _type1.des[i]=_enemy_type1.num{_multi/=2}
		if _type1.des[i]=_enemy_type2.num{_multi/=2}
	}

	for(var i=0;i<array_length(_type2.des);i++){
		if _type2.des[i]=_enemy_type1.num{_multi/=2}
		if _type2.des[i]=_enemy_type2.num{_multi/=2}
	}
	
	return _multi
}

function damage_enemy(_id_alvos, _dano_base=dano_base, _extra_effects=1,_heal=0){ //id_alvos tem ids de enimigos (Usado exclusivamente para um char atacar um enemy)
	//o _extra_effects diz que vai levar em conta coisas como def, tipos, efetividade ou escudo se não, ele ignora tudo isso 
	var _dano_total_em_todos_inimigos=0
	if !is_array(_id_alvos){
		_id_alvos=[_id_alvos]
	}

	for (var ii = 0; ii<array_length(_id_alvos); ii++){
		var _dano_final=_dano_base
		if _extra_effects{_dano_final-=_id_alvos[ii].def}
		var _damage_cor_hp=c_red
		
		if _heal{
			_damage_cor_hp=c_green
			_dano_final=_dano_base
			if _extra_effects{
				//cura não é afetada por tipos
				//efetividade cura
				_dano_final*=obattle_manager.efetividade_cura[id_invoker]
				//efetividade geral
				_dano_final*=obattle_manager.efetividade_geral[id_invoker]
			}
		} else {
			
			if _extra_effects{
				//interação com tipos
				_dano_final*=check_types_inter(ty1,ty2,_id_alvos[ii].ty1,_id_alvos[ii].ty2)
			
				//efetividade em relação a tipos
				if ty1=global.types_list.fire or ty2=global.types_list.fire{
					_dano_final*=obattle_manager.efetividade_fogo[id_invoker]
				}
			
				//efetividade de dano
				_dano_final*=obattle_manager.efetividade_dano[id_invoker]
				//efetividade geral
				_dano_final*=obattle_manager.efetividade_geral[id_invoker]
				//escudo 
				if _id_alvos[ii].shield_charging_attack>0{
					_id_alvos[ii].shield_charging_attack-=round(_dano_final*0.6)//os 60% vai pro escudo
					_dano_final*=0.4 //recebe só 40% do dano
				}
			}
		}
		_dano_final=round(_dano_final)
		_dano_final=clamp(_dano_final,0,9999999999999999)
		_dano_total_em_todos_inimigos+=_dano_final
		
		var _text_dano_final=string(_dano_final)
		msg_show(_text_dano_final,_id_alvos[ii].x,_id_alvos[ii].y,_damage_cor_hp)
		if _heal{_id_alvos[ii].hp+=_dano_final} else {
		_id_alvos[ii].hp-=_dano_final
		_id_alvos[ii].tremor_power=10
		obattle_manager.deses+=5
		}
		
		
	}
	
	return _dano_total_em_todos_inimigos
	
}

function damage_char(_id_chars, _orange_bullet=0, _dano_base=dano_base, _extra_effects=1, _heal=0){ //id_chars tem numeros (0,1 ou 2) das posições de devem ser atingidas (Usado exclusivamente para um enemy atacar um char)
	//o _extra_effects diz que vai levar em conta coisas como def, tipos, efetividade ou escudo se não, ele ignora tudo isso
	if !is_array(_id_chars){
		_id_chars=[_id_chars]
	}
	
	for (var ii = 0; ii<array_length(_id_chars); ii++){
		var _dano_final=_dano_base
		if _extra_effects{_dano_final-=obattle_manager.def[_id_chars[ii]]}
		var _damage_cor_hp=c_red
		
		//não tem efetividade
		
		if _heal{
			_damage_cor_hp=c_green
			_dano_final=_dano_base
			if _extra_effects{
				//aqui fica coisa tipo, o alvo tá com tal charme e o atque é de tal tipo, então multi o dano por tal coisa
			}
			
		} else {
			if _extra_effects{
				_dano_final*=check_types_inter(ty1,ty2,obattle_manager.ty1[_id_chars[ii]],obattle_manager.ty2[_id_chars[ii]])
				////aqui fica coisa tipo, o alvo tá com tal charme e o atque é de tal tipo, então multi o dano por tal coisa
				if obattle_manager.spell_evapora_agua_effect and (ty1=global.types_list.agua or ty2=global.types_list.agua){
					_dano_final*=0.5
				}
				////
				
				//Quanto mais danificado o escudo, mais fraco o ataque
				_dano_final*=(id_invoker.shield_charging_attack/round(id_invoker.mhp*0.1)) //vida do escudo/vida max do escudo (10% HP total)
				//Por fim, checa se foi parriado
				successful_orange_parry=0
				successful_parry=0
				if parrying{
					if _orange_bullet{
						_dano_final=0 //Se dar parry em uma bala laranja não toma dano
						successful_orange_parry=1
					} else {
						_dano_final*=0.6 //tira 40% do dano
					}
					
					instance_create_depth(id_invoker.x,id_invoker.y,depth-10,oparry_show)
					successful_parry=1
				} else {play_sfx(sfx_battle_blocknotperfect)}
				
			}
		}
		_dano_final=round(_dano_final)
		_dano_final=clamp(_dano_final,0,9999999999999999)
		
		var _text_dano_final=string(_dano_final)
		msg_show(_text_dano_final,obattle_manager.char_x[_id_chars[ii]],obattle_manager.char_y[_id_chars[ii]],_damage_cor_hp)
		
		if _heal{obattle_manager.hp[_id_chars[ii]]+=_dano_final obattle_manager.deses-=10} else {
			obattle_manager.hp[_id_chars[ii]]-=_dano_final
			obattle_manager.hp[_id_chars[ii]]=clamp(obattle_manager.hp[_id_chars[ii]],-999,obattle_manager.mhp[_id_chars[ii]])
			obattle_manager.deses+=10
		}
	}
	
}

function damage_char_as_char(_id_chars, _dano_base=dano_base, _extra_effects=1, _heal=0){ //id_chars tem numeros (0,1 ou 2) das posições de devem ser atingidas (Usado exclusivamente para um char atacar/curar um char)
	//o _extra_effects diz que vai levar em conta coisas como def, tipos ou efetividade, se não, ele ignora tudo isso
	if !is_array(_id_chars){
		_id_chars=[_id_chars]
	}

	for (var ii = 0; ii<array_length(_id_chars); ii++){
		var _dano_final=_dano_base
		if _extra_effects{_dano_final-=obattle_manager.def[_id_chars[ii]]}
		var _damage_cor_hp=c_red
		
		if _heal{
			_damage_cor_hp=c_green
			_dano_final=_dano_base
			if _extra_effects{
				//cura não é afetada por tipos
				//efetividade cura
				_dano_final*=obattle_manager.efetividade_cura[id_invoker]
				//efetividade geral
				_dano_final*=obattle_manager.efetividade_geral[id_invoker]
			}
			
		} else {
			if _extra_effects{
				_dano_final*=check_types_inter(ty1,ty2,obattle_manager.ty1[_id_chars[ii]],obattle_manager.ty2[_id_chars[ii]])
				//efetividade em relação a tipos
				if ty1=global.types_list.fire or ty2=global.types_list.fire{
					_dano_final*=obattle_manager.efetividade_fogo[id_invoker]
				}
			
				//efetividade de dano
				_dano_final*=obattle_manager.efetividade_dano[id_invoker]
				//efetividade geral
				_dano_final*=obattle_manager.efetividade_geral[id_invoker]
			}
		}
		_dano_final=round(_dano_final)
		_dano_final=clamp(_dano_final,0,9999999999999999)
		
		var _text_dano_final=string(_dano_final)
		msg_show(_text_dano_final,obattle_manager.char_x[_id_chars[ii]],obattle_manager.char_y[_id_chars[ii]],_damage_cor_hp)
		
		if _heal{obattle_manager.hp[_id_chars[ii]]+=_dano_final obattle_manager.deses-=10} else {
			obattle_manager.hp[_id_chars[ii]]-=_dano_final
			obattle_manager.hp[_id_chars[ii]]=clamp(obattle_manager.hp[_id_chars[ii]],-999,obattle_manager.mhp[_id_chars[ii]])
			obattle_manager.deses+=10
		}
	}
	
}

function end_battle(){
	change_info_text(,1)
	layer_destroy(layer_id_bg)
	layer_destroy(layer_id_not_bg)
	layer_destroy(layer_id_b)
	if number_bg=4{
	layer_destroy(layer_id_bg2)
	layer_destroy(layer_id_not_bg2)
	}
	instance_destroy(oenemy_anim_die)
	global.exp+=exp_gain_total+999
	
	global.can_move=true
	global.battle_mode=0
	set_song_ingame(_music_playing,30,30,_time_music)
	
	instance_destroy()
}

function spell_add(_spell, _to_who){
	//global.spells_classes[id_number][class][i] personagem/classe/especifica
	if !array_contains(global.spells[_to_who],_spell){ //evitar repetição de magia
		array_push(global.spells_classes[_to_who][_spell.class],_spell)
		array_push(global.spells[_to_who],_spell)
	}
}

function charm_add(_charm){
	if !array_contains(global.charms_inv_total,_charm){ //evitar repetição de charm
		array_push(global.charms_inv_total,_charm)
		array_push(global.charms_inv,_charm)
	}
}

