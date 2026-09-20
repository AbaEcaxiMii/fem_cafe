up_key=keyboard_check_pressed(global.up)
down_key=keyboard_check_pressed(global.down)
left_key=keyboard_check_pressed(global.left)
right_key=keyboard_check_pressed(global.right)
accept_key=keyboard_check_pressed(global.confirmar)
cancel_key=keyboard_check_pressed(global.cancelar)
menu_key=keyboard_check_pressed(global.menu_key)

y_primor=camera_get_view_y(view_camera[0])
resy=y_primor
resy2=y_primor+7
atvy=y_primor+h_primor

var _exim
if instance_exists(oother_menus) {_exim=1} else {_exim=0
	if instance_exists(oMenu_health){oMenu_health.dark_mode=0 party_show_mode(1)}
	}

var _dis_res = distance_to_point(x,resy)
var _dis_atv = distance_to_point(x,atvy)
//if ending and _dis_res<=3{instance_destroy()}
if ending and mode=0 {
if y<=resy+1 and oMenu_health.y>=oMenu_health.resy-1{instance_destroy(oMenu_health) instance_destroy()}
}

var _ny
if !_exim and !ending{mode=1} else {mode=0}
if mode=1{_ny=atvy} else {if ending{_ny=resy} else {_ny=resy2}}

x=camera_get_view_x(view_camera[0])
y= lerp(y,_ny,0.4)

var _dis=point_distance(camera_get_view_x(view_camera[0]),y,camera_get_view_x(view_camera[0]),camera_get_view_y(view_camera[0]))
image_yscale=-(_dis/sprite_get_height(sprite_index))
image_xscale=camera_get_view_width(view_camera[0])/sprite_get_width(sprite_index)

if _exim{cool_ending=cool_ini} else if !_exim and !ending{
	var _sound_pos= pos
	pos += right_key - left_key
	if pos >= op_length {pos=0}
	if pos < 0 {pos= op_length-1}
	if (_sound_pos!= pos and op_length>1){
		play_sfx(snd_menumove_ch1)	 
	}
}

if cool_ending>0{cool_ending=clamp(cool_ending - 1,0,cool_ini)}
if (menu_key or cancel_key) and mode and !cool_ending{play_sfx(snd_smallswing) ending=1}

if mode and accept_key{
	var _snd=snd_select_ch1
	switch(pos){
	
		case 0:
		instance_create_depth(x,y,depth-10,oMenu_magia, {char_select: 0}) //trocar para ser os de magias
		break
		
		case 1:
		instance_create_depth(x,y,depth-10,oMenu_status,{pos: 0}) //se apertar z neste vai pro equipamentos C vai pros charmes
		break
		
		case 2:
		if array_length(global.mission_inv)>0{
		instance_create_depth(x,y,depth-10,oMenu_mis)
		} else {_snd= snd_cantselect}
		break
		
		case 3:
		instance_create_depth(x,y,depth-10,oMenu_item)
		break
		
		case 4:
		instance_create_depth(x,y,depth-10,oMenu_level_up)
		break
		
		case 5:
		instance_create_depth(x,y,depth-10,oMenu_op)
		break
		
	}
	play_sfx(_snd)
	
}