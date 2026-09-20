
if !flag_draw{exit}
draw_self()
//draw_text(x,y,image_speed)
//draw_sprite_ext(sBlack,0,_x,_y,8,1,0,c_white,1)
draw_set_halign(fa_center)
draw_set_valign(fa_middle)
var _x=camera_get_view_x(view_camera[0])+camera_get_view_width(view_camera[0])/2
var _y=y-(h_primor/2)-6
//outline_text(camera_get_view_width(view_camera[0])/2,y+(h_primor/2)+1,option[pos],10,999999,c_white,1,1)
draw_text(_x,_y,option[pos])
var _s=string(global.money)+"$"
var _ws=string_width(_s)
var _hs=string_height(_s)
var _xx=camera_get_view_x(view_camera[0])+camera_get_view_width(view_camera[0]) - _ws
outline_text(_xx,_y+1,_s,10,9999999,c_green,1,1,80)
draw_text_color(_xx,_y,_s,c_green,c_green,c_green,c_green,1)
draw_set_halign(fa_left)
draw_set_valign(fa_top)

