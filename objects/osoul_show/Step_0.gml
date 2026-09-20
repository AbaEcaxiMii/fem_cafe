var _yy=-1000
if (y<_yy) {instance_destroy() part_system_destroy(pt) part_type_destroy(pt_clone) exit}

if timer--<=0 and y>0{ //efeito fantasma
timer=2

var hue = irandom(360);
var color = make_color_hsv(hue, 255, 255);
var rot = irandom_range(-2,2)

//part_type_colour1(pt_clone, color);
part_type_orientation(pt_clone, 0, 360, rot, 0, 1);
part_particles_create(pt, x, y, pt_clone, 1);

}