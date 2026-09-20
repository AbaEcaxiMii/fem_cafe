grv=-6
speed=-grv
direction=random_range(70,110) //75 105 //55 85

timer=0

image_speed=0
pt = part_system_create();
pt_clone = part_type_create();

// Configurar partícula com SPRITE
part_type_sprite(pt_clone, sexp, 0, 0, 1);
//part_type_subimage(pt_clone,1)
//part_type_blend(pt_clone, 1);  // brilho
part_system_depth(pt, depth+10);

part_type_size(pt_clone, 1, 1.2, -0.01, 1); // Encolhe
part_type_alpha3(pt_clone, 1, 0.8, 0);
part_type_speed(pt_clone, 1, 3, 0, 0);
part_type_direction(pt_clone, 240, 300, 0, 0);
part_type_gravity(pt_clone, 0.1, 270);
part_type_life(pt_clone, 20, 40);

play_enemie_sfx(sfx_enemies_deathnew_part2)