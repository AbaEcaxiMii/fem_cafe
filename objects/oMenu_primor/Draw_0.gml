x=camera_get_view_x(view_camera[0])+camera_get_view_width(view_camera[0])/2 - (width*sprite_width)/2
y=camera_get_view_y(view_camera[0])+camera_get_view_height(view_camera[0])/2 - (height*sprite_height)/2
draw_set_valign(fa_top)
draw_set_halign(fa_left)
draw_sprite_ext(back_sprite,image_index,x,y,width,height,0,image_blend,global.trans_back_menus)
draw_sprite_ext(sprite_index,image_index,x,y,width,height,0,image_blend,1)

draw_text(round(x),round(y),string(menu_level) + "/" + string(pos)+ "/" + string(key_change)+ "/" + string(ggg))
var r1 = color_get_red(color_start);
var g1 = color_get_green(color_start);
var b1 = color_get_blue(color_start);
var r2 = color_get_red(color_end);
var g2 = color_get_green(color_end);
var b2 = color_get_blue(color_end);

var r = lerp(r1, r2, transition_progress);
var g = lerp(g1, g2, transition_progress);
var b = lerp(b1, b2, transition_progress);

var _cc = make_color_rgb(r, g, b);
///////////////
//!!!!!!!!!!!!!!
//fazer o widht das ops se arrumar automaticamente
//!!!!!!!!!!!!!!
//////////////
//////////////////////Main menu
if menu_level=0{
	width=8
	height=6
//opções item habi opções
for(var i=0;i<op_length;i++){
	var _c = c_white
	if pos == i{_c=_cc}
	draw_text_color(x+op_border+(op_border*16),y+op_border + op_space*i + (op_border*8),option[menu_level,i],_c,_c,_c,_c,1)

}

//status

for(var i=0;i<8;i++){
	draw_text(x+(op_border*3),y+op_border + ggg*i,status[menu_level,i])
	//draw_sprite(simb_status[menu_level,i],0,x+op_border,y+op_border +(ggg-2)*i)
}

for(var i=8;i<status_length;i++){
	draw_text(x+op_border+(op_border*13),y+op_border + ggg*(i-7),status[menu_level,i])
	//draw_sprite(simb_status[menu_level,i],0,x+op_border+(op_border*9),y+op_border + (ggg-2)*(i-4))
}

draw_sprite(srecy_desenho_menu,0,x+op_border,y+op_border + op_space*4)

}

/////////////////////Itens
if menu_level=1{
	width=10
	height=7
	for(var i=0;i<array_length(oitem_manager.inv);i++){
		var _c = c_white
	if pos_item == i{
		_c=_cc
		///desenhar o sprite
		draw_sprite(oitem_manager.inv[i].sprite,animation,round(x+op_border),round(y+op_border))
		///desenhar o hp e ener
		draw_text_color(x+op_border+(op_border*3),y+op_border,"+" + string(oitem_manager.inv[i].hp) + " HP",c_green,c_green,c_green,c_green,1)
		draw_text(x+op_border+(op_border*3),y+op_border*2,status[0,1])
		draw_text(x+op_border+(op_border*3),y+op_border*3,status[0,6])
		///desenhar a descricao
		if member_item_mode=0{
		draw_text_ext(x+op_border,y+op_border+(op_border*4),oitem_manager.inv[i].descricao,10,100)}
		}
	///desenhar os nomes (lista de itens)
	draw_text_color(x+op_border+(op_border*15),y+op_border + op_space*i,oitem_manager.inv[i].name,_c,_c,_c,_c,1)
	}
	
		///desenhar o usar jogar fora e cancelar
if options_item_mode=1 and member_item_mode=0{
	for(var i=0;i<3;i++){
		var _c = c_white
	if pos_options_item == i{_c=_cc}
	draw_text_color(x+op_border,y+op_border+(op_border*14)+ op_space*i,options_item[i],_c,_c,_c,_c,1)
	}
}

if member_item_mode=1{
	for(var i=0;i<oParty_manager.party_length;i++){
		var _c = c_white
		var _trans = 0.5
	if  member_item_pos == i{_c=_cc; _trans = 1}
	draw_sprite_ext(oParty_manager.party_members[i].icon,0,x+op_border,y+op_border+(op_border*3)+ 17*i,1,1,0,c_white,_trans)
	draw_text_color(x+op_border+sprite_get_width(oParty_manager.party_members[i].icon)+4,y+op_border+(op_border*3)+ 17*i+(sprite_get_height(oParty_manager.party_members[i].icon)/3),oParty_manager.party_members[i].name,_c,_c,_c,_c,1)
	}
}

}

