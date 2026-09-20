
var r1 = color_get_red(color_start);
var g1 = color_get_green(color_start);
var b1 = color_get_blue(color_start);
var r2 = color_get_red(color_end);
var g2 = color_get_green(color_end);
var b2 = color_get_blue(color_end);

var r = lerp(r1, r2, transition_progress);
var g = lerp(g1, g2, transition_progress);
var b = lerp(b1, b2, transition_progress);

deses_color = make_color_rgb(r, g, b);
///////////////

var _box_h= 85//camera_get_view_height(view_camera[0])-box_y-textbox_sep_border //com box_y=camera+150 é 85
var _box_w=camera_get_view_width(view_camera[0])-box_x-textbox_sep_border //com box_x=camera+90 é 225

//Fundo preto
if battle_state=3{fundo_preto=1} else {fundo_preto=0}
fundo_preto_value=lerp(fundo_preto_value,fundo_preto,0.2)
var _xscale_fundo_preto_drama=camera_get_view_width(view_camera[0])/sprite_get_width(sblack)
var _yscale_fundo_preto_drama=camera_get_view_height(view_camera[0])/sprite_get_height(sblack)
draw_sprite_ext(sblack,0,camera_get_view_x(view_camera[0]),camera_get_view_y(view_camera[0]),_xscale_fundo_preto_drama,_yscale_fundo_preto_drama,0,c_white,fundo_preto_value*0.4)

///botoes
var _sep_botoes=(_box_h-sprite_get_height(sundertale_button)*3)/4
for (var i = 0; i<=2; i++) {
	var _button_x=box_x+30
	var _button_y=box_y+_sep_botoes*(i+1)+sprite_get_height(sundertale_button)*i
	if battle_state=0{
		//fazer ter animação onde se escondem
	} else if battle_state = 1{
		var _button_selected=0
		if button_select[char_select]=i{_button_selected=1}
		draw_sprite(sundertale_button,_button_selected,_button_x,_button_y)
	}
}

