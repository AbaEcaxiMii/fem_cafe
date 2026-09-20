var _cam_x=camera_get_view_x(view_camera[0])
var _cam_y=camera_get_view_y(view_camera[0])
var _cam_w=camera_get_view_width(view_camera[0])
var _cam_h=camera_get_view_height(view_camera[0])

draw_text_outline(0,0,"Aperte Z para evitar que o texto troque")
draw_text(0,0,"Aperte Z para evitar que o texto troque")

// No evento Draw
if (!surface_exists(surf)) {
    surf = surface_create(_cam_w, _cam_h);
	surf2 = surface_create(_cam_w, _cam_h);
}

	
surface_set_target(surf) //Desenha um retangulo preto na tela e corta a parte onde o vidro está, deixando um furo em forma do vidro

draw_set_color(c_black)
draw_rectangle(_cam_x,_cam_y,_cam_w, _cam_h,0)
draw_set_color(-1)//padrão
	
gpu_set_blendmode(bm_subtract)
draw_sprite_ext(sprite_index,1,x,y,1,1,angle,c_white,1)
gpu_set_blendmode(bm_normal)
	
spr_custom = sprite_create_from_surface(surf, _cam_x,_cam_y,_cam_w, _cam_h, false, false, 0, 0);
//transforma surface num sprite
	
surface_reset_target()
	
surface_set_target(surf2) //desenha os textos checar e subtrai onde está preto, a unica parte que aparece e onde tem o recorte do vidro

for (var ii = 0; ii<instance_number(obattle_enemy); ii++) {
	var _inst=instance_find(obattle_enemy,ii)
	var _text_status=array_create(0)
	var _alpha_t=0
		
	if _inst=enemy_to_check{_alpha_t=1}
	alpha_check[ii]=lerp(alpha_check[ii],_alpha_t,0.2)
		
	array_push(_text_status,$"''{_inst.name}''")
	array_push(_text_status,"HP:"+string(_inst.hp)+"/"+string(_inst.mhp))
	array_push(_text_status,"ATK:"+string(_inst.atk))
	array_push(_text_status,"DEF:"+string(_inst.def))
	array_push(_text_status,"SPD:"+string(_inst.spd))
	array_push(_text_status,string(_inst.ty1.name)+"/"+string(_inst.ty2.name))

	var _string_w=0
	var _string_h=(border*3+string_height(_text_status[0])+(array_length(_text_status)-1)*space)//deixei border*3 pq fica melhor do que border*2
	//calcula o tamanho da caixa
	for (var i = 0; i<array_length(_text_status); i++){
		var _text=string(_text_status[i])
		if string_width(_text)>_string_w{_string_w=string_width(_text)}
	}
	_string_w+=border*2
	
	//desenha a caixa
	var _xs= _string_w/sprite_get_width(textbox_spr)
	var _ys= _string_h/sprite_get_height(textbox_spr)
		
	var _x_origin=_inst.x-_string_w/2
	var _y_origin=_inst.y-_string_h/2

	var _x=_x_origin+border
	var _y=_y_origin+border
	
	draw_sprite_ext(textbox_spr_back,0,_x_origin,_y_origin,_xs,_ys,0,c_white,alpha_check[ii])
	draw_sprite_ext(textbox_spr,0,_x_origin,_y_origin,_xs,_ys,0,c_white,alpha_check[ii])

	//escreve o texto

	for (var i = 0; i<array_length(_text_status); i++){
		var _text=string(_text_status[i])
		draw_text_colour(_x,_y+space*i,_text,c_white,c_white,c_white,c_white,alpha_check[ii])
	}
}
	
gpu_set_blendmode(bm_subtract)
draw_sprite(spr_custom,0,_cam_x,_cam_y)
gpu_set_blendmode(bm_normal)
	
surface_reset_target()
	
draw_surface(surf2,0,0)
draw_sprite_ext(sprite_index,0,x,y,1,1,angle,c_white,1) //desenha o vidro para ser visivel
surface_free(surf);
surface_free(surf2);


