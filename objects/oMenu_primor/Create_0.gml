global.can_move=false

width=8
height=6
sprite_index=global.txtb_spr
back_sprite = global.txtb_spr_back

op_border=8
op_space=16
animation=0
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
lg_number=global.language
pos_item=0
pos_options_item=0
options_item_mode=0
member_item_pos=0 
member_item_mode=0
status_pos=0

options_item[0]="Usar"
options_item[1]="Jogar fora"
options_item[2]="Cancelar"


option[0,0]="Itens"
option[0,1]="Habilidades"
option[0,2]="Opções"

option[1]=noone

option[3,0]="Volume " + string(round(global.masterVol*100)) + " (" + chr(global.confirmar) + "->100)"
option[3,1]="Fullscreen"
option[3,2]="Linguagem"
option[3,3]="Controles"
option[3,4]="Sair do jogo"
option[3,5]="Voltar"
Linguagem_opcoes_texto= "Linguagem"

option[4,0]="Auto-correr"
option[4,1]="Auto-tiro"
option[4,2]="Redefinir controles"
auto_c_onf="OFF"
auto_t_onf="OFF"

option[5,0]="Direita"
option[5,1]="Esquerda"
option[5,2]="Cima"
option[5,3]="Baixo"
option[5,4]="Confirmar"
option[5,5]="Cancelar"
option[5,6]="Menu/Texto rápido"
option[5,7]="Tiro"
option[5,8]="Dash"
option[5,9]="Correr"

status_show=oParty_manager.party_members[status_pos]
status[0,0]= "''" + string(status_show.name) + "''"
status[0,1]="HP: " + string(status_show.hp) + "/" + string(status_show.mhp)
status[0,2]="Atk físico: " + string(status_show.atk)
status[0,3]="Atk Especial: " + string(status_show.atke)
status[0,4]="Def: " + string(status_show.def)
status[0,5]="Resiliência: " + string(status_show.res)
status[0,6]="Sorte: " + string(status_show.sor)
status[0,7]="Tensão: " + string(round(status_show.ten))

status[0,8]="Energia: " + string(global.energia)  + "%"
status[0,9]=string(global.money) + "$"

simb_status[0,0]= s_status_atk
simb_status[0,1]= s_status_atk
simb_status[0,2]= s_status_res
simb_status[0,3]= s_status_sor

simb_status[0,4]= s_status_atk
simb_status[0,5]= s_status_def
simb_status[0,6]= s_status_atk

ggg=10
status[1]=noone
status[1.1]=noone
status[3]=noone
status[4]=noone

///equipamento

_num=8
_min=0
_max=_num

///


status[5,0]=chr(global.right)
status[5,1]=chr(global.left)
status[5,2]=chr(global.up)
status[5,3]=chr(global.down)
status[5,4]=chr(global.confirmar)
status[5,5]=chr(global.cancelar)
status[5,6]=chr(global.super_skip)
status[5,7]=chr(global.Botaotiro)
status[5,8]=chr(global.Botaodash)
status[5,9]=chr(global.correr)

menu_level=0
key_change=0
key_change_timer=0

op_length=array_length(option[menu_level])
status_length=array_length(status[menu_level])