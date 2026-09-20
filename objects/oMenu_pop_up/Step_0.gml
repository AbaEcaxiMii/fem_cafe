width=string_width(text)+op_border*2
height=string_height(text)+op_border*2
atvx=camera_get_view_x(view_camera[0])+camera_get_view_width(view_camera[0])/2 - (width)/2
atvy=camera_get_view_y(view_camera[0])+op_space+(height+op_space)*pos

resx=atvx
resy=camera_get_view_y(view_camera[0])- (height)

target_x=atvx
target_y=atvy

if !instance_exists(oMenu_level_up){timer=0}

if timer--<=0{
	image_alpha-=0.1
	if image_alpha=0{instance_destroy()}
	target_x=resx
	target_y=resy
}

x=lerp(x,target_x,0.2)
y=lerp(y,target_y,0.2)
