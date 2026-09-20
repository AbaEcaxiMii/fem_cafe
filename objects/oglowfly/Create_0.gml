depth=-room_height-80
image_speed = 0.5;//0.5
direction = random(360);
speed = 1;
friction = 0.05;
alarm[0] = 20;

timer_max=5
timer=timer_max

efeito_sys = part_system_create();
efeito_type = part_type_create();

part_system_depth(efeito_sys, depth);

part_type_sprite(efeito_type, sprite_index, false, false, false);
part_type_subimage(efeito_type, image_index)
part_type_size(efeito_type, 1, 1.5, 0.01, 1);      // começa no tamanho 1, cresce 0.02 por passo
part_type_alpha3(efeito_type, 0.1, 0.5, 0);          // opaco -> transparente
part_type_life(efeito_type, 20, 20);             // ~1 segundo a 30 FPS
part_type_speed(efeito_type, 0, 0, 0, 0);        // parado no lugar
part_type_direction(efeito_type, 0, 0, 0, 0);
part_type_gravity(efeito_type, 0, 270);
part_type_blend(efeito_type, 1);  // brilho

