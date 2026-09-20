if ativado{
	image_alpha=1
} else {
	image_alpha=0.5
}

if !global.battle_mode{
	if respawn>0 and not place_meeting(x,y,oPlayer){respawn--}
}

ativado= (respawn<=0)