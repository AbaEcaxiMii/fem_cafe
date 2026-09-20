
if !flag_draw{exit}
draw_self()
var _c=c_blue
//draw_rectangle_color(bbox_left,bbox_top,bbox_right,bbox_bottom,_c,_c,_c,_c,true)
var _dis_char=camera_get_view_width(view_camera[0])/(oParty_manager.party_length+1)
for(var i=0;i<oParty_manager.party_length;i++){
draw_set_halign(fa_center)
draw_set_valign(fa_middle)
var _c = c_orange
//+wave(-2,2,0.025,0)
	var _alpha=1
	if dark_mode{_alpha=0.5 if i=pos_other{_alpha=1}}
	//draw_text(camera_get_view_x(view_camera[0])+ _dis_char*(i+1),y+(h_primor/2),oParty_manager.party_members[i].name)
	//mostra a cara
	draw_sprite_ext(oParty_manager.party_members[i].icon,0,camera_get_view_x(view_camera[0])+ _dis_char*(i+1),y+(h_primor/3),1,1,0,c_white,_alpha)
	//mostrar vida
	var _x=camera_get_view_x(view_camera[0])+ _dis_char*(i+1)
	var _y=y+(h_primor/3)+10
	var _s=string(oParty_manager.party_members[i].hp)+"/"+string(oParty_manager.party_members[i].mhp)
	outline_text(_x,_y+1,_s,10,99999999,c_white,1,1)
	draw_text(_x,_y,_s)
	//mostrar ten
	var _s="("+string(round(oParty_manager.party_members[i].ten))+"%)"
	outline_text(_x,_y+11,_s,10,99999999,_c,1,1)
	draw_text_color(_x,_y+10,_s,_c,_c,_c,_c,1)

draw_set_valign(fa_top)
draw_set_halign(fa_left)
}
//draw_text(x,y-10,_dis_char)
//draw_text(x,y-10,pos_other)
