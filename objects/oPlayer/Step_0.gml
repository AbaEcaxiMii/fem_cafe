//if global.delay_text_bug>0{global.delay_text_bug-=1} agora está no ocontroles_dev
//if keyboard_check_pressed(ord("I")){capa = !capa}
//oWall=Parede inpermeavél, oWall2=Dano se não estiver com dash
depth= -bbox_bottom

right_key = 0
left_key = 0
up_key = 0
down_key = 0
dash_key = 0

if global.can_move{
right_key = keyboard_check(global.right)
left_key = keyboard_check(global.left)
up_key = keyboard_check(global.up)
down_key = keyboard_check(global.down)
} 

//Correr
if global.auto_correr=0{
if keyboard_check(global.correr){move_spd = run_spd}else{move_spd = normal_spd}
} else if global.auto_correr{
if keyboard_check(global.correr){move_spd = normal_spd}else{move_spd = run_spd}
}

walkspd=move_spd

var _move_x=(right_key - left_key)
var _move_y=(down_key-up_key)

if place_meeting(x,y,owarp){ //or placemeting oelevador
	state=0 
}

if (_move_x!=0 or _move_y!=0) and global.can_move{
player_dir=point_direction(0,0,_move_x,_move_y)
}

if (_move_x)!=0 or (_move_y)!=0{
	var _len = point_distance(0,0,_move_x,_move_y)
	_move_x/=_len
	_move_y/=_len
}



//Movimentação
	xspd=_move_x*move_spd
	yspd=_move_y*move_spd

//animação
mask_index=sdown

if global.can_move=true{
	if yspd=0{		
if xspd>0{
		_sface = sright
		_imface=1
}

if xspd<0{
		_sface = sleft
		_imface=xscale
}
			}

if xspd>0 && (_sface=sleft and _imface=xscale){_sface=sright _imface=1}
if xspd<0 && (_sface=sright and _imface=1){_sface=sleft _imface=xscale}

	if xspd=0{
if yspd>0{
		_sface = sdown
		_imface=1
}

if yspd<0{
		_sface = sup
		_imface=1
}
			}
if yspd>0 && _sface=sup{_sface=sdown _imface=1}
if yspd<0 && _sface=sdown{_sface=sup _imface=1}
sprite_index=_sface
image_xscale=_imface
}


///Colisão
if !global.debug_mode{
	//owall
	
var _stopdash=0
var _subpixel= 0.5
if place_meeting(x+xspd,y,owall){
	var _pixelcheck=_subpixel*sign(xspd)
	while !place_meeting(x+_pixelcheck,y,owall){x+=_pixelcheck}
	xspd=0
	if state=1{_stopdash=1}
}

if place_meeting(x,y+yspd,owall){
	var _pixelcheck=_subpixel*sign(yspd)
	while !place_meeting(x, y+_pixelcheck,owall){y+=_pixelcheck}
	yspd=0
	if state=1{_stopdash=1}
}

if place_meeting(x,y,owall){move_outside_solid(0,0)}

if _stopdash{audio_play_sound(WallBump,2,false) screen_shake(2,8) state=0 dashener=0 Ajeitardash()}
					}


if xspd=0 and yspd=0{
	image_index=0
} else {image_speed=1}

if global.can_move = true{
	x += xspd
	y += yspd
	}
	
if (x!=xprevious or y!=yprevious){
	follower_activity=1
	for(var i=array_size-1;i>0;i--){
		
		pos_x[i]=pos_x[i-1]
		pos_y[i]=pos_y[i-1]
		toRecordSprite[i]=toRecordSprite[i-1]
		toRecord_Xscale[i]= toRecord_Xscale[i-1]
	}
	pos_x[0]=x
	pos_y[0]=y
	//toRecordSprite[0]= sprite_index
	toRecordSprite[0]= sprite_index
	toRecord_Xscale[0]= image_xscale
	
}


//analisa se ele está em um lugar seguro pra respawnar

//if distance_to_object(owall2)>= 30 and state=0 and not place_meeting(x,y,oplata_pos) and not place_meeting(x,y,oenemy_overworld) and global.can_move{
//global.dashx=oPlayer.x
//global.dashy=oPlayer.y
//}

//Machuca o player se ele encostar em um buraco sem dash
//if place_meeting(x,y,owall2) and state=0 and not place_meeting(x,y,oplata_pos){
//if oParty_manager.party_members[0].hp>10{hurt_foe_ext(oParty_manager,20,1)}
//x=global.dashx
//y=global.dashy
//Ajeitardash()
//}

if keyboard_check_pressed(global.menu_key) and !instance_exists(oMenu) and global.can_move=1{global.can_move=0 try_menu=1 ocamera._lerp_spd=0.6}
if try_menu{if try_menu_timer--<0{try_menu=0 try_menu_timer=mtry_menu_timer ocamera._lerp_spd=ocamera._lerp_spd_ini instance_create_depth(x,y,depth,oMenu)}}
//o timer e a mudança na velocidade da camera é para evitar gaps no menu
if keyboard_check_pressed(global.confirmar) and global.can_move and not instance_exists(ointeragir){
	instance_create_depth(x,y+sprite_height/3,depth-1,ointeragir,{image_angle: player_dir, idp:id})
}

if object_exists(oTextbox) and global.can_move=false{
	image_speed=0
	image_index=0
}

////////////////



