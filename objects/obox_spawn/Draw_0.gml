if setup_box{
	switch(id_box){
		case 0: //caixa simples
			var _box_fundo_w=(radius_box*2+border*2)/sprite_get_width(sbox_back)
			var _box_fundo_h=(radius_box*2+border*2)/sprite_get_height(sbox_back)
			draw_sprite_ext(sbox_back,0,x_center,y_center,_box_fundo_w,_box_fundo_h,0,c_white,box_alpha)
		break
		
		case 1: //diagonal simples
			var _box_fundo_w=(radius_box*2+border*2)/sprite_get_width(sbox_back)
			var _box_fundo_h=(radius_box*2+border*2)/sprite_get_height(sbox_back)
			draw_sprite_ext(sbox_back,0,x_center,y_center,_box_fundo_w,_box_fundo_h,45,c_white,box_alpha)
			draw_text(mouse_x,mouse_y,point_distance(mouse_x,mouse_y,x_center,y_center))
		break
	}
}
