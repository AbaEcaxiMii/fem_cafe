x=lerp(x,oPlayer.x,0.4)
y=lerp(y,oPlayer.y-(oPlayer.sprite_height/2)-10,0.4)
depth=-room_height

text_length=string_length(name_list[name_pos])+1
if draw_char<text_length
{
	draw_char+=text_speed
	draw_char=clamp(draw_char,0,text_length)
}

//desaparecer apos completar nome
if draw_char=text_length{cool_btw-- if cool_btw<=0{image_alpha-=0.1}}

//proximo nome

if draw_char=text_length and image_alpha<=0{
	name_pos++ draw_char=0
	if name_pos=array_length(name_list){instance_destroy()}
	image_alpha=1 cool_btw=cool_btw_ini y=oPlayer.y
}