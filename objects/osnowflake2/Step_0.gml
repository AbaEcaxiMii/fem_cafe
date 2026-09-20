//part_type_color1(snow_type, c_aqua);


part_emitter_region(snow_sys, snow_emitter, 0, room_width, room_height/2, room_height/2, ps_shape_rectangle, ps_distr_linear);
part_type_life(snow_type, 200, room_height)
snow_emitter = part_emitter_create(snow_sys);
