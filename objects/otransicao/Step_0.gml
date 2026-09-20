//se livrar da transição
var _vel
if fase{_vel= -vel} else {_vel= vel}
image_alpha= clamp(image_alpha + _vel,0,1)
if image_alpha=1{
	room_goto(target_rm)
	oPlayer.x = target_x
	oPlayer.y = target_y
	if target_dir>-1{player_dir_warp(target_dir)}
	global.can_move=1
	fase=1
}
	
if room = target_rm and image_alpha=0{
	instance_destroy()
}