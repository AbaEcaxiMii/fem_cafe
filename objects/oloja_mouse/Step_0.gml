global.can_move=0
right_key = keyboard_check(global.right)
left_key = keyboard_check(global.left)
up_key = keyboard_check(global.up)
down_key = keyboard_check(global.down)
var _move_x=(right_key - left_key)
var _move_y=(down_key-up_key)
xspd=_move_x*move_spd
yspd=_move_y*move_spd
if mouse_can_move{
	if cooldown_after_free_move--<=0{
	x += xspd
	y += yspd
	}
} else {cooldown_after_free_move=cooldown_after_free_move_ini}
cooldown_after_free_move=clamp(cooldown_after_free_move,0,99)
if keyboard_check(ord("Q")){instance_destroy()}