///Demostradres de vida e sprites dos personagens
var _hpbox_y=box_y-15
var _hpbox_w=70 //70
var _hpbox_h=20
var _hpbox_xscale= _hpbox_w/sprite_get_width(sTextbox_normal)
var _hpbox_yscale= _hpbox_h/sprite_get_height(sTextbox_normal)
for (var i = 0; i<global.party_length; i++) {
	var _sep_hp=(_box_w-_hpbox_w*global.party_length)/(global.party_length+1)
	var _hpbox_x=box_x+_sep_hp*(i+1)+_hpbox_w*i
	var _espaco_dentro_hpbox=(_hpbox_w-sprite_get_width(shp_bar))/2
	var _hpbar_x=_hpbox_x+_espaco_dentro_hpbox
	var _hpbar_y=_hpbox_y+(18-sprite_get_height(shp_bar))/2 //mesmo que a largura seja 20, 18 fica mais bonito do que 15
	
	var _cor= c_white
	var _char_spr= s_default_down
	var _menu_actions= 0
	switch (id_number[i]){
		case 0:
			_char_spr=sRecyDown //Dolissue
			_menu_actions= 0
		break
		
		case 1:
			_char_spr=ssophia_down //Lambary
			_menu_actions= 1
		break
		
		case 2:
			_char_spr=semma_down //S.N
			_menu_actions= 2
		break
	}
	if instance_exists(oenemy_attack_performer){ //colocar isso individualmente no switch acima depois, agora o sprite é generico para todos
		if oenemy_attack_performer.parrying{
			_char_spr=schar_parry_temp
		}
	}
	_cor=char_battle_info(id_number[i])
	
	//sprite dos personagens
	var _char_x=_hpbox_x+_hpbox_w/2
	var _char_y=_hpbox_y-sprite_get_height(_char_spr)/3
	
	if !end_of_battle{
		if (battle_state=0 or battle_state=1){
			if char_select=i{draw_sprite_outline(_char_spr,0,_char_x,_char_y)}
		} else if battle_state=2 and ochar_attack_performer.targeting_char{
			if ochar_attack_performer.char_select=i {draw_sprite_outline(_char_spr,0,_char_x,_char_y)}
		}
	}
	draw_sprite(_char_spr,0,_char_x,_char_y)
	
	//energias
	var _cor_fundo_medidor = fundo_medidor_cor(_cor);
	var _ener_height=20
	var _sep_ener=(_box_h-_ener_height*3)/4
	var _ener_x = box_x-box_x/2
	var _ener_y = box_y+_sep_ener*(i+1)+_ener_height*(i+1)
	var _ener= ener[i]
	var _mener= mener[i]
	
	var _number_ener_height=string_height(ener[i])
	var _number_ener_width=string_width(ener[i])
	
	if battle_state=0{ //aparece os 3 do lado da caixa
		draw_circular_bar(_ener_x,_ener_y,100,100,_cor,20,1,5,0,0,180,1)
		draw_circular_bar(_ener_x,_ener_y,_ener,_mener,_cor_fundo_medidor,20,1,5,1,0,180,1)
		if id_number[i]=2{
			if anima[i] = 0 {
			    ang_flecha[i] = (_ener / _mener) * 180
			    if ang_flecha[i] >= 180 and ciclo_hprefresh_sn[i]=0{ 
			        ang_flecha[i] = 180
			        anima[i] = 1
					ciclo_hprefresh_sn[i]=1
			    }
			} else {
			    ang_flecha[i] = lerp(ang_flecha[i], 0, 0.3)
			    if ang_flecha[i] <= (_ener / _mener) * 180 { 
			        anima[i] = 0 
			    }
			}

			draw_sprite_ext(smedidor_flecha_sn, 0, _ener_x, _ener_y, 1, 1, -ang_flecha[i], c_white, 1)
		} else {
			draw_text_outline(_ener_x-_number_ener_width/2, _ener_y-_number_ener_height, ener[i])
			draw_text(_ener_x-_number_ener_width/2, _ener_y-_number_ener_height, ener[i])
		}
			
			
	} else if battle_state=1 and char_selected=i{ //só oq está selecionado tem a energia parecendo
		_ener_y = box_y-_sep_ener
		draw_circular_bar(_ener_x,_ener_y,100,100,_cor,20,1,5,0,0,180,1)
		draw_circular_bar(_ener_x,_ener_y,_ener,_mener,_cor_fundo_medidor,20,1,5,1,0,180,1)
		
		if id_number[i]=2{
			ang_flecha[i] = (_ener / _mener) * 180
			draw_sprite_ext(smedidor_flecha_sn, 0, _ener_x, _ener_y, 1, 1, -ang_flecha[i], c_white, 1)
		} else {
			draw_text_outline(_ener_x-_number_ener_width/2, _ener_y-_number_ener_height, ener[i])
			draw_text(_ener_x-_number_ener_width/2, _ener_y-_number_ener_height, ener[i])
			
		}
			
	}
	
	//caixas pretas do Hp e cooldown uso
	draw_sprite_ext(sTextbox_back_normal,0,_hpbox_x,_hpbox_y,_hpbox_xscale,_hpbox_yscale,0,c_white,1)
	
	var _cooluso_xscale=(_hpbox_w*(cooldown_uso[i]/mcooldown_uso[i]))/sprite_get_width(sTextbox_normal)
	gpu_set_fog(true,c_white,0,0)
	draw_sprite_ext(sTextbox_back_normal,0,_hpbox_x,_hpbox_y,_cooluso_xscale,_hpbox_yscale,0,c_white,0.2)
	gpu_set_fog(false,c_white,0,0)
	
	draw_sprite_ext(sTextbox_normal,0,_hpbox_x,_hpbox_y,_hpbox_xscale,_hpbox_yscale,0,deses_color,1)
	
	//barra de vida
	var _cor_fundo = fundo_medidor_cor(_cor);
	draw_sprite_ext(shp_bar,1,_hpbar_x,_hpbar_y,1,1,0,c_white,1) 
	if slowhp[i]>=0{
		draw_sprite_ext(shp_bar,0,_hpbar_x,_hpbar_y,slowhp[i]/mhp[i],1,0,_cor_fundo,1) 
	}
	
	if hp[i]>=0{
		draw_sprite_ext(shp_bar,0,_hpbar_x,_hpbar_y,hp[i]/mhp[i],1,0,_cor,1) 
	}
	
	//Numeros de vida
	var _c=c_white
	if hp[i]<=0{_c=c_red}
	var _hp_text=abs(hp[i])
	var _hpbar_xscale= (_espaco_dentro_hpbox-4)/string_width(_hp_text)
	draw_text_transformed_colour(_hpbar_x-(_espaco_dentro_hpbox-3),_hpbar_y-1,_hp_text,_hpbar_xscale,1,0,_c,_c,_c,_c,1)

	var _hpbar_xscale= (_espaco_dentro_hpbox-4)/string_width(mhp[i])
	draw_text_transformed(_hpbar_x+sprite_get_width(shp_bar)+1,_hpbar_y-1,mhp[i],_hpbar_xscale,1,0)
	
	char_x[i]=_char_x //está aqui para os ataques inimigos saberem onde o personagem está, facilita animar
	char_y[i]=_char_y //eles não interagem em nada com esse codigo, só o _char_ faz algo
	
}

//Mostrador do desespero em ataques laranjas
if battle_state=3{
var _deses_x=_ener_x
var _deses_y=box_y-4
var _number_deses_height=string_height(deses)
var _number_deses_width=string_width(deses)
draw_circular_bar(_deses_x,_deses_y,100,100,deses_color,20,1,5,0,0,180,1)
draw_circular_bar(_deses_x,_deses_y,deses,deses_max,c_white,20,1,5,1,0,180,1)
draw_text_outline(_deses_x-_number_deses_width/2, _deses_y-_number_deses_height, deses)
draw_text(_deses_x-_number_deses_width/2, _deses_y-_number_deses_height, deses)
}
//depois adicionar a flecha

