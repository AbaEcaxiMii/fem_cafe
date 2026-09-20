if instance_exists(omenu_saves){pos_chp=omenu_saves.pos_chp}
var _spr=chp_back[pos_chp]
var _xsback= camera_get_view_width(view_camera[0])/sprite_get_width(_spr)
var _ysback= camera_get_view_height(view_camera[0])/sprite_get_height(_spr)

//draw_sprite_ext(_spr,0,0,0,_xsback,_ysback,0,c_white,1) arrumar os fundos depois

if state!=2{
draw_set_halign(fa_center)
draw_set_valign(fa_middle)

if flag_reset_ani{
xtle=camera_get_view_width(view_camera[0])/2
ytle=camera_get_view_height(view_camera[0])/2
y_start=ytle
x_start=xtle
flag_reset_ani=0
}

//outline_text(xtle,ytle,"Polylute")
//draw_text(camera_get_view_width(view_camera[0])/2,camera_get_view_height(view_camera[0])/2,ytle)
draw_text_outline(xtle,ytle,"No F")
draw_text(xtle,ytle,"No F")
}

draw_set_halign(fa_left)
draw_set_valign(fa_top)

