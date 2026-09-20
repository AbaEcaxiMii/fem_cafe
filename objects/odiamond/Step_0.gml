image_alpha+=0.1
vel+=acceleration
vel=clamp(vel,0,vel_max)
image_alpha=clamp(image_alpha,0,1)
var _vel=vel
if !acima{_vel=-_vel}
y+=_vel
if y<-20 or y>(room_height+20){instance_destroy()}
if place_meeting(x,y,oheart){
	with oenemy_attack_performer{
		alvo_char=choose_battle_alvo()
		damage_char(alvo_char, other.orange_bullet)
	}
	instance_destroy()
}