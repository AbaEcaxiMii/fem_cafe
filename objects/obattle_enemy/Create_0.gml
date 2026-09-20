//depois fazer com que eles mudem se lugar caso tenha menos pessoas na fileira, mas ficam com o msm espaço entre
blink_hit_create()
depth=obattle_manager.depth-50
name=enemy_identity.name
mhp=enemy_identity.mhp
hp=mhp
atk=enemy_identity.atk
def=enemy_identity.def
spd=enemy_identity.spd
ty1=enemy_identity.ty1
ty2=enemy_identity.ty2
id_number=enemy_identity.id_number
exp_reward=enemy_identity.exp_reward

mcooldown_atacar=100
var _extra_time=irandom(30*10) //até 10 segundos extra
cooldown_atacar=mcooldown_atacar+_extra_time
//coloca um pouco mais de tempo pois tá indo para a fase 0 onde o medidor não aparece, para inimigos da mesma especie não forem para a fase 1 ao mesmo tempo adiciona esse tempo
attack_finished=0 //se acabou de terminar seu ataque
execute_funny_text=0
debug_not_empty_rows=0

movimentacao_imediata=1 //quando o inimigo deve se localizar inicialmente, assim que nasce
alvo_char=0 //qual o alvo do seu ataque

tremor_power=0
tremor_dir=0
tremor_spd=1

next_attack=0

charging_attack_phase=0 //0 não mostra o progresso, quando termina vai pra fase 1; 1 mostra o progresso, quando termina ataca
shield_charging_attack=0

idle_sprite=sb_echidna
hurt_sprite=sb_echidna_hurt
dying_sprite=sb_echidna_die

/////////////funções genericas
movimentacao=function(){
	//ficar na posição comum
	var _f = function(_element, _index)
	{
		return (_element = id);
	}
	var _sep_row_x=camera_get_view_width(view_camera[0])/(array_length(obattle_manager.row_entities[enemy_row])+1)
	var _pos_in_row=array_find_index(obattle_manager.row_entities[enemy_row],_f)
	var _not_empty_rows=0
	for (var ii = 0; ii<enemy_row; ii++){
		if array_length(obattle_manager.row_entities[ii])>0{_not_empty_rows++}
	}
//	x=lerp()
	var _target_x=(camera_get_view_x(view_camera[0])+_sep_row_x*(_pos_in_row+1))+10*(_not_empty_rows)
	var _target_y=obattle_manager.row_y[enemy_row]
	
	if movimentacao_imediata{
		x=_target_x
		y=_target_y
		movimentacao_imediata=0
	} else {
		x=lerp(x,_target_x,0.1)
		y=lerp(y,_target_y,0.1)
		
	}
	
	debug_not_empty_rows=_not_empty_rows
	
	//tremor de dano
	if tremor_power>0{
		x=_target_x+(tremor_dir*tremor_power)

		tremor_dir+=tremor_spd
		if tremor_dir=1 or tremor_dir=-1{tremor_spd*=-1 tremor_power-=0.5 tremor_power=clamp(tremor_power,0,99)}
	}
}

choose_next_attack=function(){
	next_attack=0
}

ready_to_attack=function(){
	invocar_atk_enemy(next_attack)
}

funny_text=function(){ //texto que aparece na caixa quando ninguem tá selecionado ou atacando (flavor text)
	if execute_funny_text{ //o obattle_manager vai diz se deve usar o seu flavor text
		execute_funny_text=0
		change_info_text("tb_generic_flavor", 0, name)
	}
}

hp_manager=function(){
	hp=clamp(hp,-999,mhp)
	if obattle_manager.battle_state=0 and hp<=0{
		instance_destroy()
	}
}

animation_manager=function(){
	if tremor_power>0 or hp<=0{sprite_index=hurt_sprite} else {sprite_index=idle_sprite}
}
//////////////trocar as sequencias genericas por outras dependendo do inimigo
switch(id_number){
	case 1:
		choose_next_attack=function(){next_attack=1}
	break

	case 2:
		idle_sprite=sb_froggit
		hurt_sprite=sb_froggit_hurt
		dying_sprite=hurt_sprite
		choose_next_attack=function(){next_attack=4}
	break
	
	case 3:
		idle_sprite=sb_blocker
		hurt_sprite=sb_blocker_hurt
		dying_sprite=sb_blocker_die
		choose_next_attack=function(){next_attack=2}
	break
}

choose_next_attack()