image_angle+=8
gravity=-grv
var _yy=-50
if (y<_yy) {instance_destroy() part_system_destroy(pt) part_type_destroy(pt_clone) exit}

if (speed > 0 or hspeed != 0 or vspeed != 0) and y>0 { //efeito fantasma

var hue = irandom(360);
var color = make_color_hsv(hue, 255, 255);

part_type_colour1(pt_clone, color);
part_particles_create(pt, x, y, pt_clone, 1);

}