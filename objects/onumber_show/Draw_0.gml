draw_set_halign(fa_center)
draw_set_valign(fa_middle)
if type_msg=0{
draw_text_outline(x,y+1,msg,10,999999,c_black,image_alpha)
draw_text_color(x,y,msg,c,c,c,c,image_alpha)
} else if type_msg=1{
	draw_sprite_ext(msg,0,x,y,1,1,0,c_white,image_alpha)
}
draw_set_halign(fa_left)
draw_set_valign(fa_top)