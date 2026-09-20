flag_draw=1
if instance_exists(oMenu){depth=oMenu.depth+10} 
width=264
height=144

sprite_index=global.txtb_spr
back_sprite = global.txtb_spr_back

op_border=8
op_space=14
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
resy=camera_get_view_y(view_camera[0])+camera_get_view_height(view_camera[0])+40
//O +40 é por causa do Texto item item chave
x=resx y=resy tx=atvx ty=atvy
ending=0

///////retirado do primor

pos_mis=0
pos_mis_txt=0

party_show_mode(0)

_num=10
_min=0
_max=_num
