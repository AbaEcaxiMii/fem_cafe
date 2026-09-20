flag_draw=1
depth=oMenu_health.depth+10
	width=8
	height=5.5
sprite_index=global.txtb_spr
back_sprite = global.txtb_spr_back

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

atvx=camera_get_view_x(view_camera[0])+camera_get_view_width(view_camera[0])/2 - (width*sprite_width)/2
atvy=camera_get_view_y(view_camera[0])+camera_get_view_height(view_camera[0])/2 - (height*sprite_height)/2

resx=camera_get_view_x(view_camera[0]) - width*sprite_width
resy=atvy

x=resx y=resy tx=atvx ty=atvy
ending=0

///////

party_show_mode(1)
//pos=0 adicionar no omenu pra poder continuar o mesmo quando volta
status_ready=0
line_sep=10
line_sep_desc=8
textbox_width = sprite_get_width(sprite_index)*width
line_width = textbox_width - op_border*2
rato_fps=0
_fps=1
_fps_timer=0
