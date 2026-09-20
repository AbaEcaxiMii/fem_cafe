up_key=keyboard_check_pressed(global.up)
down_key=keyboard_check_pressed(global.down)
left_key=keyboard_check_pressed(global.left)
right_key=keyboard_check_pressed(global.right)
accept_key=keyboard_check_pressed(global.confirmar)
cancel_key=keyboard_check_pressed(global.cancelar)
menu_key=keyboard_check_pressed(global.menu_key)

anima++

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
//
//cria espaço ao lado para mostrar os equipamentos usados
if ending{tx=resx ty=resy} else {tx=atvx ty=atvy
	if not instance_exists(oMenu_charms_show){instance_create_depth(x,y,depth,oMenu_charms_show)}
	}
var _dis_res = distance_to_point(resx,resy)

x=lerp(x,tx,0.4) y=lerp(y,ty,0.1)
//y=clamp(y,atvy,resy)
//x=clamp(x,atvx,resx)
if ending and x>=resx-1{instance_destroy()}

///////retirado do primor
var _desc_ny=camera_get_view_y(view_camera[0])+desc_height

if status_mode=1{charms_step()} else {show_status_step() _desc_ny=camera_get_view_y(view_camera[0])}

desc_x=camera_get_view_x(view_camera[0])
desc_y= lerp(desc_y,_desc_ny,0.4)

var _desc_dis=point_distance(camera_get_view_x(view_camera[0]),desc_y,camera_get_view_x(view_camera[0]),camera_get_view_y(view_camera[0]))
desc_yscale=-(_desc_dis/sprite_get_height(sspike_block))
desc_xscale=camera_get_view_width(view_camera[0])/sprite_get_width(sspike_block)

var _idi=global.party_members[pos].id_number
global.charms_points_spend[_idi]=0
for(var i=0;i<array_length(global.charms[_idi]);i++){
	global.charms_points_spend[_idi]+=global.charms[_idi][i].price
	
}