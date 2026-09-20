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

draw_set_valign(fa_top)
draw_set_halign(fa_left)

	var _yo=0
	for(var i=_min;i<_max;i++){
	var _li=array_length(global.mission_inv)
	var _c= c_white if pos_mis=i{_c=_cc}
	var _name
	var _star=0
	
	if i<_li{
	var _prog_max= omission_manager.mis_prog_max[global.mission_inv[i]]
	if omission_manager.mis_prog[global.mission_inv[i]]=_prog_max{_star=1}
	}
	
	if (i<_li) and _li>0{_name=(omission_manager.mis_name[global.mission_inv[i]])} else {_name=""}
	var _txx= x+op_border
	var _tyy= y+op_border + op_space*_yo
	outline_text(_txx,_tyy,_name)
	draw_text_color(_txx,_tyy,_name,_c,_c,_c,_c,1)
	if _star=1{draw_sprite(s_star_mis,0,_txx+2+string_width(_name),_tyy)}
	_yo++
	if _yo>_num-1{_yo=0}
	}
	
	var _x=x+(sprite_get_width(sTextbox)*width)-(sprite_get_width(sTextbox))*6
	var _y=y+op_border
	var _txt=omission_manager.mis_txt[global.mission_inv[pos_mis], pos_mis_txt]
	var _sep=10 var _w=((sprite_get_width(sTextbox))*6)-op_border
	outline_text(_x,_y,_txt,_sep,_w)
	draw_text_ext(_x,_y,_txt,_sep,_w)
	
	draw_text(x,y,_w)
	
	draw_set_halign(fa_center)
	draw_set_valign(fa_middle)
	var _x=x+(sprite_get_width(sTextbox)*width)-(sprite_get_width(sTextbox))*3
	var _y=y+(sprite_get_height(sTextbox)*height)-op_border*2
	var _txt=string(pos_mis_txt+1)+"/"+string((omission_manager.mis_prog[global.mission_inv[pos_mis]])+1)
	outline_text(_x,_y,_txt)
	draw_text(_x,_y,_txt)

//draw_text(x,y-15,string(_min)+"/"+string(_max)+"/"+string(pos_mis))