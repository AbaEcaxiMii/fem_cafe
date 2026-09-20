flag_draw=1
var _dis=point_distance(camera_get_view_x(view_camera[0]),y,camera_get_view_x(view_camera[0]),camera_get_view_y(view_camera[0])+camera_get_view_height(view_camera[0]))
image_yscale=(_dis)/sprite_get_height(sprite_index)
image_xscale=camera_get_view_width(view_camera[0])/sprite_get_width(sprite_index)

h_primor=44
y_primor=camera_get_view_y(view_camera[0])+camera_get_view_height(view_camera[0])
resy=y_primor
resy2=y_primor-7
atvy=y_primor-h_primor
x=camera_get_view_x(view_camera[0])
y=resy
vel=0.4
mode=1
ending=1
dark_mode=0 pos_other=0
//60 30 84c
