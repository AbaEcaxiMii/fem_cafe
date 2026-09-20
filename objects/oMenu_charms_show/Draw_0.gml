if !flag_draw{exit}
atvx=camera_get_view_x(view_camera[0])+width
atvy=camera_get_view_y(view_camera[0])

resx=camera_get_view_x(view_camera[0])
resy=atvy
draw_set_valign(fa_top)
draw_set_halign(fa_left)
var _dis_res = distance_to_point(resx,resy)
//draw_text(x,y-10,y) draw_text(x+50,y-10,resy)

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

///////retirado do primor
draw_self()

//normais
for (var i=0;i<array_length(global.charms[global.party_members[pos].id_number]);i++){
	draw_sprite_ext(global.charms[global.party_members[pos].id_number][i].spr,0,x-6-width/2-20,y+(rolando_y-(40+charm_sep)*charm_quanti)+(40+charm_sep)*i,1,1,0,c_white,1)
	draw_sprite(global.charms[global.party_members[pos].id_number][i].spr,0,x-6-width/2-20,y+rolando_y+(40+charm_sep)*i)

}
