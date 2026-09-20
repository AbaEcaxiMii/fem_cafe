if !flag_draw{exit}
atvx=camera_get_view_x(view_camera[0])+camera_get_view_width(view_camera[0])/2 - (width*sprite_width)/2
atvy=camera_get_view_y(view_camera[0])+camera_get_view_height(view_camera[0])/2 - (height*sprite_height)/2

resx=camera_get_view_x(view_camera[0])+camera_get_view_width(view_camera[0])/2 - (width*sprite_width)/2
resy=camera_get_view_y(view_camera[0])+camera_get_view_height(view_camera[0])+40

draw_set_valign(fa_top)
draw_set_halign(fa_left)
draw_sprite_ext(back_sprite,image_index,x,y,width,height,0,image_blend,global.trans_back_menus)
draw_sprite_ext(sprite_index,image_index,x,y,width,height,0,image_blend,1)
var _dis_res = distance_to_point(resx,resy)
//draw_text(x,y-10,y) draw_text(x+50,y-10,resy)

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

///////retirado do primor
draw_set_halign(fa_center)
draw_set_valign(fa_middle)
if array_length(inv[pos_inv])<=0{
outline_text(x+(width*sprite_width)/2,y+10,"Você está sem " + string(pos_inv_name[pos_inv]))
draw_text(x+(width*sprite_width)/2,y+10,"Você está sem " + string(pos_inv_name[pos_inv]))
} else {
draw_set_valign(fa_top)
draw_set_halign(fa_left)

		var _c = c_white
		_c=_cc
		///desenhar o sprite
		draw_sprite(inv[pos_inv][pos_item].spr,animation,round(x+op_border),round(y+op_border))
		///desenhar o hp
		if pos_inv=0{
			var _thp="+" + string(inv[pos_inv][pos_item].hp) + " HP"
			outline_text(x+op_border+(op_border*3),y+op_border,_thp)
		draw_text_color(x+op_border+(op_border*3),y+op_border,_thp,c_green,c_green,c_green,c_green,1)
		}
		
		if vender_mode or pos_inv=1{
		var _s=string(global.money)+"$"+"("+string(inv[pos_inv][pos_item].price)+"$)"
		outline_text(x+op_border+(op_border*3),y+op_border*2,_s)
		draw_text_color(x+op_border+(op_border*3),y+op_border*2,_s,c_green,c_green,c_green,c_green,1)
		}
		///desenhar a desc
		if member_item_mode=0{
		outline_text(x+op_border,y+op_border+20,inv[pos_inv][pos_item].desc,10,110)
		draw_text_ext(x+op_border,y+op_border+20,inv[pos_inv][pos_item].desc,10,110)}
	///desenhar os nomes (lista de itens)
	var _yo=0
	for(var i=_min;i<_max;i++){
	var _li=array_length(inv[pos_inv])
	var _c= c_white if pos_item=i and _li>0{_c=_cc}
	var _name
	if (i<_li) and _li>0{_name=inv[pos_inv][i].name} else {_name=""}
	var _txx=x+(sprite_get_width(sTextbox)*width)-(sprite_get_width(sTextbox))*6
	var _tyy= y+op_border + op_space*_yo
	outline_text(_txx,_tyy,_name)
	draw_text_color(_txx,_tyy,_name,_c,_c,_c,_c,1)
	_yo++
	if _yo>_num-1{_yo=0}
}
	//outline_text(x+(sprite_get_width(sTextbox)*width)-(sprite_get_width(sTextbox))*6,y+op_border + op_space*i,inv[pos_inv][i].name)
	//draw_text_color(x+(sprite_get_width(sTextbox)*width)-(sprite_get_width(sTextbox))*6,y+op_border + op_space*i,inv[pos_inv][i].name,_c,_c,_c,_c,1)
}
draw_set_valign(fa_top)
draw_set_halign(fa_left)
		///desenhar o usar jogar fora
if options_item_mode=1 and member_item_mode=0{
	for(var i=0;i<array_length(options_item);i++){
		var _c = c_white
	if pos_options_item == i{_c=_cc}
	outline_text(x+op_border,y-op_border+(sprite_get_height(sTextbox)*height)-(op_space*array_length(options_item))+op_space*i,options_item[i])
	draw_text_color(x+op_border,y-op_border+(sprite_get_height(sTextbox)*height)-(op_space*array_length(options_item))+op_space*i,options_item[i],_c,_c,_c,_c,1)
	}
}

if member_item_mode=1{
	for(var i=0;i<oParty_manager.party_length;i++){
	var _dis_char=camera_get_view_width(view_camera[0])/(oParty_manager.party_length+1)
	var _w_spr=sprite_get_width(inv[pos_inv][pos_item].spr)
	var _h_spr=sprite_get_height(inv[pos_inv][pos_item].spr)
	var _x=(camera_get_view_x(view_camera[0])+ _dis_char*(member_item_pos+1))-_w_spr/2
	var _y=oMenu_health.y-_h_spr
	draw_sprite_ext(inv[pos_inv][pos_item].spr,0,_x,_y,1,1,0,c_white,1)
	//draw_sprite_ext(oParty_manager.party_members[i].icon,0,x+op_border,y+op_border+(op_border*3)+ 17*i,1,1,0,c_white,_trans)
	//draw_text_color(x+op_border+sprite_get_width(oParty_manager.party_members[i].icon)+4,y+op_border+(op_border*3)+ 17*i+(sprite_get_height(oParty_manager.party_members[i].icon)/3),oParty_manager.party_members[i].name,_c,_c,_c,_c,1)
	}
}
var _tt=0.7 var _pos_it=pos_item+1 if array_length(inv[pos_inv])<=0{_pos_it=0}

var _sname=string(string(pos_inv_name[pos_inv])+" ("+string(_pos_it)+"/"+string(inv_max[pos_inv])+")")
var _sww=(op_border*2+string_width(_sname))/sprite_get_width(sTextbox)
draw_sprite_ext(back_sprite,0,x,y-op_border/2-sprite_height*_tt,_sww,_tt,0,c_aqua,global.trans_back_menus)
draw_sprite_ext(sprite_index,0,x,y-op_border/2-sprite_height*_tt,_sww,_tt,0,c_aqua,1)
outline_text(x+op_border,y-op_border/2-sprite_height*_tt+op_border/2,_sname)
draw_text(x+op_border,y-op_border/2-sprite_height*_tt+op_border/2,_sname)

//draw_text(x,y,string(_min)+"/"+string(_max)+"/"+string(pos_item)+"/"+string(options_item_mode))