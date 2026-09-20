if global.delay_text_bug>0{global.delay_text_bug--}
var _pl=global.party_length
follow_timer--
follow_timer=clamp(follow_timer,0,follow_timer_ini)
if follow_timer<=0 and spawn_follow=1 and not instance_exists(ofollower){
with oPlayer{
for(var i=array_size-1;i>=0;i--){
	pos_x[i]=x
	pos_y[i]=y
	toRecordSprite[i]=sprite_index
	toRecord_Xscale[i]= image_xscale
}
followers_spawner()
}
spawn_follow=0
}

global.party_length=array_length(global.party_members)

if global.party_length!=_pl and global.party_length>1{
with oPlayer{
for(var i=array_size-1;i>=0;i--){
	pos_x[i]=x
	pos_y[i]=y
	toRecordSprite[i]=sprite_index
	toRecord_Xscale[i]= image_xscale
}
followers_spawner()
}

} else if global.party_length!=_pl and global.party_length=1 {instance_destroy(ofollower)}

/////
//	for(var i=0;i<array_length(global.playable_members_total);i++){
//		global.playable_members_total[i].hp=clamp(global.playable_members_total[i].hp,-99999999,global.playable_members_total[i].mhp)
//	}

//def=global.party_members[0].def
//ty1=global.types_list.normal ty2=global.types_list.normal

//if global.battle_mode{dmg=0} //se entrar em batalha o dmg do over é anulado

//if dmg > 0{
//	if cooldown_dano_res--<0{
//	global.party_members[0].hp--
//	dmg --
//	cooldown_dano_res=global.party_members[0].def
//	}
//}

//reescrever codigo de dano overworld

if global.podedano=false{
	inviframes +=1
	if inviframes > global.invi_frames{
	inviframes = 0
	global.podedano=true
	}
}	

time_play++

if time_play>29{time_play=0 t_sec++}

if t_sec>59{
	t_sec=0
	t_min++
}

if t_min>59{
	t_min=0
	t_hour++
}