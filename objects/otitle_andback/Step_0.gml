if state!=2{
if ytle>(y_start+max_ydis){target_yspd=-yvel} else if ytle<(y_start-max_ydis){target_yspd=yvel}
if xtle>(x_start+max_xdis){target_xspd=-xvel} else if xtle<(x_start-max_xdis){target_xspd=xvel}
yspd=lerp(yspd,target_yspd,lerp_vel)
xspd=lerp(xspd,target_xspd,lerp_vel)
ytle+=yspd
xtle+=xspd
}

if keyboard_check_pressed(global.confirmar) and state=0{state=1}

if state=1{ytle-=20 if ytle<=-20{ state=2 instance_create_depth(x,y,depth-10,omenu_saves,{proposito_save_load: 1})}}


