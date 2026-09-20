up_key=keyboard_check_pressed(global.up)
down_key=keyboard_check_pressed(global.down)
left_key=keyboard_check_pressed(global.left)
right_key=keyboard_check_pressed(global.right)
accept_key=keyboard_check_pressed(global.confirmar)
cancel_key=keyboard_check_pressed(global.cancelar)

anima++

//texto brilhante
if (transitioning) {
    timer += 1;
    transition_progress = timer / transition_time;
    
    if (transition_progress >= 1) {
        transition_progress = 1;
        timer = 0;
        transitioning = false;
        // Troca de cor
        var temp = color_start;
        color_start = color_end;
        color_end = temp;
        transition_progress = 0;
        transitioning = true;
    }
}
//
if instance_exists(oMenu_status){ending=oMenu_status.ending pos=oMenu_status.pos} else {ending=1}
if ending{tx=resx ty=resy} else {tx=atvx ty=atvy}

x=lerp(x,tx,0.4) y=lerp(y,ty,0.4)
y=clamp(y,atvy,resy)
//x=clamp(x,atvx,resx)
if ending and x<=resx+1{instance_destroy()}

charm_quanti=array_length(global.charms[global.party_members[pos].id_number])
rolando_y+=2 //precisa ser par
charm_sep=round((camera_get_view_height(view_camera[0])-40*charm_quanti)/(charm_quanti+1))
if rolando_y>=(40+charm_sep)*charm_quanti{restart_rolamento=1} //melhorar depois

if restart_rolamento{
	rolando_y=0

	restart_rolamento=0
}

///////retirado do primor
//if !ending{oMenu_health.dark_mode=1 oMenu_health.pos_other=pos}
//if cancel_key{ending=1}
//if accept_key and !ending{ending=1 }//instance_create_depth(x,y,depth-1,oMenu_equip,{member: oParty_manager.party_members[pos],pos_m: pos})}