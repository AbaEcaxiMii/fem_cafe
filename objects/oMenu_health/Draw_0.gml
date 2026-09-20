
if !flag_draw{exit}
draw_self()
var _c=c_blue
//draw_rectangle_color(bbox_left,bbox_top,bbox_right,bbox_bottom,_c,_c,_c,_c,true)
var _dis_char=camera_get_view_width(view_camera[0])/(global.party_length+1)
for(var i=0;i<global.party_length;i++){
draw_set_halign(fa_center)
draw_set_valign(fa_middle)
//+wave(-2,2,0.025,0)
	var _alpha=1
	if dark_mode{_alpha=0.5 if i=pos_other{_alpha=1}}
	//draw_text(camera_get_view_x(view_camera[0])+ _dis_char*(i+1),y+(h_primor/2),oParty_manager.party_members[i].name)
	//mostra a cara
	var _x=camera_get_view_x(view_camera[0])+ _dis_char*(i+1)
	var _y=y+(h_primor/2)
	draw_sprite_ext(global.icon_health[global.party_members[i].id_number],0,_x,_y,1,1,0,c_white,_alpha)
	//mostrar vida
	var _s1="HP\n"+string(global.party_members[i].mhp)
	var _s2="EN\n"+string(global.party_members[i].mener) //trocar os valores depois para fg sp etc...
	//draw_text_outline(_x,_y+1,_s,10,9999,c_white,1,1)
	var _c = c_green
//	draw_text_outline(_x-10-string_width(_s1)/2,_y,_s1,10,9999,_c,1,1)
	draw_text_colour(_x-10-string_width(_s1)/2,_y,_s1,_c,_c,_c,_c,1)
	_c = char_battle_info(global.party_members[i].id_number)
//	draw_text_outline(_x+10+string_width(_s2)/2,_y,_s2,10,9999,_c,1,1)
	draw_text_colour(_x+10+string_width(_s2)/2,_y,_s2,_c,_c,_c,_c,1)
	_c = c_white
//	draw_text_outline(_x,_y+12,string(global.party_members[i].name),10,9999,c_white,1,1)
	draw_text(_x,_y+12,string(global.party_members[i].name))

draw_set_valign(fa_top)
draw_set_halign(fa_left)
}
//draw_text(x,y-10,_dis_char)
//draw_text(x,y-10,pos_other)
