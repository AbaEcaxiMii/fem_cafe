
//nota: spd dos inimigos diz quem vai agir primeiro na batalha

//item_type 0=item comer 1=equipamento 2=key_itens 3=sell_itens
function create_item(_name, _namep, _desc, _spr, _hp, _effect,_price,_item_type=0) constructor
	{
		name= _name
		namep= _namep
		desc= _desc
		spr= _spr
		hp= _hp
		effect= _effect
		price= _price
		item_type= _item_type
	}

function create_equip(_name, _namep, _desc, _spr, _mhp, _res, _atk, _atke, _def, _price, _spd=0, _ten_level=0, _wora=0 ,_port=[0,1,2,3,4], _effect= function(){}, _rev_effect= function(){},_item_type=1) constructor
	{
		name= _name
		namep= _namep
		desc= _desc
		spr= _spr
		mhp= _mhp
		res= _res
		atk= _atk
		atke= _atke
		def= _def
		spd= _spd
		ten_level= _ten_level
		price= _price
		//quem pode usar(portar)
		port= _port
		//Weapon(1) or Armor(0), Weapon que muda mecanica(main)(2)
		wora= _wora
		//ativar algum efeito
		effect= _effect
		//desativar o efeito
		rev_effect= _rev_effect
		item_type= _item_type
	}

function food_default(_food, _alvo) constructor
{
	food= _food
	if global.battle_mode{
		if _alvo.hp >= 1{
		_alvo.hp +=_food.hp
		msg_show(_food.hp,oatkc_item_use.x,oatkc_item_use.y,c_green)
		array_delete(oitem_manager.inv,oatkc_item_use.pos_item,1)
		instance_destroy(oatkc_item_use)
		} else {msg_show("Não consegue usar",oatkc_item_use.x,oatkc_item_use.y,c_dkgray)}
	} else {
		oParty_manager.party_members[_alvo].hp+=_food.hp
		array_delete(oitem_manager.inv,oMenu_item.pos_item,1)
	}
	audio_play_sound(Heal,100,false)
}

