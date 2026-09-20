_lerp_spd_ini=0.4
_lerp_spd=_lerp_spd_ini

reso_select=0
reso_a=0
resow[0]=0
resoh[0]=0
resosc[0]=0
function reso_new(_w,_h,_multi=1,_sc=1){
	resow[reso_a]=_w* _multi
	resoh[reso_a]=_h* _multi
	resosc[reso_a]=_sc
	reso_a++
}

//reso_new(1366,768,1,3)
//reso_new(1280,600)
//reso_new(640,480,1,2) //original
reso_new(640,480,1,2)

zoom=1
zoom_target=1


resolution_width= resow[reso_select]
resolution_height= resoh[reso_select]
resolution_scale = resosc[reso_select] //quando maior, mais zoom
global.view_width= resolution_width/resolution_scale
global.view_height= resolution_height/resolution_scale
view_target= oPlayer
window_set_size(global.view_width*resolution_scale,global.view_height*resolution_scale)
surface_resize(application_surface,global.view_width,global.view_height)
display_set_gui_size(global.view_width,global.view_height)
shake_length=0
shake_time=0

//640,480 deltarune
//640,360

//800 600
//1024 768
//1280 600
//1280 720
//1280 768
//1360 768
//1366 768

