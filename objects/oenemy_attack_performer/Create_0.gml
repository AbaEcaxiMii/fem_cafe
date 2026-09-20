depth=obattle_manager.depth-100
depth_bullet=obattle_manager.depth-60
alvo_char=array_create(0)

parrying=0 //está esperando por um ataque para dar parry
parry_duration_max=10
parry_duration=parry_duration_max //quanto tempo o parrying dura
parry_cooldown=0 //intervalo de tempo entre parrys
parry_cooldown_max=20
successful_parry=0 //conseguiu parriar um ataque
successful_orange_parry=0 //conseguiu parriar um ataque laranja
orange_attack=0
super_parry=0
counter_activation=0

//tem que manualmente colocar o tipo dos ataques inimigos
ty1=global.types_list.normal
ty2=global.types_list.normal
alvo_char=choose_battle_alvo()
dano_base=id_invoker.atk
play_sfx(enemy_attack) //avisa que o ataque cmc
switch (id_attack){
	case 0:		
		timer=0
		mtimer=30*2 //5 segundos
	break
	
    case 1:
		anim_sprite = sarranhao
		anim_frame = 0
		anim_speed = 10/30//anim_speed = (FPS da animação desejada) / (FPS do jogo)
		anim_total = sprite_get_number(anim_sprite);
		anim_playing = true
		evento_aplicado = false
		
	break

	case 2:
		anim_timer=0
		anim_timer_max=25
		anim_progress=0
		anim_state=1 //cmc na etapa 1 para dar um tempinho pro player se preparar
		
		anim_sprite = sluva_blocker
		anim_size=0
		anim_rot=0
		anim_alpha=1
		
		tentativas=3
		
		first_time=1
	
	break
	
	case 3:
		//timer=30*2
		cooldown_max=10
		cooldown=cooldown_max
		orange_attack=1
		
		instance_create_depth(x,y,depth,obox_spawn,{id_box: 3})
	break
	
	case 4:
		//timer=30*2
		cooldown_max=10
		cooldown=cooldown_max
		orange_attack=1
		freedom_box_cooldown=30*4
		
		instance_create_depth(x,y,depth,obox_spawn,{id_box: 0})
	break
}