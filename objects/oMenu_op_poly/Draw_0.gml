if !flag_draw{exit}
atvx=camera_get_view_x(view_camera[0])+camera_get_view_width(view_camera[0])/2 - (width*sprite_width)/2
atvy=camera_get_view_y(view_camera[0])+camera_get_view_height(view_camera[0])/2 - (height*sprite_height)/2

resx=atvx
resy=camera_get_view_y(view_camera[0])- (height*sprite_height)

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
if global.language=0{Linguagem_opcoes_texto= "Linguagem"} else if global.language=1{Linguagem_opcoes_texto= "Language"}
	option[2]= string (Linguagem_opcoes_texto) + ": '' " + string(lg[global.language]) + " ''"
	option[0]="Volume " + string(round(global.masterVol*100)) + " (" + chr(global.confirmar) + "->100)"
	var _auto if global.auto_correr{_auto="ON"} else {_auto="OFF"}
	if global.language=0{option[4]="Auto-correr " + _auto} else if global.language=1{option[0]="Auto-run " + _auto}
	var _auto if global.auto_tiro{_auto="ON"} else {_auto="OFF"}
	if global.language=0{option[5]="Auto-tiro " + _auto} else if global.language=1{option[1]="Auto-shot " + _auto}
for(var i=0;i<op_length;i++){
	var _c = c_white
	if pos == i{_c=_cc}
	outline_text(x+op_border,y+op_border + op_space*i,option[i])
	draw_text_color(x+op_border,y+op_border + op_space*i,option[i],_c,_c,_c,_c,1)
}