if no_death_animation{sprite_index=sback_smile if timer_no_death_animation--<=0{ instance_destroy()}} //pista que não tem animação
switch (id_number){
	case 0:
	case 1:
		y+=spd
		spd+=0.2
		image_angle+=spd_angle
		if y>camera_get_view_y(view_camera[0])+camera_get_view_height(view_camera[0])+sprite_get_height(sprite_index){instance_destroy()}
	break
	
	case 2:
		if timer_tempprodois=30*10{
			image_alpha=0
			automatic_soul_animation=0
			instance_create_depth(x,y,depth-10,osoul_show)
		}
		
		if timer_tempprodois--<0{
			instance_destroy()
			part_system_destroy(my_particle_system);
			part_type_destroy(my_particle_type);
		}
	break
	
	case 3:
		if timer--<0{
			image_alpha=lerp(image_alpha,0,0.3)
			if image_alpha=0{
				instance_destroy()
				part_system_destroy(my_particle_system);
				part_type_destroy(my_particle_type);
				}
		}
	break
}