/////////////////////Equipamento
if menu_level=1.1{
	width=12
	height=8
	
	var _num_2= _num/2
	//height=((((op_border + op_space*_num_2)/(_num_2))/sprite_height)*(_num_2))+op_border/100
	var _yo=0
	var _xo=0
	//draw_text(x,y-10,string(pos_item+1)+"/"+string(oitem_manager.bau_length))
	for(var i=_min;i<_max;i++)
	{
	var _name
	var _c = c_white
	if i<oitem_manager.weapon_inv {_name=oitem_manager.weapon_inv[i].name} else {_name="-------------"}
	//if pos_item == i{_c=_cc}
	draw_text_color(x+op_border+op_btw*_xo,y+op_border + op_space*_yo,_name,_c,_c,_c,_c,1)
	_yo++
	if _yo>_num_2-1{_xo=1 _yo=0}
	}

	
	
}

/////////////////////Opções
if menu_level=3{
	width=5
//	(_op_space)/txtb_sprite_h)-0.04
	height=((((op_border + op_space*op_length)/(op_length-1))/sprite_height)*(op_length-1))+op_border/100
	if global.language=0{Linguagem_opcoes_texto= "Linguagem"} else if global.language=1{Linguagem_opcoes_texto= "Language"}
	option[3,2]= string (Linguagem_opcoes_texto) + ": '' " + string(admMundo.lg[lg_number]) + " ''"
	option[3,0]="Volume " + string(round(global.masterVol*100)) + " (" + chr(global.confirmar) + "->100)"
for(var i=0;i<op_length;i++){
	var _c = c_white
	if pos == i{_c=_cc}
	draw_text_color(x+op_border,y+op_border + op_space*i,option[menu_level,i],_c,_c,_c,_c,1)
}
}

/////////////////////Controles parte1
if menu_level=4{
	width=6
	height=((((op_border + op_space*op_length)/(op_length-1))/sprite_height)*(op_length-1))+op_border/100
	if admMundo.auto_correr {auto_c_onf="ON"} else if not admMundo.auto_correr {auto_c_onf="OFF"}
	if admMundo.auto_tiro {auto_t_onf="ON"} else if not admMundo.auto_tiro {auto_t_onf="OFF"}
	if global.language=0{option[4,0]="Auto-correr " + string(auto_c_onf)} else if global.language=1{option[4,0]="Auto-run " + string(auto_c_onf)}
	if global.language=0{option[4,1]="Auto-tiro " + string(auto_t_onf)} else if global.language=1{option[4,1]="Auto-shot " + string(auto_t_onf)}
for(var i=0;i<op_length;i++){
	var _c = c_white
	if pos == i{_c=_cc}
	draw_text_color(x+op_border,y+op_border + op_space*i,option[menu_level,i],_c,_c,_c,_c,1)
}
}

/////////////////////Controles parte2
if menu_level=5{
	width=6
	height=7
	if global.language=0{
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
} else if global.language=1{
option[5,0]="Right"
option[5,1]="Left"
option[5,2]="Up"
option[5,3]="Down"
option[5,4]="Confirm"
option[5,5]="Cancel"
option[5,6]="Menu/Fast text"
option[5,7]="Shot"
option[5,8]="Dash"
option[5,9]="Run"
}
for(var i=0;i<op_length;i++){
	var _c = c_white
	if pos == i{_c=_cc}
	draw_text_color(x+op_border,y+op_border + op_space*i,option[menu_level,i],_c,_c,_c,_c,1)
	draw_text_color(x+op_border +(op_space*7),y+op_border + op_space*i,status[menu_level,i],_c,_c,_c,_c,1)
	if global.language=0{
	draw_text(x+op_border,y+op_border + op_space*10,"Default (Press F5)")} else if global.language=1{draw_text(x+op_border,y+op_border + op_space*11,"Padrão (Aperte F1)")}
}
}