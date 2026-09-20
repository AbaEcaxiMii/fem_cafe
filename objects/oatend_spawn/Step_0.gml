if place_meeting(x,y,ointeragir) and talk=0 and not instance_exists(oTextbox){
	create_textbox("text") talk=1
}

if talk and !instance_exists(oTextbox) and not instance_exists(otransicao){
	global.can_move = false
var inst2 = instance_create_depth(0,0, -99999, oloja_manager)

inst2.target_x=oPlayer.x
inst2.target_y=oPlayer.y
inst2.target_rm=room
inst2.target_dir=oPlayer.player_dir
inst2.rm_atend=target_rm

var inst = instance_create_depth(0,0, -99999, otransicao)

inst.target_x=target_x
inst.target_y=target_y
inst.target_rm=target_rm
inst.target_dir=target_dir

}

//Nota: Quanto MENOR o depth, mais na frenete o negocio fica