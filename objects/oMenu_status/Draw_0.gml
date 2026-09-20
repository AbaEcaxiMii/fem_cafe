if !flag_draw{exit}
atvx=camera_get_view_x(view_camera[0])+camera_get_view_width(view_camera[0])/1.5 - (width)/2
atvy=camera_get_view_y(view_camera[0])+camera_get_view_height(view_camera[0])/2 - (height)/2
if status_mode{atvy+=10}

resx=camera_get_view_x(view_camera[0])+camera_get_view_width(view_camera[0])/2 + (width)
resy=atvy
draw_set_valign(fa_top)
draw_set_halign(fa_left)
draw_sprite_ext(back_sprite,image_index,x,y,width/sprite_width,height/sprite_height,0,image_blend,global.trans_back_menus)
draw_sprite_ext(sprite_index,image_index,x,y,width/sprite_width,height/sprite_height,0,image_blend,1)
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

_cc = make_color_rgb(r, g, b);
///////////////

///////retirado do primor

anim_frame += anim_speed

draw_sprite_ext(sspike_block,anim_frame,desc_x,desc_y,desc_xscale,desc_yscale,0,c_white,1)
if (anim_frame >= anim_total) {anim_frame = 0} else if anim_frame <= 0{anim_frame = anim_total}

if status_mode=1{charms_draw()} else {show_status_draw()}

//draw_text(mouse_x,mouse_y,string(charm_select)+"/"+string(array_length(global.charms_gallery)))

for (var i=0;i<array_length(global.charms[global.party_members[pos].id_number]);i++){
	draw_text(mouse_x,mouse_y+10*i,global.charms[global.party_members[pos].id_number][i].name)
}

