grv=0.1
gravity=-grv
direction=random_range(40,120) //75 105 //55 85
speed=2

pt = part_system_create();
pt_clone = part_type_create();

// Configurar partícula com SPRITE
part_type_sprite(pt_clone, sprite_index, 0, 0, 1);
part_type_alpha3(pt_clone, 0.7, 0.3, 0);
part_type_life(pt_clone, 20, 40);
part_type_size(pt_clone, 0.9, 1.1, -0.01, 1);
part_type_blend(pt_clone, 1);  // brilho
part_system_depth(pt, depth+10);

play_sfx(sfx_battle_perfect_TEMP)