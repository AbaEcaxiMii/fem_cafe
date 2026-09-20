if !flag_draw{exit}
atvx=camera_get_view_x(view_camera[0])+camera_get_view_width(view_camera[0])/2 - (width)/2
atvy=camera_get_view_y(view_camera[0])+camera_get_view_height(view_camera[0])/2 - (height)/2

resx=atvx
resy=camera_get_view_y(view_camera[0])- (height)

draw_set_valign(fa_top)
draw_set_halign(fa_left)
draw_sprite_ext(back_sprite,image_index,x,y,width/sprite_width,height/sprite_height,0,image_blend,global.trans_back_menus)
draw_sprite_ext(sprite_index,image_index,x,y,width/sprite_width,height/sprite_height,0,image_blend,1)
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
var _c=c_white
var _text=$"{global.exp_storage}/{exp_necessary_level_up} Exp:{global.exp}"
var _text2=$"Level {global.level}"
draw_text_outline(x+op_border,y+op_border,_text)
draw_text_color(x+op_border,y+op_border,_text,_c,_c,_c,_c,1)
draw_text_outline(x+op_border,y+op_border+op_space,_text2)
draw_text_color(x+op_border,y+op_border+op_space,_text2,_c,_c,_c,_c,1)