global.item_list=
{
		
		default_food: new create_item(
			"Nome",
			"Nome",
			"Descrição",
			s_item_default,
			1,
			function(_alvo)
			{
				new food_default(global.item_list.default_food, _alvo)
			},
			1
			),
			
		paco: new create_item(
			"Paçoca",
			"Paçoca",
			"Seu aspecto seco realça o sabor",
			s_item_pacoca,
			10,
			function(_alvo)
			{
				if global.battle_mode{
					if _alvo.hp >= 1{
				_alvo.hp +=global.item_list.paco.hp
				msg_show(global.item_list.paco.hp,oatkc_item_use.x,oatkc_item_use.y,c_green)
				array_delete(oitem_manager.inv,oatkc_item_use.pos_item,1)
				array_insert(oitem_manager.inv,oatkc_item_use.pos_item,global.item_list.paco2)
				instance_destroy(oatkc_item_use)
					} else {msg_show("Não consegue usar",oatkc_item_use.x,oatkc_item_use.y,c_dkgray)}
				} else {
					oParty_manager.party_members[_alvo].hp+=global.item_list.paco.hp
				array_delete(oitem_manager.inv,oMenu_item.pos_item,1)
				array_insert(oitem_manager.inv,oMenu_item.pos_item,global.item_list.paco2)
				}
				audio_play_sound(Heal,100,false)
			},
			10
			),
			
		paco2: new create_item(
			"Paçoca mastigada",
			"Paço.Mas.",
			"Seu aspecto seco AINDA realça o sabor remaneceste",
			s_item_pacoca2,
			2,
		function(_alvo)
			{
				new food_default(global.item_list.paco2, _alvo)
			},
			2
			),
		
		banana: new create_item(
			"Banana",
			"Banana",
			"Mesmo velha, o potássio continua fluindo em suas veias, quer dizer, miolo, frutas não tem veias",
			s_item_banana,
			8,
			function(_alvo)
			{
				new food_default(global.item_list.banana, _alvo)
			},
			6
			),
			
		esto_ave: new create_item(
			"Estômago de avestruz",
			"Estô.Av.",
			"(Uh... você não planeja realmente comer isso, né?)",
			s_item_esto_ave,
			2,
			function(_alvo)
			{
				new food_default(global.item_list.esto_ave, _alvo)
			},
			1
			),
			
		feijao: new create_item(
			"Feijoada",
			"Feijo.",
			"Comida tipica brasileira, é otima para robos pelo alto nível de ferro",
			s_item_feijao,
			30,
			function(_alvo)
			{
				new food_default(global.item_list.feijao, _alvo)
			},
			15
			),
			
		cafe_puro: new create_item(
			"Café 500g",
			"Café",
			"Supostamente você deveria colocar em agua quente, mas ele dá mais energia puro mesmo. Vamos! não seja frescoca",
			s_item_cafe_puro,
			12,
			function(_alvo)
			{
				if global.battle_mode{
					if _alvo.hp >= 1{
				_alvo.hp +=global.item_list.cafe_puro.hp
				_alvo.fo_points +=50
				msg_show(global.item_list.cafe_puro.hp,oatkc_item_use.x,oatkc_item_use.y,c_green)
				array_delete(oitem_manager.inv,oatkc_item_use.pos_item,1)
				instance_destroy(oatkc_item_use)
				} else {msg_show("Não consegue usar",oatkc_item_use.x,oatkc_item_use.y,c_dkgray)}
				} else {
				oParty_manager.party_members[_alvo].hp+=global.item_list.cafe_puro.hp
				global.energia +=50
				array_delete(oitem_manager.inv,oMenu_item.pos_item,1)
				}
				audio_play_sound(Heal,100,false)
			},
			6
			),
			
			pecav: new create_item(
			"Peça de metal","",
			"Peça de metal, muito comum em Nera",
			s_item_pacoca,
			0,0,
			56,3
			),
			
			gosmav: new create_item(
			"Gosma incolor","",
			"Viscosa e transparente",
			s_item_esto_ave,
			0,0,
			24,3
			),
			
			galhov: new create_item(
			"Galho robusto","",
			"É uma poderosa arma na mão de pequenos guerreiros",
			sequip_esp_def,
			0,0,
			70,3
			),
			
			chave: new create_item(
			"Chave","",
			"Uma chave para abrir uma porta",
			skitem_chave,
			0,function(){},0,
			2
			),
		
			cartao: new create_item(
			"Cartão de acesso","",
			"Usado para abrir diversas por- a que saber? vc já sabe oq faz eu não preciso ficar explicando tudo",
			scartaoacesso1,
			0,function(){},0,
			2
			),
			
			blonotas: new create_item(
			"Bloco de notas","",
			"Um conjunto de informações sobre o sistema de batalha",
			scartaoacesso1,
			0,function(){
				create_textbox("bloconotas")
				instance_destroy(oMenu)
				instance_destroy(oother_menus)
				},0,
			2
			),

}

global.equip_list=
{
	main_def: new create_equip(
	"Main comum",
	"Main C",
	"Arma principal, ela não muda status, só mecanicas",
	sequip_main_def,
	10,
	0,
	0,
	0,
	0,
	20,
	0,
	0,
	2,
	),
	
	esp_def: new create_equip(
	"Espada comum",
	"Esp. C",
	"Uma espada comum, para um item de default",
	sequip_esp_def,
	0,
	0,
	5,
	1,
	0,
	16,
	0,
	0,
	1,
	),
	
	arm_def: new create_equip(
	"Armadura comum",
	"Arm. C",
	"Uma armadura comum, para um item de default",
	sequip_arm_def,
	0,
	8,
	0,
	0,
	5,
	7
	),
	
	arm_def2: new create_equip(
	"Armadura outra",
	"Arm. outra",
	"outra armadura, diferenciar",
	sequip_arm_def,
	0,
	13,
	0,
	0,
	2,
	12
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
	0,
	0,
	2,
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
	0,
	0,
	1,
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
	0,
	0,
	0,
	),
	
}

function msg_show(_msg, _x=x, _y=y, _c=c_white, _m=0, _tm=0){
var _instt=instance_create_depth(_x,_y,-999999,onumber_show,{msg: _msg, c: _c, type_msg: _tm})
_instt.mode=_m
}

