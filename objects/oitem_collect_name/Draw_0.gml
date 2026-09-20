draw_set_valign(fa_middle)
draw_set_halign(fa_center)

var _drawtext= string_copy(name_list[name_pos],1,draw_char)

draw_text_color(x+1,y,_drawtext,c_black,c_black,c_black,c_black,image_alpha)
draw_text_color(x-1,y,_drawtext,c_black,c_black,c_black,c_black,image_alpha)
draw_text_color(x,y-1,_drawtext,c_black,c_black,c_black,c_black,image_alpha)
draw_text_color(x,y+1,_drawtext,c_black,c_black,c_black,c_black,image_alpha)
draw_text_color(x,y,_drawtext,c_white,c_white,c_white,c_white,image_alpha)
//draw_text_color(x,y-10,text_length,c_white,c_white,c_white,c_white,1)



draw_set_valign(fa_top)
draw_set_halign(fa_left)