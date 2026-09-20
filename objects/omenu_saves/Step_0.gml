up_key=keyboard_check_pressed(global.up)
down_key=keyboard_check_pressed(global.down)
left_key=keyboard_check_pressed(global.left)
right_key=keyboard_check_pressed(global.right)
confirmar_key=keyboard_check_pressed(global.confirmar)
cancelar_key=keyboard_check_pressed(global.cancelar)

if self_destruct{
	atvx=resx
	atvy=resy
	y1_sizet=0
	y2_sizet=0
	if ysl>=resy-1{
		global.can_move=1
		instance_destroy()
	}
} else {
	atvx=camera_get_view_x(view_camera[0])+camera_get_view_width(view_camera[0])/2 - (sprite_get_width(sTextbox)*6)/2
	atvy=camera_get_view_y(view_camera[0])+camera_get_view_height(view_camera[0])/2 - (slot_h*3+ybtw*2)/2
}
//pos += down_key - up_key
//pos_inv+= right_key - left_key
anima_slot()

if (self_destruct) exit;

state[mode]()



/////////


