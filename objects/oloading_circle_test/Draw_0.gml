transition_progress = val / val_max;

var r1 = color_get_red(color_start);
var g1 = color_get_green(color_start);
var b1 = color_get_blue(color_start);
var r2 = color_get_red(color_end);
var g2 = color_get_green(color_end);
var b2 = color_get_blue(color_end);

var r = lerp(r1, r2, transition_progress);
var g = lerp(g1, g2, transition_progress);
var b = lerp(b1, b2, transition_progress);

var _cc = make_color_rgb(r, g, b);
///////////////

val+=1
draw_pie(mouse_x ,mouse_y , val, 100, _cc, 10, 1)
if val>=100{val=0}

