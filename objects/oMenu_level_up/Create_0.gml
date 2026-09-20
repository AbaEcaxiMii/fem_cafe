if instance_exists(oMenu){depth=oMenu.depth+10} 
flag_draw=1
width=140
height=40
sprite_index=global.txtb_spr
back_sprite = global.txtb_spr_back

op_border=8
op_space=10
animation=0

transition_time = 20; // Número de passos para a transição completa
//40
timer = 0;
color_start = c_white;
color_end = c_yellow;
transition_progress = 0; // Progresso da transição, de 0 a 1
transitioning = true;

atvx=camera_get_view_x(view_camera[0])+camera_get_view_width(view_camera[0])/2 - (width)/2
atvy=camera_get_view_y(view_camera[0])+camera_get_view_height(view_camera[0])/2 - (height)/2

resx=atvx
resy=camera_get_view_y(view_camera[0])- (height)

x=resx y=resy tx=atvx ty=atvy
ending=0

///////retirado do primor

party_show_mode(0)
exp_necessary_level_up=30*global.level

