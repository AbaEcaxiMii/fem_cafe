//nota: o w é 320 e h é 240

camera_set_view_size(view_camera[0],global.view_width,global.view_height)
if(instance_exists(view_target)){
	var x1= view_target.x - global.view_width/2
	var y1= view_target.y - global.view_height/2
	
	x1=clamp(x1,0,room_width - global.view_width)
	y1=clamp(y1,0,room_height - global.view_height)
	
	if shake_length!=0{
	x1+= random_range(-shake_length,shake_length)
	y1+= random_range(-shake_length,shake_length)
	
	}
	
	var _cx=camera_get_view_x(view_camera[0]) var _cy=camera_get_view_y(view_camera[0])
	var _nx=lerp(_cx, x1,_lerp_spd) var _ny=lerp(_cy, y1,_lerp_spd)
	
	camera_set_view_pos(view_camera[0],_nx,_ny)
}