///caixa de dialogo principal
var box_xscale= _box_w/sprite_get_width(sTextbox_normal)
var box_yscale= _box_h/sprite_get_height(sTextbox_normal)
draw_sprite_ext(sTextbox_back_normal,0,box_x,box_y,box_xscale,box_yscale,0,c_white,1)
draw_sprite_ext(sTextbox_normal,0,box_x,box_y,box_xscale,box_yscale,0,deses_color,1)

///texto para selecionar magias
if choosing_spell or (battle_state=2 and id_info_tb.inv_mode=1){
	var _desc_w=70
	//desenha a classe e o desespero
	var _txt_deses=string(deses)+"% Desesperado"
	var _txt_class="< "+ string(spells_classes_name[spell_class_select[char_selected]]) + " > "
	draw_text(box_x+border,box_y+border,string(_txt_class)) //depois colocar as setas para impulsinar pro lado usado
	draw_text_color(box_x+border+string_width(_txt_class),box_y+border,string(_txt_deses),deses_color,deses_color,deses_color,deses_color,1)
	//desenha as magias em si
	var _yo=0
	for (var i=spell_min;i<spell_max;i++){
		var _li=array_length(spells_classes[char_selected][spell_class_select[char_selected]])
		var _c= c_white
		if spell_select[char_selected]=i and _li>0{
			//desenha a descrição e o custo
			var _txt_cost_ener=spells_classes[char_selected][spell_class_select[char_selected]][i].custo_ener
			
			var _custo_deses=spells_classes[char_selected][spell_class_select[char_selected]][i].custo_deses
			if spell_turbinada{_c=c_orange _custo_deses+=custo_extra_spell_turbinada} else {_c=c_yellow}
			var _txt_cost_deses=" "+string(_custo_deses)+"%"
			
			
			if _custo_deses<=0{_txt_cost_deses=""}
			var _idi=id_number[char_selected]
			var _c_cost=char_battle_info(_idi,0)
			var _spr_cost=char_battle_info(_idi,3)
			draw_text_ext(box_x+_box_w-border-_desc_w,box_y+border+10,spells_classes[char_selected][spell_class_select[char_selected]][i].desc1,10,_desc_w) //descrição
			draw_text_color(box_x+_box_w-border-_desc_w,box_y+_box_h-border-string_height(_txt_cost_ener),string(_txt_cost_ener),_c_cost,_c_cost,_c_cost,_c_cost,1) //texto ener
			draw_sprite(_spr_cost,0,box_x+_box_w-border-_desc_w+string_width(_txt_cost_ener),box_y+_box_h-border-string_height(_txt_cost_ener))//simbolo ener
			draw_text_color(box_x+_box_w-border-_desc_w+string_width(_txt_cost_ener)+sprite_get_width(_spr_cost),box_y+_box_h-border-string_height(_txt_cost_ener),string(_txt_cost_deses),deses_color,deses_color,deses_color,deses_color,1) //desespero
		}
		var _namei
		if (i<_li) and _li>0{_namei=spells_classes[char_selected][spell_class_select[char_selected]][i].name} else {_namei=""}
		draw_text_colour(box_x+border,box_y+border+10*(_yo+1),_namei,_c,_c,_c,_c,1)
		_yo++
		if _yo>spell_num-1{_yo=0}
		
	}
	
	
}


//debug
if global.debug_mode{
	var _debug_text=string(mouse_x)+"/"+string(mouse_y)+"/C.Slt:"+string(char_select)+"/C.Slted:"+string(char_selected)+"/B.State:"+string(battle_state)+"/anim_die:"+string(instance_number(oenemy_anim_die))
	draw_text_outline(camera_get_view_x(view_camera[0]),camera_get_view_y(view_camera[0]),_debug_text)
	draw_text(camera_get_view_x(view_camera[0]),camera_get_view_y(view_camera[0]),_debug_text)

	switch (number_bg){

		case 1:
			draw_text_outline(camera_get_view_x(view_camera[0]),camera_get_view_y(view_camera[0])+10,glow_power)
			draw_text(camera_get_view_x(view_camera[0]),camera_get_view_y(view_camera[0])+10,glow_power)
		break

		case 3:
			draw_text_outline(camera_get_view_x(view_camera[0]),camera_get_view_y(view_camera[0])+10,distort_power)
			draw_text(camera_get_view_x(view_camera[0]),camera_get_view_y(view_camera[0])+10,distort_power)
		
			draw_text_outline(camera_get_view_x(view_camera[0]),camera_get_view_y(view_camera[0])+20,distort_speed)
			draw_text(camera_get_view_x(view_camera[0]),camera_get_view_y(view_camera[0])+20,distort_speed)
		break
	}

	var _xx=camera_get_view_x(view_camera[0])
	var _xxx=camera_get_view_x(view_camera[0])+camera_get_view_width(view_camera[0])
	draw_line(_xx,row_y[0],_xxx,row_y[0])
	draw_line(_xx,row_y[1],_xxx,row_y[1])
	draw_line(_xx,row_y[2],_xxx,row_y[2])
	
	//draw_text(mouse_x,mouse_y,string(def[0])+"/"+string(def[1])+"/"+string(def[2]))
	//draw_text(mouse_x,mouse_y+10,spell_turbinada)
}
