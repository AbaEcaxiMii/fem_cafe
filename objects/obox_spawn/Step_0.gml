x_center=camera_get_view_x(view_camera[0])+camera_get_view_width(view_camera[0])/2
y_center=camera_get_view_y(view_camera[0])+camera_get_view_height(view_camera[0])/3

if setup_box{ //bullet patterns
	var _box_alpha_target=1
	if not box_turn_on{_box_alpha_target=0.5}
	box_alpha=lerp(box_alpha,_box_alpha_target,0.2)
	switch(id_box){
		case 2:
			angle_box++
			
			var _x_right=x_center+lengthdir_x(radius_box+border,0+angle_box)
			var _y_right=y_center+lengthdir_y(radius_box+border,0+angle_box)
			var _x_left=x_center+lengthdir_x(radius_box+border,180+angle_box)
			var _y_left=y_center+lengthdir_y(radius_box+border,180+angle_box)
			var _x_up=x_center+lengthdir_x(radius_box+border,90+angle_box)
			var _y_up=y_center+lengthdir_y(radius_box+border,90+angle_box)
			var _x_down=x_center+lengthdir_x(radius_box+border,270+angle_box)
			var _y_down=y_center+lengthdir_y(radius_box+border,270+angle_box)
			
			wall_right.x=_x_right
			wall_right.y=_y_right
			wall_left.x=_x_left
			wall_left.y=_y_left
			wall_up.x=_x_up
			wall_up.y=_y_up
			wall_down.x=_x_down
			wall_down.y=_y_down
			
			oheart.x=clamp(oheart.x, x_center+lengthdir_x(radius_box+border,180),x_center+lengthdir_x(radius_box+border,0))
			oheart.y=clamp(oheart.y,y_center+lengthdir_y(radius_box+border,90),y_center+lengthdir_y(radius_box+border,270))
			
		break
	}
	
} else { //boxes
	instance_create_depth(x_center,y_center,heart_depth,oheart)
	var _w=(camera_get_view_width(view_camera[0])/2)-sprite_get_width(sbox_light_goal)
	var _h=(camera_get_view_height(view_camera[0])/2)-sprite_get_height(sbox_light_goal)
	var _x_light=x_center+(irandom_range(-_w,_w))
	var _y_light=y_center+(irandom_range(-_h,_h))
	instance_create_depth(_x_light,_y_light,light_depth,obox_light_goal)
	
	switch(id_box){
		case 0: //caixa simples
			radius_box=40
		
			wall_right=instance_create_depth(x_center+radius_box,y_center,depth,obox_battle)
			wall_left=instance_create_depth(x_center-radius_box,y_center,depth,obox_battle)
			wall_up=instance_create_depth(x_center,y_center-radius_box,depth,obox_battle)
			wall_down=instance_create_depth(x_center,y_center+radius_box,depth,obox_battle)
			
			wall_right.box_h=radius_box*2
			wall_left.box_h=wall_right.box_h
			wall_up.box_w=radius_box*2
			wall_down.box_w=wall_up.box_w
			
			wall_right.x+=wall_right.box_w/2
			wall_left.x-=wall_left.box_w/2
			wall_down.y+=wall_down.box_h/2
			wall_up.y-=wall_up.box_h/2
			
		break
		
		case 1: //diagonal simples
			radius_box=40
			var _x_right=x_center+lengthdir_x(radius_box+border,45)
			var _y_right=y_center+lengthdir_y(radius_box+border,45)
			var _x_left=x_center+lengthdir_x(radius_box+border,135)
			var _y_left=y_center+lengthdir_y(radius_box+border,135)
			var _x_up=x_center+lengthdir_x(radius_box+border,225)
			var _y_up=y_center+lengthdir_y(radius_box+border,225)
			var _x_down=x_center+lengthdir_x(radius_box+border,315)
			var _y_down=y_center+lengthdir_y(radius_box+border,315)

			wall_right=instance_create_depth(_x_right,_y_right,depth,obox_battle)
			wall_left=instance_create_depth(_x_left,_y_left,depth,obox_battle)
			wall_up=instance_create_depth(_x_up,_y_up,depth,obox_battle)
			wall_down=instance_create_depth(_x_down,_y_down,depth,obox_battle)

			wall_right.image_angle=45
			wall_left.image_angle=135
			wall_up.image_angle=225
			wall_down.image_angle=315

			wall_right.box_h=radius_box*2
			wall_left.box_h=wall_right.box_h
			wall_up.box_h=radius_box*2
			wall_down.box_h=wall_up.box_h
			
		break
		
		case 2: //diagonal girando (funciona mais ou menos, não usar por enquanto)
			radius_box=40
			angle_box=0
			
			var _x_right=x_center+lengthdir_x(radius_box+border,0+angle_box)
			var _y_right=y_center+lengthdir_y(radius_box+border,0+angle_box)
			var _x_left=x_center+lengthdir_x(radius_box+border,180+angle_box)
			var _y_left=y_center+lengthdir_y(radius_box+border,180+angle_box)
			var _x_up=x_center+lengthdir_x(radius_box+border,90+angle_box)
			var _y_up=y_center+lengthdir_y(radius_box+border,90+angle_box)
			var _x_down=x_center+lengthdir_x(radius_box+border,270+angle_box)
			var _y_down=y_center+lengthdir_y(radius_box+border,270+angle_box)

			wall_right=instance_create_depth(_x_right,_y_right,depth,obox_battle)
			wall_left=instance_create_depth(_x_left,_y_left,depth,obox_battle)
			wall_up=instance_create_depth(_x_up,_y_up,depth,obox_battle)
			wall_down=instance_create_depth(_x_down,_y_down,depth,obox_battle)

			wall_right.image_angle_follow=1
			wall_left.image_angle_follow=1
			wall_up.image_angle_follow=1
			wall_down.image_angle_follow=1

			wall_right.box_h=radius_box*2
			wall_left.box_h=wall_right.box_h
			wall_up.box_h=radius_box*2
			wall_down.box_h=wall_up.box_h
			
		break
		
		case 3: //nada
			instance_create_depth(x_center,y_center,heart_depth,oheart)
		break
	}
	
	setup_box=1 //avisar que a box já foi ajeitada
}


