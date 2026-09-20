if place_meeting(x,y,oPlayer) and not instance_exists(otransicao) and target_rm!=0{
	//criar a trans na camada certa
	global.can_move = false
var inst = instance_create_depth(0,0, -99999, otransicao)
inst.target_x=target_x
inst.target_y=target_y
inst.target_rm=target_rm
inst.target_dir=target_dir
}

//Nota: Quanto MENOR o depth, mais na frenete o negocio fica