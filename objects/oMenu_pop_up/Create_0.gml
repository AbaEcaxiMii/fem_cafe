width=1
height=1
op_border=8
op_space=6

width=string_width(text)+op_border*2
height=string_height(text)+op_border*2

atvx=camera_get_view_x(view_camera[0])+camera_get_view_width(view_camera[0])/2 - (width)/2

resx=atvx
resy=camera_get_view_y(view_camera[0])- (height)

x=resx
y=resy
target_x=x
target_y=y

timer=30*4