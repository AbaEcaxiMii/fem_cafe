draw_self()
draw_sprite_ext(sBlack2,0,camera_get_view_x(view_camera[0]),camera_get_view_y(view_camera[0]),8,4,0,c_white,alpha)
if !instance_exists(oTextbox){alpha=lerp(alpha,ta,0.15)}
