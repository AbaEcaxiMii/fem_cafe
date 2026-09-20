//Eu sei que tudo diz que é neve, mas é areia caindo, eu só coloco que é neve pois fiz o efeito baseado em snowflakes
layer_create(-room_height-50,"neve")
snow_sys = part_system_create_layer("neve", false);

// 2. Cria o tipo de partícula (o floco de neve)
snow_type = part_type_create();
part_type_shape(snow_type, pt_shape_pixel); // Use pt_shape_disk para flocos redondos
part_type_size(snow_type, 1, 2, 0, 0); // Tamanho
part_type_color1(snow_type, #fcede5);
part_type_alpha3(snow_type, 0.5, 1, 0); // Começa opaco, termina transparente
part_type_life(snow_type, 200, 999); // Tempo de vida dos flocos

part_type_gravity(snow_type, 0, 270);
part_type_speed(snow_type, 0.5, 1.5, 0, 0);
part_type_direction(snow_type, 250, 290, 0, 5);

// 3. Cria o emissor que gera a neve
snow_emitter = part_emitter_create(snow_sys);
part_emitter_region(snow_sys, snow_emitter, 0, room_width, 0, 0, ps_shape_rectangle, ps_distr_linear);
part_emitter_interval(snow_sys, snow_emitter, 5, 20, 1);
part_emitter_stream(snow_sys, snow_emitter, snow_type, 2)

instance_create_depth(x,y,depth,osnowflake2)