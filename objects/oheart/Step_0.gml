//if global.delay_text_bug>0{global.delay_text_bug-=1} agora está no ocontroles_dev
//if keyboard_check_pressed(ord("I")){capa = !capa}
//obox_coli=Parede inpermeavél, obox_coli2=Dano se não estiver com dash

right_key = 0
left_key = 0
up_key = 0
down_key = 0
dash_key = 0

if can_move{
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

if (_move_x!=0 or _move_y!=0) and can_move{
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


///Colisão

	//obox_coli

var _stopdash=0
var _subpixel= 0.5
if place_meeting(x+xspd,y,obox_coli){
	var _pixelcheck=_subpixel*sign(xspd)
	while !place_meeting(x+_pixelcheck,y,obox_coli){x+=_pixelcheck}
	xspd=0
}

if place_meeting(x,y+yspd,obox_coli){
	var _pixelcheck=_subpixel*sign(yspd)
	while !place_meeting(x, y+_pixelcheck,obox_coli){y+=_pixelcheck}
	yspd=0
}

if can_move = true{
	x += xspd
	y += yspd
	x=clamp(x,camera_get_view_x(view_camera[0])+sprite_width/2,camera_get_view_x(view_camera[0])+camera_get_view_width(view_camera[0])-sprite_width/2)
	y=clamp(y,camera_get_view_y(view_camera[0])+sprite_height/2,camera_get_view_y(view_camera[0])+camera_get_view_height(view_camera[0])-sprite_height/2)
}

if place_meeting(x,y,obox_coli){

var _colisoes_ids = ds_list_create();
var _num_colisoes = instance_place_list(x, y, obox_coli, _colisoes_ids, false);

	if (_num_colisoes > 0){
		for (var i = 0; i < _num_colisoes; i++;){
			var _inst = _colisoes_ids[|i];
			var dir = point_direction(_inst.x, _inst.y, x, y);
			var dist = 5;

			// Tenta empurrar oheart para fora
			if _inst.move_angle!=0 or _inst.image_angle_follow{
				for (var i = 0; i < 8; i++){
				    var novo_x = x + lengthdir_x(dist, dir + i * 45);
				    var novo_y = y + lengthdir_y(dist, dir + i * 45);
    
				    if (!place_meeting(novo_x, novo_y, _inst)) {
				        x = novo_x;
				        y = novo_y;
				        break;
				    }
				}
			}
	    }
	}

	ds_list_destroy(_colisoes_ids);
	
}



