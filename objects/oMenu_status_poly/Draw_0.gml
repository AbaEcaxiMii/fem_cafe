if !flag_draw{exit}
atvx=camera_get_view_x(view_camera[0])+camera_get_view_width(view_camera[0])/1.5 - (width*sprite_width)/2
atvy=camera_get_view_y(view_camera[0])+camera_get_view_height(view_camera[0])/2 - (height*sprite_height)/2

resx=camera_get_view_x(view_camera[0]) - (width*sprite_width)
resy=atvy
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
_fps_timer++
if _fps_timer>=20{
if rato_fps=2{_fps=-1}
if rato_fps=0{_fps=1}
rato_fps+=_fps
_fps_timer=0
}
var _yz = y-12 + wave(-3,3,0.10,0)
draw_sprite_ext(sZZZ,0,x+(width*sprite_width)-38,_yz,1,1,0,c_white,image_alpha)
draw_sprite(srat_zzz,rato_fps,x+(width*sprite_width)-20,y)
if status_ready{
for(var i=0;i<7;i++){
	var _o=i var _p=0
	if i>2 {_o=i-3 _p=5}
	if i<6{
		draw_sprite(status_spr[i],0,x+op_border+op_space*_p,1+y+op_border + op_space*_o)
		outline_text(10+x+op_border+op_space*_p,y+op_border + op_space*_o,status[i])
		draw_text(10+x+op_border+op_space*_p,y+op_border + op_space*_o,status[i])
		}
	outline_text(x+op_border,y+op_border + op_space*3,status[6])
	draw_text(x+op_border,y+op_border + op_space*3,status[6])
	outline_text(x+op_border,y+op_border + op_space*4,status[7],line_sep_desc,line_width)
	draw_text_ext(x+op_border,y+op_border + op_space*4,status[7],line_sep_desc,line_width)
}

for(var i=8;i<13;i++){
	draw_sprite(status[i],0,x+op_border+(25*(i-8)),y+(height*sprite_height)-20-op_border)
}



}