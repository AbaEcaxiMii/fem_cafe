var _spawn=0
var _lim=array_length(place)
if instance_number(ocliente)<_lim{time+=1}
if time >= 60 and can_spawn {
    var _free = [];
    for (var i = 0; i < _lim; i++) { //checa por lugares livres
        if !position_meeting(place[i][0], place[i][1], ocliente){
            array_push(_free, i);
        }
    }
    
    // Só spawna se houver espaço vazio
    if array_length(_free) > 0 {
        var _spawn_index = irandom_range(0, array_length(_free) - 1);
        var _pos = _free[_spawn_index];
        instance_create_depth(place[_pos][0], place[_pos][1], depth, ocliente);
    }
    time = 0;
	ff=_free
}

