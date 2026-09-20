left_key=keyboard_check_pressed(ord("9"))
right_key=keyboard_check_pressed(ord("0"))
//left_key=0
//right_key=0
//var _reso_selecting = reso_select
zoom_target += 0//(right_key - left_key)
zoom=zoom_target

resolution_width = resow[reso_select];
resolution_height = resoh[reso_select];
resolution_scale = resosc[reso_select];
global.view_width = (resolution_width / resolution_scale)* zoom
global.view_height = (resolution_height / resolution_scale)* zoom
window_set_size(global.view_width * resolution_scale, global.view_height * resolution_scale);
surface_resize(application_surface, global.view_width, global.view_height); // Mude aqui
display_set_gui_size(global.view_width, global.view_height);

var _bax= 100 var _bay= 100

global.barrier_x[0]= camera_get_view_x(view_camera[0])+ _bax
global.barrier_x[1]= camera_get_view_x(view_camera[0])+camera_get_view_width(view_camera[0])- _bax

global.barrier_y[0]= camera_get_view_y(view_camera[0])+ _bay
global.barrier_y[1]= camera_get_view_y(view_camera[0])+camera_get_view_height(view_camera[0])- _bay

global.barrier_x[0]= camera_get_view_x(view_camera[0])+ _bax
global.barrier_x[1]= camera_get_view_x(view_camera[0])+camera_get_view_width(view_camera[0])- _bax

global.barrier_y[0]= camera_get_view_y(view_camera[0])+50
global.barrier_y[1]= global.barrier_y[0]+160
