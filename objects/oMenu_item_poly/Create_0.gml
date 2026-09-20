flag_draw=1
if instance_exists(oMenu_health){depth=oMenu_health.depth+10}
	width=11
	height=6
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

atvx=camera_get_view_x(view_camera[0])+camera_get_view_width(view_camera[0])/2 - (width*sprite_width)/2
atvy=camera_get_view_y(view_camera[0])+camera_get_view_height(view_camera[0])/2 - (height*sprite_height)/2

resx=atvx
resy=camera_get_view_y(view_camera[0])+camera_get_view_height(view_camera[0])+40
//O +40 é por causa do Texto item item chave
x=resx y=resy tx=atvx ty=atvy
ending=0

///////retirado do primor

vender_mode=0
pos_inv=0
pos_item=0
pos_options_item=0
options_item_mode=0
member_item_pos=0 
member_item_mode=0
show_hp_msg=0
inv[0]=oitem_manager.inv
inv[1]=oitem_manager.inv_sell
inv[2]=oitem_manager.inv_key

inv_max[0]=oitem_manager.inv_max
inv_max[1]=oitem_manager.inv_max_sell
inv_max[2]=oitem_manager.inv_max_key

pos_inv_name[0]="Itens"
pos_inv_name[1]="Itens pra Venda"
pos_inv_name[2]="Itens-Chave"
options_item[0]="Usar"
options_item[1]="Jogar fora"
party_show_mode(1)

_num=10
_min=0
_max=_num
wfora=0

function jogar_fora_item(){
var _inst_item=	instance_create_depth(oPlayer.x-10,oPlayer.y+10,oPlayer.depth+10,oitem_overworld,{image_alpha: 0})
		_inst_item.item=inv[pos_inv][pos_item]
		array_delete(inv[pos_inv],pos_item,1)
		options_item_mode=0
}
