no_death_animation=1 //não tem animação de morte
timer_no_death_animation=10
automatic_soul_animation=1
sprite_index=dying_sprite
switch (id_number){
	case 0:
	case 1:
		no_death_animation=0
		spd=0
		spd_angle=choose(-1,1)
	break
	
	case 2:
	case 3:
		timer_tempprodois=30*10
		timer=30
		no_death_animation=0
		
		my_particle_system = part_system_create();
		my_particle_type = part_type_create();

		
		part_type_shape(my_particle_type, pt_shape_cloud);
		part_type_size(my_particle_type, 0.3, 0.3, 0, 0);
		part_type_colour1(my_particle_type, c_white);
		part_type_alpha3(my_particle_type, 1, 0.5, 0);
		part_type_speed(my_particle_type, 2, 4, 0, 0);
		part_type_direction(my_particle_type, 0, 180, 0, 0);
		part_type_gravity(my_particle_type, 0.1, 270);
		part_type_life(my_particle_type, 30, 30);
		part_system_depth(my_particle_system, depth-10)
		
		part_particles_create(
	    my_particle_system,  
	    x, y,
	    my_particle_type,
	    50 + random(30)
		);
	break
}