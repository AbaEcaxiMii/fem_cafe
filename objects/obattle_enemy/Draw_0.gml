
blink_hit_draw()
if charging_attack_phase{
draw_enemy_sinal(cooldown_atacar,mcooldown_atacar,shield_charging_attack,round(mhp*0.1),is_orange_attack(next_attack))
}

if global.debug_mode{
	var _text=$"C:{cooldown_atacar}/{mcooldown_atacar}({cooldown_atacar/mcooldown_atacar})"
	draw_text_outline(x-10,y-30,_text)
	draw_text(x-10,y-30,_text)
	_text="HP"+string(hp)+"/"+string(mhp)
	draw_text_outline(x-10,y-20,_text)
	draw_text(x-10,y-20,_text)
	_text=string(name)+"(row:"+string(enemy_row)+"/"+string(debug_not_empty_rows)+")"
	draw_text_outline(x-10,y-10,_text)
	draw_text(x-10,y-10,_text)
}

