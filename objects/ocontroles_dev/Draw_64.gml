if pausado
{
    if (sprite_pause != -1)
    {
        draw_sprite_stretched(sprite_pause, 0, 0, 0, camera_get_view_width(view_camera[0]), camera_get_view_height(view_camera[0]));
    }
    _x=camera_get_view_width(view_camera[0])/2
	_y=camera_get_view_height(view_camera[0])/2
	draw_sprite_ext(sblack,0,0,0,25,20,0,c_white,0.7)
	draw_set_halign(fa_center)
	draw_set_valign(fa_middle)
	draw_text_outline(_x,_y+1,"Pause")
	draw_text(_x,_y,"Pause")
	var _sep=10 var _w=180
	var _h=string_height_ext(msg[msg_i],_sep,_w)
	draw_text_outline(_x,_y+11+_h/2,msg[msg_i],_sep,_w)
	draw_text_ext(_x,_y+10+_h/2,msg[msg_i],_sep,_w)
	draw_set_valign(fa_top)
	draw_set_halign(fa_left)
} else if room_warp_activation {
	//camera_get_view_width(view_camera[0])
	var _xscale=140/sprite_get_width(sblack)
	var _yscale=camera_get_view_height(view_camera[0])/sprite_get_height(sblack)
	draw_sprite_ext(sblack,0,camera_get_view_width(view_camera[0]),0,-_xscale,_yscale,0,c_white,0.5)
	draw_set_halign(fa_right)
	var _x_room=camera_get_view_width(view_camera[0])
	var _y_room=0//camera_get_view_height(view_camera[0])
	draw_text(_x_room,_y_room,"Room Warp")
	for (var i = 0; i<array_length(room_warp_array); i++) {
		var _c=c_white
		if room_select=i{_c=c_yellow}
		draw_text_color(_x_room,_y_room+10+10*i, room_get_name(room_warp_array[i]),_c,_c,_c,_c,1)
	}
	//depois colocar sistema mais avançado com min max quando tiver mais salas
	
	draw_set_halign(fa_left)
}

