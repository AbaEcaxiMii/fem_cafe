//da para alterar funções a mais para situações especificas
hp_manager()
animation_manager()
blink_hit_step()
movimentacao()
funny_text()

if attack_finished{
	var _extra_time=irandom(30*10) //até 10 segundos extra
	cooldown_atacar=mcooldown_atacar+_extra_time
	shield_charging_attack=0
	attack_finished=0
	choose_next_attack()
	}
//coloca um pouco mais de tempo pois tá indo para a fase 0 onde o medidor não aparece, para inimigos da mesma especie não forem para a fase 1 ao mesmo tempo adiciona esse tempo
if cooldown_atacar>0 and obattle_manager.battle_state=0{
	cooldown_atacar-=spd
	if charging_attack_phase and shield_charging_attack<=0{ //se o escudo for quebrado o ataque é cancelado
		charging_attack_phase=!charging_attack_phase
		shield_charging_attack=0
		var _extra_time=irandom(30*10) //até 10 segundos extra
		//aumentar se for counterado
		cooldown_atacar=mcooldown_atacar+_extra_time
	}
}
if cooldown_atacar<=0 and obattle_manager.battle_state=0 and obattle_manager.intervalo_btw_attacks=0{
	if charging_attack_phase{ready_to_attack()} else {cooldown_atacar=mcooldown_atacar shield_charging_attack=round(mhp*0.1)} //escudo tem 10% da vida do inimigo
	charging_attack_phase=!charging_attack_phase
}


