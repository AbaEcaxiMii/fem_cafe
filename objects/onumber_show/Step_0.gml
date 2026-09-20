if mode=0{
image_alpha-=0.02
if (vspeed<0) image_alpha=1.0
if (y>ystart) vspeed=0
if (image_alpha<=0) instance_destroy()
} else if mode=1{
	var _yy=camera_get_view_y(view_camera[0])+ (camera_get_view_height(view_camera[0]))
	if (y>_yy) instance_destroy()
} else if mode=2{
	gravity=-grv
	var _yy=camera_get_view_y(view_camera[0])
	if (y<_yy) instance_destroy()
} else if mode=3{
	if m3_t=0{direction=90 m3_t=1}
image_alpha-=0.02
if (vspeed<0) image_alpha=1.0
if (y>ystart) vspeed=0
if (image_alpha<=0) instance_destroy()
}