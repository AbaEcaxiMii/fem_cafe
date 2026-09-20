y_primor=camera_get_view_y(view_camera[0])+camera_get_view_height(view_camera[0])
resy=y_primor
resy2=y_primor-7
atvy=y_primor-h_primor

if instance_exists(oMenu){ending=oMenu.ending} else {ending=1}
if ending {mode=0}//é destruido pelo omenu

var _ny
if mode=1{_ny=atvy} else {if ending{_ny=resy} else {_ny=resy2}}
x=camera_get_view_x(view_camera[0])
y= lerp(y,_ny,vel)
if ending{vel+=0.05} else {vel=0.4}

if instance_exists(oMenu){depth=oMenu.depth}

var _dis=point_distance(camera_get_view_x(view_camera[0]),y,camera_get_view_x(view_camera[0]),camera_get_view_y(view_camera[0])+camera_get_view_height(view_camera[0]))
image_yscale=(_dis)/sprite_get_height(sprite_index)
image_xscale=camera_get_view_width(view_camera[0])/sprite_get_width(sprite_index)