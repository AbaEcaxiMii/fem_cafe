if instance_exists(oMenu){depth=oMenu.depth+10} 
flag_draw=1
width[0]=120
height[0]=133
	
width[1]=192 //192
height[1]= 136 //144
sprite_index= global.txtb_spr
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

atvx[0]=camera_get_view_x(view_camera[0])+camera_get_view_width(view_camera[0])/4 - (width[0])/2
atvy[0]=camera_get_view_y(view_camera[0])+camera_get_view_height(view_camera[0])/2 - (height[0])/2

resx[0]=atvx[0]
resy[0]=camera_get_view_y(view_camera[0])- (height[0])

atvx[1]=camera_get_view_x(view_camera[0])+camera_get_view_width(view_camera[0])/1.6 - (width[1])/2
atvy[1]=camera_get_view_y(view_camera[0])+camera_get_view_height(view_camera[0])/2 - (height[1])/2

resx[1]=camera_get_view_x(view_camera[0])+camera_get_view_width(view_camera[0])
resy[1]=atvy[1]
image_alpha=0
_x[0]=resx[0] _y[0]=resy[0]
tx[0]=atvx[0] ty[0]=atvy[0]

_x[1]=resx[1] _y[1]=resy[1]
tx[1]=atvx[1] ty[1]=atvy[1]

ending=0

///////
if instance_exists(oMenu_health){oMenu_health.dark_mode=1 oMenu_health.pos_other=pos_m}
party_show_mode(1)
fase=0
pos=0 pos_inv=0
status_ready=0
line_sep=10
vel=0.4
textbox_width = width[1]
line_width = textbox_width - op_border*2

inv[0]=oitem_manager.main_inv
inv[1]=oitem_manager.weapon_inv
inv[2]=oitem_manager.armor_inv
inv[3]=oitem_manager.armor_inv
inv[4]=oitem_manager.armor_inv
inv_name[0]="Ar.Principal"
inv_name[1]="Arma"
inv_name[2]="Armadura 1"
inv_name[3]="Armadura 2"
inv_name[4]="Armadura 3"

inv_name[5]="Arma"
inv_name[6]="Arma"
inv_name[7]="Armadura"
inv_name[8]="Armadura"
inv_name[9]="Armadura"

_num=10
_min=0
_max=_num
wfora=0

vender_mode=0
