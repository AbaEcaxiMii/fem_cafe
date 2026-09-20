flag_draw=1
width=6
height=7
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

atvx=camera_get_view_x(view_camera[0])+camera_get_view_width(view_camera[0])/2 - (width*sprite_width)/2
atvy=camera_get_view_y(view_camera[0])+camera_get_view_height(view_camera[0])/2 - (height*sprite_height)/2

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
option[5]="Cancelar"
option[6]="Menu/Texto rápido"
option[7]="Tiro"
option[8]="Dash"
option[9]="Correr"

status[0]=chr(global.right)
status[1]=chr(global.left)
status[2]=chr(global.up)
status[3]=chr(global.down)
status[4]=chr(global.confirmar)
status[5]=chr(global.cancelar)
status[6]=chr(global.super_skip)
status[7]=chr(global.Botaotiro)
status[8]=chr(global.Botaodash)
status[9]=chr(global.correr)

op_length=array_length(option)
pos=0
party_show_mode(0)
key_change=0
key_change_timer=0
key_change_timer_ini=10