function start_status_enemy(_name, _local_enemy=1){
list_name=_name
name= _name.name
hp= _name.hp
mhp= _name.mhp
spd= _name.spd
atk= _name.atk
def= _name.def
res= _name.res
drop= _name.drop
ty1= _name.ty1
ty2= _name.ty2
dmg=0
cooldown_dano=res
if _local_enemy{local_enemy() hibernation_mode=1} //modo que eles nascem, se posicionam, mas não fazer nada e ficam invisiveis para a intro, quando a batalha cmc eles voltam ao normal
hit=0

my_turn=0
type_atk=0
enemy_multi_alpha=0
tar_enemy_multi_alpha=1
no_alpha_special=0 //quando precisa que o inimigo fique invisivel msm não sendo seu turno
cool_clone_dead=0

omitido_durante_intro_battle=0 //para enemy_over ou oenconter é ativada durante a intro da batalha, desliga o draw_self para só ter obentry_enemy na tela

}

function oenemy_over_draw_self(){
	if omitido_durante_intro_battle=0{draw_self()}
}

function blink_hit_create()
{
blend_alpha=0
blend_color= c_white
piscando=false
blend_fase=1
piscando_timer= 0.1
}

function blink_hit_step(_alvo=oatkc_attack)
{
	var _inst = instance_place(x,y,_alvo) var _permission=1
	if _alvo=oatkc_attack {if (_inst != noone) and global.can_select and _inst.destacar{_permission=1} else {_permission=0}}
	if (_inst != noone) and _permission {piscando=true} else {piscando=false}
	
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

function blink_hit_draw(_sprite=sprite_index,_image_index=image_index,_x=x,_y=y,_xs=image_xscale,_ys=image_yscale,_angle=image_angle,_color=image_blend,_alpha=image_alpha,_need_draw_self=0)
{
	if _need_draw_self {draw_sprite_ext(_sprite,_image_index,_x,_y,_xs,_ys,_angle,_color,_alpha)}  ///draw_self()
	if blend_alpha>0{
		gpu_set_fog(true,blend_color,0,0)
		draw_sprite_ext(_sprite,_image_index,_x,_y,_xs,_ys,_angle,_color,blend_alpha)
		gpu_set_fog(false,blend_color,0,0)
	}
}

function line_max_draw(){
	var _lined=distance_to_point(user.char_id.x,user.char_id.y)
	xline=lerp(xline,act_list.xmax,0.2)
	yline=lerp(yline,act_list.ymax,0.2)
	
	if ceil(xline)=act_list.xmax and ceil(yline)=act_list.ymax{alpha_line=lerp(alpha_line,0,0.05)}
	
draw_set_alpha(alpha_line)

draw_set_colour(c_yellow)
//draw_rectangle(user.char_id.x-act_list.xmax,user.char_id.y-act_list.ymax,user.char_id.x+act_list.xmax,user.char_id.y+act_list.ymax,true)

draw_rectangle(user.char_id.x-xline,user.char_id.y-yline,user.char_id.x+xline,user.char_id.y+yline,true)

draw_set_colour(c_fuchsia)

draw_rectangle(user.char_id.x-(xline-1),user.char_id.y-(yline-1),user.char_id.x+(xline-1),user.char_id.y+(yline-1),true)
draw_rectangle(user.char_id.x-(xline-2),user.char_id.y-(yline-2),user.char_id.x+(xline-2),user.char_id.y+(yline-2),true)
draw_rectangle(user.char_id.x-(xline-3),user.char_id.y-(yline-3),user.char_id.x+(xline-3),user.char_id.y+(yline-3),true)
draw_rectangle(user.char_id.x-(xline-4),user.char_id.y-(yline-4),user.char_id.x+(xline-4),user.char_id.y+(yline-4),true)

draw_set_colour(c_yellow)

draw_rectangle(user.char_id.x-(xline-5),user.char_id.y-(yline-5),user.char_id.x+(xline-5),user.char_id.y+(yline-5),true)

//resetar pro normal
draw_set_colour(c_white)
draw_set_alpha(1)

}

function line_max_step(){
x= clamp(x,user.char_id.x-act_list.xmax,user.char_id.x+act_list.xmax)
y= clamp(y,user.char_id.y-act_list.ymax,user.char_id.y+act_list.ymax)
}

function line_max_create(){

alpha_line=1
xline=0
yline=0

}

function show_dados_enemys(_show=global.debug_mode){
	if _show=1{
draw_set_halign(fa_center) draw_set_valign(fa_middle)
var _a=c_black
draw_text_ext_color(x,y-30,string(name) +"/HP:"+string(hp)+"/RHP:"+string(hp-dmg)+"/H:"+string(hit),10,10,_a,_a,_a,_a,1)}
draw_set_halign(fa_left)
draw_set_valign(fa_top)
}

function losing_hp(){
if res>0{
		if dmg>0{
	if cooldown_dano--<0{
		hp -= 1 dmg -= 1 cooldown_dano=res
	}}
} else { hp-=dmg dmg=0}
cooldown_dano=clamp(cooldown_dano,-1,999)
}

function check_types_inter(_type1, _type2, _enemy_type1, _enemy_type2){
	var _multi=1
	for(var i=0;i<array_length(_type1.van);i++){
		if _type1.van[i]=_enemy_type1.num{_multi*=2}
	}
	
	for(var i=0;i<array_length(_type1.van);i++){
		if _type1.van[i]=_enemy_type2.num{_multi*=2}
	}
	
	for(var i=0;i<array_length(_type1.des);i++){
		if _type1.des[i]=_enemy_type1.num{_multi/=2}
	}
	
	for(var i=0;i<array_length(_type1.des);i++){
		if _type1.des[i]=_enemy_type2.num{_multi/=2}
	}
	/////
	
	for(var i=0;i<array_length(_type2.van);i++){
		if _type2.van[i]=_enemy_type1.num{_multi*=2}
	}
	
	for(var i=0;i<array_length(_type2.van);i++){
		if _type2.van[i]=_enemy_type2.num{_multi*=2}
	}
	
	for(var i=0;i<array_length(_type2.des);i++){
		if _type2.des[i]=_enemy_type1.num{_multi/=2}
	}
	
	for(var i=0;i<array_length(_type2.des);i++){
		if _type2.des[i]=_enemy_type2.num{_multi/=2}
	}
	
	return _multi
}

//dá dano em algo
function hurt_foe(_id_alvo,_dano,_igres=0){
	var _can=1
	if _igres=0{
		if _id_alvo.object_index=oParty_manager{
			if global.podedano{_id_alvo.dmg += _dano global.podedano=0} else {_can=0}
		} else {_id_alvo.dmg += _dano}
		if _id_alvo.object_index=oParty_manager{global.podedano=0}
	} else if _igres=1 {
		if _id_alvo.object_index=oParty_manager{oParty_manager.party_members[0].hp -= _dano} else {_id_alvo.hp -= _dano}
	}
	return _can
	
}

//dá dano em algo, mas leva em consideração extra

function hurt_foe_ext(_id_alvo, _dano_bruto, _igrato=!global.rato_on_party, _type1=global.types_list.normal,_type2=global.types_list.normal, _igdef=0,_igcrit=0, _igres=0){
	var _inst=_id_alvo
	
	var _crit=1 var _rat_crit=0
	if irandom_range(0,100)<=5 and _igcrit=0{_crit=2} //checa se vai ter critico
	if irandom_range(0,100)<=15 and _igrato=0 and _inst.object_index!=oUIbattle{_rat_crit=1} //checa se vai ter rato
	var _dano_total= ((_dano_bruto + irandom_range(0,2))*_crit)
	_dano_total+= (_dano_total*0.25)*_rat_crit
	
	if !_igdef{_dano_total-= _inst.def} //diminui o dano pela defesa
	
	_dano_total*=check_types_inter(_type1,_type2, _inst.ty1, _inst.ty2) // multiplica o dano pelas van e des
	
	if _dano_total <0 {_dano_total=0} _dano_total=round(_dano_total) //da no minimo de 0 e arredonda o dano para um inteiro
	
	if !hurt_foe(_inst,_dano_total,_igres){_dano_total=0} //se alvo oParty_manager e podedano=0 o dano é anulado
		
	if _inst.object_index=oUIbattle{
	_inst.ten_points += _dano_total/3
	_inst.hit += 1
	}
	
	var _sai_effects=_inst var _sfx=attack_hit //dano no over
	if object_get_parent(_inst.object_index)=obe_enemy{_sfx=bash} //membro batendo no inimigo
	if _inst.object_index=oUIbattle{_sfx=enemy_hit} //inimigo batendo no membro
	
	if _inst.object_index=oUIbattle{_sai_effects=_inst.char_id}
	if _inst.object_index=oParty_manager{_sai_effects=oPlayer}
	
	msg_show(_dano_total,_sai_effects.x,_sai_effects.y,c_red,1)
	if _crit>1{
		var _id=instance_create_depth(0,0,0,ohitstop)
		_id.time=4
		msg_show("CRASH!!!",_sai_effects.x,_sai_effects.y,c_orange,2) audio_play_sound(smaaaash,75,false)
		}
	if _rat_crit=1{audio_play_sound(Heal,70,false,4,0,1) msg_show(sratoside,_sai_effects.x,_sai_effects.y,c_white,0,1)}
	
	audio_play_sound(_sfx,80,false)
}

//Nota: o hurt foe w foe ext, o _id_alvo precisa ser o objeto que realmente vai tomar dano (oUIbattle, oPlayer)

//dá dano se estiver tocando o alvo, leva em consideração extra

function hurt_foe_touch(_alvo, _dano_bruto=atk, _igrato=!global.rato_on_party, _type1=ty1,_type2=ty2, _igdef=0, _igcrit=0, _igres=0){
	var _acertou=0
	var _inst = instance_place(x,y,_alvo)
if (_inst != noone)
{
	var _hitList= ds_list_create()
	var _hitCount=instance_place_list(x,y,_alvo,_hitList,false)
	var _lenght= ds_list_size(_hitList)

	for(var i=0;i<_hitCount;i++)
	{
		
	var _inst = ds_list_find_value(_hitList,i)
	var _check1=1 var _check2=1
	if _alvo.object_index=oPlayer or _alvo=omplayer_dummy{if global.podedano=0{_check2=0}}
	if _check1 and _check2{
		if _alvo.object_index=ochar_card or _alvo=omplayer_dummy {_inst= _inst.card_id}
		if _alvo.object_index=oPlayerc or _alvo.object_index=oPlayer {_inst= oParty_manager}
		hurt_foe_ext(_inst,_dano_bruto,_igrato,_type1,_type2,_igdef,_igcrit,_igres)
		
		///Avisar pro inimigo que levou hit
		if _alvo=obe_enemy or _alvo=oenemy_overworld {
			_inst.hit=1
		}
		///
		
		///
		
		
	}
	
	}
	_acertou=1
	ds_list_destroy(_hitList)

}

//notificar pro battlhe manager que omplayer_dummy recebeu dano
if _acertou{
	
	if _alvo=omplayer_dummy{
	if irandom_range(0,100)<=20{ obattle_manager.chance_swap_alvo=1}
	global.podedano=0
	} 
	
	}
//


return _acertou


}

function choose_alvo(){
	
	var _alvo var _array_possible_alvos=array_create(0)
	//decide quais membros da linha de frente são candidados a alvo
	for(var i=0;i<array_length(obattle_manager.ativo_party_ids);i++){
		var _inst=obattle_manager.ativo_party_ids[i]
		var _taunt=0
		if _inst.hp>0 and _inst.nothing=0{
				do{
				array_push(_array_possible_alvos,_inst)
				_taunt++
				} until _taunt=_inst.taunt
			}
	}
	
	//decide qual membro vai ser o alvo
	var _alvo= _array_possible_alvos[irandom(array_length(_array_possible_alvos)-1)]
	
	global.alvo_bat=_alvo
	
	return global.alvo_bat
}

function local_enemy(){
	do{
		var _x_local_enemy =irandom_range(global.barrier_x[0],global.barrier_x[1])
		var _y_local_enemy =irandom_range(global.barrier_y[0],global.barrier_y[1])
		}
	until not place_meeting(_x_local_enemy,_y_local_enemy,obe_enemy)
	x=_x_local_enemy
	y=_y_local_enemy
}

function card_position(_position,_xy){
	switch(_position){
		
	case 0:
	switch(_xy){
	case 0:
	return camera_get_view_x(view_camera[0])+50
	//40
	break
	case 1:
	return camera_get_view_y(view_camera[0])+camera_get_view_height(view_camera[0])-50
	//200
	break
	}
	break
	
	case 1:
	switch(_xy){
	case 0:
	return camera_get_view_x(view_camera[0])+camera_get_view_width(view_camera[0])-50
	//360
	break
	case 1:
	return camera_get_view_y(view_camera[0])+camera_get_view_height(view_camera[0])-50
	//180
	break
	}
	break
	
	case 2:
	switch(_xy){
	case 0:
	return camera_get_view_x(view_camera[0])+50
	//40
	break
	case 1:
	return camera_get_view_y(view_camera[0])+50
	//44
	break
	}
	break
	
	case 3:
	switch(_xy){
	case 0:
	return camera_get_view_x(view_camera[0])+camera_get_view_width(view_camera[0])-50
	//360
	break
	case 1:
	return camera_get_view_y(view_camera[0])+50
	//44
	break
	}
	break
	
	case 4:
	switch(_xy){
	case 0:
	return card_position(0,0)-120
	//-120
	break
	case 1:
	return card_position(0,1)
	break
	}
	break
	
	case 5:
	switch(_xy){
	case 0:
	return card_position(1,0)+120
	//120
	break
	case 1:
	return card_position(1,1)
	break
	}
	break
	
	case 6:
	switch(_xy){
	case 0:
	return card_position(2,0)-120
	//-120
	break
	case 1:
	return card_position(2,1)
	break
	}
	break
	
	case 7:
	switch(_xy){
	case 0:
	return card_position(3,0)+120
	//120
	break
	case 1:
	return card_position(3,1)
	break
	}
	break
}

}

function enemy_die(_drop=drop){
	if hp<1{
	
		if global.battle_mode{
		
			if id=obattle_manager.next_turn{obattle_manager.update_cycle_enemy=1 obattle_manager.amanda=1}
			if id=obattle_manager.now_turn{obattle_manager.update_cycle_enemy=1 obattle_manager.amanda=0}
				if choose(1,0){
					if array_length(_drop)>1{_drop=_drop[irandom_range(0,array_length(_drop)-1)]}
					array_push(obattle_manager.itens_apos_battle,_drop)
		
					msg_show(_drop.spr,x,y,c_white,0,1)
				}
		}
		audio_play_sound(enemy_death,50,false)
		instance_create_depth(x,y,depth,oclone_effect,{image_xscale: image_xscale, sprite_index: sprite_index, image_blend: c_red})
		instance_destroy()
	}
}

function full_heal(){
	audio_play_sound(Heal,1,false)
	for(var i=0;i<array_length(oParty_manager.playable_members_total);i++){
		oParty_manager.playable_members_total[i].hp=oParty_manager.playable_members_total[i].mhp
		oParty_manager.playable_members_total[i].ten=0
	}
	global.dano=0
	global.energia= 100
	global.hubtrans=120
}

/////////////////////CARDS
function can_change(){
	var _atid=ativo_party_ids[member_selecting]
	if !global.time_stop_bat and global.all_inplace and _atid.imfine {return 1} else {return 0}
}

function can_select_card(){
	if !global.time_stop_bat and ativo_party_ids[member_selecting].hp>0 and change_card_mode=false and
	ativo_party_ids[member_selecting].cool_act>=ativo_party_ids[member_selecting].cool_act_max
	and global.all_inplace and not instance_exists(oatkc_attack) and !global.enemy_attacking
	{return 1} else {return 0}
}

function pros_change_card(){
var _inst_alvo = instance_position(card_position(member_selecting,0),card_position(member_selecting,1),oUIbattle)
var _inst_user = instance_position(card_position(card_want_change,0),card_position(card_want_change,1),oUIbattle)
	var _local_alvo= _inst_alvo.local
	var _local_user= _inst_user.local
	var _id_alvo= _inst_alvo.id
	var _id_user= _inst_user.id
	_inst_alvo.local=_local_user
	_inst_user.local=_local_alvo
	array_delete(ativo_party_ids,_local_user,1)
	array_insert(ativo_party_ids,_local_user,_id_alvo)
	array_delete(ativo_party_ids,_local_alvo,1)
	array_insert(ativo_party_ids,_local_alvo,_id_user)
	
	audio_play_sound(snd_select_ch1,100,false)
	change_card_mode=false card_want_change=-1

}

function bl_numbers(){
var _lower_local = 99
var _bigger_local = 0
for(var i=0;i<array_length(ativo_party_ids);i++){
	if !ativo_party_ids[i].nothing{
	if ativo_party_ids[i].local < _lower_local{
	_lower_local=ativo_party_ids[i].local}
	if ativo_party_ids[i].local > _bigger_local{
	_bigger_local=ativo_party_ids[i].local}
	}
}
lower_local= _lower_local
bigger_local= _bigger_local
}

function keys_card(){
up_key=keyboard_check_pressed(global.up)
down_key=keyboard_check_pressed(global.down)
left_key=keyboard_check_pressed(global.left)
right_key=keyboard_check_pressed(global.right)
accept_key=keyboard_check_pressed(global.confirmar)
cancel_key=keyboard_check_pressed(global.cancelar)
change_key=keyboard_check_pressed(global.super_skip)
def_key=keyboard_check_pressed(global.Botaodash)
}

function desativar_flauta(){
	if tocando_acao_tocar=true and party_member.actions=2{
			tocando_acao_tocar=false
			instance_destroy(inst_tocar)
			inst_tocar=noone
		}
}

function tensao_influencia(){
ten= clamp(ten,0,100)
ten_bar=ten/100
if ten_points>0{ten+=0.05 ten_points-=0.05}
ten -=(0.1*instance_number(oatkc_pas_tocar))
}
	
function cool_pra_act(){
	if cool_act<cool_act_max{cool_act+=spd} cool_act=clamp(cool_act,0,cool_act_max)
	}
	
function card_vida_manager(){
	hp= clamp(hp,-999,mhp)
	if dmg>0{
	if cooldown_dano--<0{
hp -= 1
dmg -= 1
cooldown_dano=res
	}
	}
truehp=hp-dmg
truehp_bar=lerp(truehp_bar,truehp/mhp,0.1)
}
	
function card_fo_manager(){
	fo_points= clamp(fo_points,0,max_fo_points)
	fo_bar=fo_points/max_fo_points
	if hp>0{
		fo_timer_spd+=fo_spd
if fo_timer_spd>=1{fo_timer_spd=0 fo_points+=1}}
}
	
function end_battle(_instant=0){
	if !instance_exists(oencerra_battle) and _instant=0{
	instance_create_depth(x,y,depth-20,oencerra_battle)
	}
	var _ready=0
	if instance_exists(oencerra_battle){ if oencerra_battle.ready=1 {_ready=1}}
	if _instant{_ready=1}
	
	if _ready{
		for(var i=0;i<array_length(obattle_manager.ativo_party_ids);i++){
		if ativo_party_ids[i].hp<0{ativo_party_ids[i].hp=1}
		}
	change_info_text(,1)
	set_duration_fight()
	
	instance_destroy(ofight_manager)
	instance_destroy(owall_om)
	instance_destroy(oBulletBoard)
	
	instance_destroy(oatkc_attack)
	instance_destroy(oatkc_attack_enemy)
	instance_destroy(obe_enemy)
	instance_destroy(onumber_show)
	instance_destroy(obattle_background)
	instance_destroy(omplayer_dummy)
	layer_destroy(_layer_back)
	layer_destroy(_layer_b)
	
	instance_destroy(obattle_manager)
	}
}

function end_turn(){
	audio_play_sound(wow,100,false,1)
	global.enemy_attacking=0
	global.can_select=1
	change_info_text(,3)
	with obattle_manager{
	timer_pass_turn=global.timer_pass_turn_ini
	turn_enemycanatk=0
	update_cycle_enemy=1 amanda=0
	
	}
	
	instance_destroy(oatkc_attack_enemy)
	instance_destroy(owall_om)
	instance_destroy(oBulletBoard)
	instance_destroy(omplayer_dummy)
	
	set_duration_fight()
	
	instance_destroy(ofight_manager)
}

function set_duration_fight(_segundos=6){global.duration_fight=30*_segundos}

function atk_setup(_type){
//0=comum 1=plataformer 2=undertale

if !instance_exists(omplayer_dummy) and !instance_exists(oBulletBoard){
	
	var _depth=obattle_manager.depth
	var _alvo= choose_alvo()

	if _type=0{
		var _llocal= _alvo.local
		if _llocal=1{_llocal=2} else if _llocal=2{_llocal=6} else if _llocal=3{_llocal=8}
			
		instance_create_depth(_alvo.x,_alvo.y,_depth-30,omplayer_pos,{card_id: _alvo.id, pos: _llocal})
			
	} else if _type=1{
		instance_create_depth(meio_w,meio_h,_depth-30,omplayerjump,{card_id: _alvo.id})
	} else if _type=2{
		instance_create_depth(x,y,_depth-25,oBulletBoard,{card_id: _alvo.id})
	}

								}


}

function invocar_atk(_number,_id_invoker=id){
	if !instance_exists(ofight_manager){
	instance_create_depth(x,y,depth,ofight_manager,{number: _number, id_invoker: _id_invoker})
	}
}

function ai_enemys_act(){
	///////////cmc da função
		
		if hibernation_mode=0{
	
	//pode fazer independente de qualquer coisa - gerenciar dados
if id=obattle_manager.now_turn and obattle_manager.turn_enemycanatk{my_turn=1} else {my_turn=0}
blink_hit_step()
enemy_multi_alpha=lerp(enemy_multi_alpha,tar_enemy_multi_alpha,0.3)

//sinaliza que o real hp está abaixo de 0
if enemy_multi_alpha>0 and hp-dmg<0{
cool_clone_dead++
if (cool_clone_dead%8)=0{
	cool_clone_dead=0
	with instance_create_depth(x,y,depth+1,oclone_effect,{sprite_index:sprite_index, image_xscale: image_xscale, image_blend: c_red, image_alpha:enemy_multi_alpha}) {exter=0.05}
		}
} else {cool_clone_dead=0}


all_time()

if global.enemy_can_act{ //tempo n parado e jogador tem controle - preparar ataques ou preparar cutscene

losing_hp()
enemy_die()
no_alpha_special=0
tar_enemy_multi_alpha=1

if my_turn{
	if hp>0{
		change_info_text(,2)
		enemy_can_act()
	} else {end_turn()}
} 


}

if not global.time_stop_bat{ //Quando o tempo NÃO está pausado - andar

///

if id=obattle_manager.now_turn and !global.enemy_attacking {funny_text()}
if hit{hit=0 cons_hitou()}
no_time_stop()

///

} else {time_stop()}

if global.enemy_attacking{
//é o seu turno e você está atacando, ativado no enemy_can_act, o jogador não tem controle e só pode mexer os bonequinhos
//atacar o jogador, se mover durante cutscenes
global.can_select=false
if my_turn and !no_alpha_special{tar_enemy_multi_alpha=0.2} else {tar_enemy_multi_alpha=0}
	attacking()

}
							}
	//////////Fim da função

}

function draw_enemy_sinal(){
	
	if obattle_manager.now_turn=id and !global.enemy_attacking{
	var _xpor=x
	var _ypor=y-(sprite_height/2)-10
	var _porcentimer=(((string(obattle_manager.timer_pass_turn)/string(global.timer_pass_turn_ini))-1)*-1)*7
	draw_sprite_ext(ssinal_enemy,0,_xpor,_ypor,1,1,0,c_white,1)
	draw_sprite_part_ext(ssinal_enemy_branco,0,0,0,7,_porcentimer,_xpor-3,_ypor+4,1,-1,c_white,1)
	}
}

function do_emotion(_emo,_id=id,_delt_add=1){
	var _array=_id.emo_array
	
	if (_emo=5 or _emo=6 or _emo=7 or _emo=8) and _delt_add=1{
		if _emo=5{do_emotion(6,_id,0) do_emotion(7,_id,0) do_emotion(8,_id,0)}
		if _emo=6{do_emotion(5,_id,0) do_emotion(7,_id,0) do_emotion(8,_id,0)}
		if _emo=7{do_emotion(6,_id,0) do_emotion(5,_id,0) do_emotion(8,_id,0)}
		if _emo=8{do_emotion(6,_id,0) do_emotion(7,_id,0) do_emotion(5,_id,0)}
	}
	
	if _delt_add{
		if !array_contains(_array,_emo){array_push(_array,_emo)}
	} else {
		if array_contains(_array,_emo){array_delete(_array,array_get_index(_array,_emo),1)}
	}
}
