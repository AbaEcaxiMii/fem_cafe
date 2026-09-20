 
//draw_rectangle(x-20,y-20,x+20,y+20,true)
if global.podedano=false{
	damage_effect=1
}else{
	damage_effect=0
}

var _draw_self=0

if damage_effect{
dd++
	if (dd%4)=0{_draw_self=1} else {_draw_self=0}
	
} else {dd=0 _draw_self=1}

if _draw_self{draw_self()}

//draw_text(x,y,$"{camera_get_view_width(view_camera[0])}\n{camera_get_view_height(view_camera[0])}")