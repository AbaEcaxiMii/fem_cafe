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
//if cancel_key{ending=1}
if ending{tx=resx ty=resy} else {tx=atvx ty=atvy
	if not instance_exists(oMenu_charms_show){instance_create_depth(x,y,depth,oMenu_charms_show)}
	}
var _dis_res = distance_to_point(resx,resy)

x=lerp(x,tx,0.4) y=lerp(y,ty,0.4)
y=clamp(y,atvy,resy)
//x=clamp(x,atvx,resx)
if ending and x<=resx+1{instance_destroy()}

///////retirado do primor
var _sound_pos= pos
pos+= right_key - left_key
if pos >= oParty_manager.party_length {pos=0}
if pos < 0 {pos= oParty_manager.party_length-1}
if _sound_pos!= pos{
	 audio_play_sound(snd_menumove_ch1,100,false)	 
 }
 
if !ending{oMenu_health.dark_mode=1 oMenu_health.pos_other=pos}
if cancel_key{ending=1}
if accept_key and !ending{ending=1 instance_create_depth(x,y,depth-11,oMenu_equip,{member: oParty_manager.party_members[pos],pos_m: pos})}

if !status_ready{status_ready=1}
st_pos=0
status_show=oParty_manager.party_members[pos]
status[st_pos]="Atk:" + string(status_show.atk)
st_pos++
status[st_pos]="AtkE:" + string(status_show.atke)
st_pos++
status[st_pos]="Def:" + string(status_show.def)
st_pos++
status[st_pos]="Res:" + string(status_show.res)
st_pos++
status[st_pos]="TenP:" + string(status_show.ten_level)
st_pos++
status[st_pos]="Spd:" + string(status_show.spd)
st_pos++
status[st_pos]=string(status_show.ty1.name)+" / "+ string(status_show.ty2.name)
st_pos++
status[st_pos]=string(status_show.name)+" - "+ string(status_show.desc)
st_pos++
status[st_pos]=oitem_manager.invp[status_show.actions,0].spr //8
st_pos++
status[st_pos]=oitem_manager.invp[status_show.actions,1].spr
st_pos++
status[st_pos]=oitem_manager.invp[status_show.actions,2].spr
st_pos++
status[st_pos]=oitem_manager.invp[status_show.actions,3].spr
st_pos++
status[st_pos]=oitem_manager.invp[status_show.actions,4].spr //12
st_pos++
status[st_pos]="|Arma Principal|" //13
st_pos++
status[st_pos]=string(oitem_manager.invp[status_show.actions,0].name)
st_pos++
status[st_pos]="|Arma|"
st_pos++
status[st_pos]=string(oitem_manager.invp[status_show.actions,1].name)
st_pos++
status[st_pos]="|Armadura 1|"
st_pos++
status[st_pos]=string(oitem_manager.invp[status_show.actions,2].name)
st_pos++
status[st_pos]="|Armadura 2|"
st_pos++
status[st_pos]=string(oitem_manager.invp[status_show.actions,3].name)
st_pos++
status[st_pos]="|Armadura 3|"
st_pos++
status[st_pos]=string(oitem_manager.invp[status_show.actions,4].name) //22
st_pos++
status_spr[0]=s_status_atk
status_spr[1]=s_status_atke
status_spr[2]=s_status_def
status_spr[3]=s_status_res
status_spr[4]=s_status_tenp
status_spr[5]=s_status_spd
st_length= array_length(status)