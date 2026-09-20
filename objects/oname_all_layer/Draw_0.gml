var a = layer_get_all()
for (var i=0;i<array_length(a);i++){
	draw_text(camera_get_view_x(view_camera[0])+10,camera_get_view_y(view_camera[0])+10+(10*i),layer_get_name(a[i]))
}