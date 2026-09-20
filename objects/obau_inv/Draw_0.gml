x=camera_get_view_x(view_camera[0])+camera_get_view_width(view_camera[0])/2 - (width*sprite_width)/2
y=camera_get_view_y(view_camera[0])+camera_get_view_height(view_camera[0])/2 - (height*sprite_height)/2
draw_set_valign(fa_top)
draw_set_halign(fa_left)
draw_sprite_ext(back_sprite,image_index,x,y,width,height,0,image_blend,global.trans_back_menus)
draw_sprite_ext(sprite_index,image_index,x,y,width,height,0,image_blend,1)

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
//////////////////////Main menu
if menu_level=0{
	width=6
	height=((((op_border + op_space*op_length)/(op_length-1))/sprite_height)*(op_length-1))+op_border/100
//opções item habi opções
for(var i=0;i<op_length;i++){
	var _c = c_white
	if pos == i{_c=_cc}
	draw_text_color(x+op_border,y+op_border + op_space*i,option[menu_level,i],_c,_c,_c,_c,1)
}
}
/////////////////////Itens inv
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
		///desenhar a descricao
		draw_text_ext(x+op_border,y+op_border+(op_border*4),oitem_manager.inv[i].descricao,10,100)
		}
	///desenhar os nomes (lista de itens)
	draw_text_color(x+op_border+(op_border*13),y+op_border + op_space*i,oitem_manager.inv[i].name,_c,_c,_c,_c,1)
	}
	
	
}

/////////////////////itens bau
if menu_level=2{
	width=12
	var _num_2= _num/2
	height=((((op_border + op_space*_num_2)/(_num_2))/sprite_height)*(_num_2))+op_border/100
	var _yo=0
	var _xo=0
	draw_text(x,y-10,string(pos_item+1)+"/"+string(oitem_manager.bau_length))
	for(var i=_min;i<_max;i++)
	{
	var _name
	var _c = c_white
	//draw_sprite(oitem_manager.bau_inv[i].sprite,animation,x+(sprite_width*width)-40,y+op_border)
	if i<oitem_manager.bau_length {_name=oitem_manager.bau_inv[i].name} else {_name="-------------"}
	if pos_item == i{_c=_cc}
	draw_text_color(x+op_border+op_btw*_xo,y+op_border + op_space*_yo,_name,_c,_c,_c,_c,1)
	_yo++
	if _yo>_num_2-1{_xo=1 _yo=0}
	}

}
draw_text(round(x)+40,round(y),string(menu_level) + "/" + string(pos_item)+ "/" + string(oitem_manager.bau_length))