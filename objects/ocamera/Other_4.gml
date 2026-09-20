view_enabled= true
view_visible[0]= true

if(instance_exists(view_target)){
	var x1= view_target.x - global.view_width/2
	var y1= view_target.y - global.view_height/2
	
	x1=clamp(x1,0,room_width - global.view_width)
	y1=clamp(y1,0,room_height - global.view_height)
	
	camera_set_view_pos(view_camera[0],x1,y1)
}