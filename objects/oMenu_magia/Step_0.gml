up_key=keyboard_check_pressed(global.up)
down_key=keyboard_check_pressed(global.down)
left_key=keyboard_check_pressed(global.left)
right_key=keyboard_check_pressed(global.right)
accept_key=keyboard_check_pressed(global.confirmar)
cancel_key=keyboard_check_pressed(global.cancelar)
menu_key=keyboard_check_pressed(global.menu_key)

animation+=0.1
if animation>100{animation=0}

//texto brilhante
if (transitioning) {
    timer += 1;
    transition_progress = timer / transition_time;
    
    if (transition_progress >= 1) {
        transition_progress = 1;
        timer = 0;
        transitioning = false;
        // Troca de cor
        var temp = color_start;
        color_start = color_end;
        color_end = temp;
        transition_progress = 0;
        transitioning = true;
    }
}

if ending{tx=resx ty=resy} else {tx=atvx ty=atvy}
var _dis_res = distance_to_point(resx,resy)

x=lerp(x,tx,0.6) y=lerp(y,ty,0.3)
//y=clamp(y,atvy,resy)
if ending and x<=resx+1{oMenu_health.dark_mode=0 instance_destroy()}

///////retirado do primor

var _desc_ny=camera_get_view_y(view_camera[0])+60
if ending or state!=2{_desc_ny=camera_get_view_y(view_camera[0])}
desc_x=camera_get_view_x(view_camera[0])
desc_y= lerp(desc_y,_desc_ny,0.4)

var _desc_dis=point_distance(camera_get_view_x(view_camera[0]),desc_y,camera_get_view_x(view_camera[0]),camera_get_view_y(view_camera[0]))
desc_yscale=-(_desc_dis/sprite_get_height(sspike_block))
desc_xscale=camera_get_view_width(view_camera[0])/sprite_get_width(sspike_block)

if !ending{
	oMenu_health.dark_mode=1 oMenu_health.pos_other=char_select
	switch (state){
		case 0:
			state_char()
		break
			
		case 1:
			state_class()
		break
			
		case 2:
			state_spell()
		break
	}
}

//verifica quantos pontos de charmes o char tem
global.charms_points[id_number[char_selected]]=0
for(var i=0;i<array_length(global.spells_bloqueadas[id_number[char_selected]]);i++){
	global.charms_points[id_number[char_selected]]+=global.spells_bloqueadas[id_number[char_selected]][i].price
	
}