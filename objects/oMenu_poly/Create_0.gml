global.can_move=false
image_speed=-1
image_yscale=-1.8 image_xscale=camera_get_view_width(view_camera[0])/sprite_width
h_primor=sprite_height*-1
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

option[0]="Itens"
option[1]="Equipamento & Habilidades"
option[2]="Anotações"
option[3]="Opções"
op_length=array_length(option)
if !instance_exists(oMenu_health){instance_create_depth(x,y,depth,oMenu_health)}


flag_draw=1