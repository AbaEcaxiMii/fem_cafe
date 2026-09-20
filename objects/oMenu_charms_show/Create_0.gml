flag_draw=1
if instance_exists(oMenu){depth=oMenu.depth+10} 
width=60
image_xscale=(camera_get_view_height(view_camera[0])/sprite_get_width(sprite_index))
image_yscale=(width/sprite_get_height(sprite_index))
image_blend=c_green
back_sprite = sTextbox_back
image_angle=270
image_speed=1

op_border=8
op_space=16
anima=0
animation=0
transition_time = 20; // Número de passos para a transição completa
//40
timer = 0;
color_start = c_white;
color_end = c_yellow;
transition_progress = 0; // Progresso da transição, de 0 a 1
transitioning = true;

atvx=camera_get_view_x(view_camera[0])+width
atvy=camera_get_view_y(view_camera[0])

resx=camera_get_view_x(view_camera[0])
resy=atvy

x=resx y=resy tx=atvx ty=atvy
ending=0

///////

party_show_mode(1)
status_ready=0
pos=0

restart_rolamento=1

rolando_y=array_create(0)
rolando_y2=array_create(0)
charm_quanti=10
charm_max=20
charm_sep=4
space=0
rolando_y=0
rolando_y2=0
