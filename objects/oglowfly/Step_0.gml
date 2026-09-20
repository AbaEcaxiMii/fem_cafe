if timer--<0 and !(speed < 0.5){
	part_type_subimage(efeito_type, image_index)
	timer=timer_max
var _emit = part_emitter_create(efeito_sys);
part_emitter_region(efeito_sys, _emit, x, x, y, y, ps_shape_ellipse, ps_distr_linear);
part_emitter_burst(efeito_sys, _emit, efeito_type, 1);
part_emitter_destroy(efeito_sys, _emit);
}
