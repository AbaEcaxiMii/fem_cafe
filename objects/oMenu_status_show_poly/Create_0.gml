flag_draw=1
depth=oMenu_health.depth+5

	image_xscale=(camera_get_view_height(view_camera[0])/20)
	image_yscale=6
	image_blend=c_green
back_sprite = sTextbox_back

image_angle=270

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

atvx=camera_get_view_x(view_camera[0])+sprite_height
atvy=camera_get_view_y(view_camera[0])

resx=camera_get_view_x(view_camera[0])
resy=atvy

x=resx y=resy tx=atvx ty=atvy
ending=0

///////

party_show_mode(1)
//pos=0 adicionar no omenu pra poder continuar o mesmo quando volta
status_ready=0
st_pos=0
pos_act=0
