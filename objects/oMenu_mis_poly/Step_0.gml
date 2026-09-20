up_key=keyboard_check_pressed(global.up)
down_key=keyboard_check_pressed(global.down)
left_key=keyboard_check_pressed(global.left)
right_key=keyboard_check_pressed(global.right)
accept_key=keyboard_check_pressed(global.confirmar)
cancel_key=keyboard_check_pressed(global.cancelar)
a_key=keyboard_check_pressed(global.Botaodash)

animation+=0.1
if animation>100{animation=0}

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
if ending{tx=resx ty=resy} else {tx=atvx ty=atvy}
var _dis_res = distance_to_point(resx,resy)

x=lerp(x,tx,0.3) y=lerp(y,ty,0.6)
y=clamp(y,atvy,resy)
if ending and y>=resy-1{instance_destroy()}

///////retirado do primor

var _sound_pos_mis= pos_mis
var _sound_pos_txt= pos_mis_txt

pos_mis += down_key - up_key
pos_mis_txt += right_key - left_key

if (down_key - up_key)!=0{pos_mis_txt=0}

if pos_mis >= array_length(global.mission_inv) {pos_mis=0 _min=0 _max=_num}
if pos_mis < 0 {pos_mis= array_length(global.mission_inv)-1
	for(var i=0;i<9999;i++){
		var _tnum=_num*i
		if _tnum>= array_length(global.mission_inv){_max=_tnum _min=_max-_num i=9999}
	}
	}

if pos_mis>=_max{_min+=_num _max+=_num} else if pos_mis<_min{_min-=_num _max-=_num}

pos_mis_txt=clamp(pos_mis_txt,0,omission_manager.mis_prog[pos_mis])

if _sound_pos_mis!= pos_mis{
	 audio_play_sound(snd_menumove_ch1,100,false)	 
 }
 
 if _sound_pos_txt!= pos_mis_txt  {
	 audio_play_sound(snd_menumove_ch1,100,false)	 
 }
 
if cancel_key{ending=1}