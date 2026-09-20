if !flag_draw{exit}
atvx=camera_get_view_x(view_camera[0])+sprite_height
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
//draw_text(x,y,"A")

up_key=keyboard_check_pressed(global.up)
down_key=keyboard_check_pressed(global.down)
left_key=keyboard_check_pressed(global.left)
right_key=keyboard_check_pressed(global.right)
accept_key=keyboard_check_pressed(global.confirmar)
cancel_key=keyboard_check_pressed(global.cancelar)

if instance_exists(oMenu_status){pos=oMenu_status.pos}
var _member= oParty_manager.party_members[pos]
var _act= oParty_manager.acts[_member.actions]
op_length= array_length(_act)

if left_key or right_key {pos_act=0}

var _sound_pos= pos_act
pos_act += down_key - up_key
if pos_act >= op_length {pos_act=0}
if pos_act < 0 {pos_act= op_length-1}
if (_sound_pos!= pos_act and op_length>1){
	audio_play_sound(snd_menumove_ch1,100,false)	 
 }

draw_set_halign(fa_center)
draw_set_valign(fa_middle)

for(var i=0;i<op_length;i++){
	var _c=c_white if i=pos_act{_c=_cc}
	draw_text_color(x-88,y+10+10*i,string(_act[i].name),_c,_c,_c,_c,1)
}
//162.33 é a w total IMPORTANTE 88 o centro considerando os 7 pixeis dos espinhos

var _selec=_act[pos_act].sprite
var _con=_act[pos_act].contac
if _con{_con="Contato"} else {_con="Distância"}

draw_text(x-130,y+120,string(_act[pos_act].fo)+string("%"))

draw_sprite(sUIbattle_selector_background,0,x-88,y+120)
draw_sprite(_selec,0,x-88,y+120)

draw_text_transformed(x-40,y+120,_con,0.8,0.8,0)

draw_set_valign(fa_top)
draw_set_halign(fa_left)

draw_text_ext_transformed(x-160,y+130,_act[pos_act].desc,10,186,0.8,0.8,0)

draw_set_valign(fa_top)
draw_set_halign(fa_left)


