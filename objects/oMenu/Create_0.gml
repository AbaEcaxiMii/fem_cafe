global.can_move=false
depth=-room_height-100
image_speed=-1
var _dis=point_distance(camera_get_view_x(view_camera[0]),y,camera_get_view_x(view_camera[0]),camera_get_view_y(view_camera[0]))
image_yscale=-(_dis/sprite_get_height(sprite_index))
image_xscale=camera_get_view_width(view_camera[0])/sprite_get_width(sprite_index)
h_primor=50
y_primor=camera_get_view_y(view_camera[0])
resy=y_primor
resy2=y_primor+7
atvy=y_primor+h_primor
x=camera_get_view_x(view_camera[0])
y=resy
mode=0
pos=0
ending=0
cool_ini=10
cool_ending=0

option=["Magias","Equipamento & Charmes","Anotações","Itens","Alma","Opções"]
op_length=array_length(option)
if !instance_exists(oMenu_health){instance_create_depth(x,y,depth,oMenu_health)}

flag_draw=1