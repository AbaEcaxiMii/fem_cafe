if instance_exists(oMenu){depth=oMenu.depth+10} 
flag_draw=1
width=140
height=0
sprite_index=global.txtb_spr
back_sprite = global.txtb_spr_back

op_border=8
op_space=16
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
option[0]="Volume " + string(round(global.masterVol*100)) + " (" + chr(global.confirmar) + "->100)"
option[1]="Fullscreen"
option[2]="Linguagem"
option[3]="Controles"
option[4]="Auto-correr"
Linguagem_opcoes_texto= "Linguagem"

lg[0]="pt"
lg[1]="eng"

op_length=array_length(option)
lg_length=array_length(lg)

party_show_mode(0)

height=(op_border*2+string_height("A")+(op_length-1)*op_space)
pos=0
