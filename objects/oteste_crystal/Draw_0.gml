// No evento Create


// No evento Draw
if (!surface_exists(surf)) {
    surf = surface_create(room_width, room_height);
	surf2 = surface_create(room_width, room_height);
}

	
	surface_set_target(surf)
	
	//tudo escrito aqui vai ser desenhado na superficie
	
	//draw_text(mouse_x,mouse_y,"AAAAAAAA")
	
	//gpu_set_blendmode(bm_subtract)
	draw_set_color(c_black)
	draw_set_alpha(1)
	draw_rectangle(0,0,100,100,0)
	//gpu_set_blendmode(bm_normal)
	
	draw_set_color(-1) //-1 = padrão
	draw_set_alpha(1)
	
	gpu_set_blendmode(bm_subtract)
	//draw_circle(oPlayer.x+xx,oPlayer.y+yy,size,0)
	//gpu_set_blendmode(bm_add)
	draw_sprite(icon_recy,0,10,10)
	gpu_set_blendmode(bm_normal)
	
	spr_custom = sprite_create_from_surface(surf, 0, 0, 100, 100, false, false, 0, 0);
	
	surface_reset_target()
	
	
	surface_set_target(surf2)
	//draw_surface(luz_surf,0,0)
	draw_text(mouse_x,mouse_y,"AAAAAAAA")
	gpu_set_blendmode(bm_subtract)
		draw_sprite(spr_custom,0,0,0)
	gpu_set_blendmode(bm_normal)
	surface_reset_target()
	
	draw_surface(surf2,0,0)
surface_free(surf);
surface_free(surf2);
