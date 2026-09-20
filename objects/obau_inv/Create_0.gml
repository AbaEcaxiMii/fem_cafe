global.can_move=false

op_border=8
op_space=16
op_btw=150
animation=0
back_sprite = sTextbox_back
//texto brilhante

transition_time = 20; // Número de passos para a transição completa
//40
timer = 0;
color_start = c_white;
color_end = c_yellow;
transition_progress = 0; // Progresso da transição, de 0 a 1
transitioning = true;

//dados
pos=0
_num=20
_min=0
_max=_num
lg_number=global.language
pos_item=0

option[0,0]="Guardar itens"
option[0,1]="Pegar itens"

option[1]=noone
option[2]=noone

status[0,7]="En: " + string(global.energia)  + "%"
status[0,8]=string(global.money) + "$"

status[1]=noone
status[2]=noone
menu_level=0

op_length=array_length(option[menu_level])
status_length=array_length(status[menu_level])
var _l=oitem_manager.bau_length
width=6
height=((((op_border + op_space*op_length)/(op_length-1))/sprite_height)*(op_length-1))+op_border/100