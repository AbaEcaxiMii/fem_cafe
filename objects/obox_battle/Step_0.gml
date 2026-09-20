image_xscale=box_w/sprite_get_width(sprite_index)
image_yscale=box_h/sprite_get_height(sprite_index)

image_angle+=move_angle
if image_angle_follow{image_angle=point_direction(x,y,obox_spawn.x_center,obox_spawn.y_center)}
vel_x = lengthdir_x(move_spd, move_dir);
vel_y = lengthdir_y(move_spd, move_dir)
motion_set(move_dir,move_spd)

if place_meeting(x,y,oheart){
	oheart.x+=vel_x
	oheart.y+=vel_y
}