flag_draw=1
if instance_exists(oMenu){depth=oMenu.depth+10} 
width=180
height=0 //ajeita depois no draw
//_string_h=(border*3+string_height(text_status[0])+(array_length(text_status)-1)*space)
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
resy=camera_get_view_y(view_camera[0])+camera_get_view_height(view_camera[0])

x=resx y=resy tx=atvx ty=atvy
ending=0

///////retirado do primor

option[0]="Direita"
option[1]="Esquerda"
option[2]="Cima"
option[3]="Baixo"
option[4]="Confirmar"
option[5]="Cancelar/Correr"
option[6]="Menu/Texto rápido"

status[0]=chr(global.right)
status[1]=chr(global.left)
status[2]=chr(global.up)
status[3]=chr(global.down)
status[4]=chr(global.confirmar)
status[5]=chr(global.cancelar)
status[6]=chr(global.menu_key)

op_length=array_length(option)
pos=0
party_show_mode(0)
key_change=0
key_change_timer=0
key_change_timer_ini=10