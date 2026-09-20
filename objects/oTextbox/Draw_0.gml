if !flag_draw{exit}
draw_set_valign(fa_top)
draw_set_halign(fa_left)
global.can_move = false
if instance_exists(oloja_mouse){oloja_mouse.mouse_can_move=0}
image_speed=1
	confirm_key = keyboard_check_pressed(global.confirmar)
	skip_key = keyboard_check(global.cancelar)
	superskip_key = keyboard_check(global.menu_key)
//txty=150
textbox_x = camera_get_view_x(view_camera[0])+camera_get_view_width(view_camera[0])/2 - (textbox_width)/2
if dial_mode=2 {textbox_x=camera_get_view_x(view_camera[0])+90}
//nada

if camera_get_view_x(view_camera[0]) != camerax or camera_get_view_y(view_camera[0]) != cameray{setup=false}

//setup
if(setup = false) {
	setup=true
	draw_set_valign(fa_top)
	draw_set_halign(fa_left)

	//loop das paginas
	page_number = array_length(text)
	for (var p = 0; p < page_number; p++){
		
		//Achar quantas letras a em cada pag e anotar o valor
		text_length[p]=string_length(text[p])
		if dial_mode=2{textbox_y[p] = 150} else {textbox_y[p] = local[p]}
		portrait_x_offset[p] = 42
		text_x_offset[p]=70
		//78
		if speaker[p] == noone {
			text_x_offset[p] =0
			//17
		}
		line_width[p] = textbox_width - border*2.3 -text_x_offset[p]
		
		//setar char individuais e achar onde as linhas deveriam quebrar
		for (var c=0;c<text_length[p];c++){
			var _char_pos=c+1
			
			//colocar(achar) os char no "char" array
			char[c,p]=string_char_at(text[p], _char_pos)
			//pegar a largura atual da linha
			var _txt_up_to_char=string_copy(text[p],1, _char_pos)
			var _current_txt_w = string_width(_txt_up_to_char) - string_width(char[c,p])
			//pegar o ultimo espaço livre
			if char[c,p] == " " { last_free_space=_char_pos+1 }
			//pegar as linhas quebradas
			if _current_txt_w-line_break_offset[p]>line_width[p]
			{
				line_break_pos[line_break_num[p] , p ] = last_free_space
				line_break_num[p]++
				var _txt_up_to_last_space = string_copy(text[p],1,last_free_space)
				var _last_free_space_string = string_char_at(text[p],last_free_space)
				line_break_offset[p]=string_width(_txt_up_to_last_space) - string_width(_last_free_space_string)
			}
			
		}
			
		//pegar cada char coordenadas
		for (var c=0; c<text_length[p];c++)
		{
			var _lo=local[p]
			if dial_mode!=0{_lo=150}
			textbox_y[p] =camera_get_view_y(view_camera[0]) + _lo
			var _char_pos = c+1
			var _txtb_x= textbox_x + text_x_offset[p] + border
			var _txtb_y= textbox_y[p] + border
			//pegar a largura atual da linha
			var _txt_up_to_char=string_copy(text[p],1, _char_pos)
			var _current_txt_w = string_width(_txt_up_to_char) - string_width(char[c,p])
			var _txt_line=0
			//compensar pelas linhas quebradas
			for (var lb=0;lb<line_break_num[p];lb++)
			{
				//se a o char loop atual é apos uma linha quebrada
				if _char_pos>= line_break_pos[lb,p]
				{
					var _str_copy = string_copy(text[p],line_break_pos[lb,p], _char_pos-line_break_pos[lb,p])
					_current_txt_w= string_width(_str_copy)
					//gravar a linha que esse char deveria estar
					_txt_line=lb+1
				}
			}
			//adicionar o x e y coordenadas baseadas na nova info
			char_x[c,p]=_txtb_x+_current_txt_w
			char_y[c,p]=_txtb_y+_txt_line*line_sep
		}
		
	}
}

if not sfx_play and play_sfx_textbox[page]!=noone{
play_sfx(play_sfx_textbox[page])
sfx_play=1
}
//digitando o texto
made_sound=0
var _pausetext=0
if text_pause_timer <=0{
if draw_char < text_length[page] {
	cool_draw_char+=text_speed[draw_char, page]
	if cool_draw_char>=1{
	draw_char++
	snd_count++
	cool_draw_char=0
	}
	draw_char = clamp(draw_char, 0, text_length[page])
	
	text_pause_time = 10 //tempo de pausa padrão
	
	var _check_char = string_char_at(text[page],draw_char)
	if dial_mode!=2{
		if _check_char=="." or _check_char=="," or _check_char=="?"  or _check_char=="!" {_pausetext=1}
		if pause_text[draw_char,page]>0{text_pause_time = pause_text[draw_char,page]  _pausetext=1}
	}
	
	
	
	if _pausetext
	{
		text_pause_timer = text_pause_time
	} else {
		//typing sound
		if snd_count> snd_delay[page]{
			snd_count=0
			made_sound=1
			if _check_char!=" " and !inv_mode{audio_play_sound(snd[page],10,false)}
		}
	}
}
} else {
	text_pause_timer--
}

//if superskip_key and can_superskip--<0{
//	draw_char = text_length[page]
//	if (option_number>0 and page<page_number-1) or option_number<=0{
		//proxima pag
//		if page<page_number-1{
//			if type_text[page]="inv_fast"{
//					if cool_type_inv_text--<0{next_page_text()} else {inv_mode=1}
//				} else if type_text[page]!="inv"{next_page_text()}
//		} else {
//			global.can_move=true
//			instance_destroy()
//		}
//	}
//}


//desenhar a box
var _txtb_x= textbox_x + text_x_offset[page]
//só usa quando tem cara adaptação
var _txtb_y= textbox_y[page]
txtb_image += txtb_image_spd
//if txtb_image>5{txtb_image=0}
txtb_sprite_w = sprite_get_width(txtb_sprite)
txtb_sprite_h = sprite_get_height(txtb_sprite)
if inv_mode=0 and fundo[page] and dial_mode=0{ //desenhar o fundo só no textbox do overworld
draw_sprite_ext(txtb_back_sprite, txtb_image,textbox_x,_txtb_y,textbox_width/txtb_sprite_w, textbox_height/txtb_sprite_h,0,c_white,global.trans_back_menus)
draw_sprite_ext(txtb_sprite, txtb_image,textbox_x,_txtb_y,textbox_width/txtb_sprite_w, textbox_height/txtb_sprite_h,0,c_white,1)
}
if draw_char == text_length[page] and inv_mode=0 and option_number=0 and dial_mode!=2{ //desenhar a seta no over ou se um personagem esta falando na batalha
	//seta quando termina o dialogo
	animation+=0.1
	draw_sprite(send_text_seta,animation,textbox_x+textbox_width-10,textbox_y[page]+textbox_height-10)
}

//Nome do personagem encima da caixa
if speaker_name[page]!=noone and inv_mode=0{
	var _name=speaker_name[page]
	var _height=-10
	var _sww=(border*2+string_width(_name))/sprite_get_width(txtb_sprite)
	var _tt=0.8
if fundo[page]=1 and dial_mode=0{ ///só escrever o nome do personagem no overworld
draw_sprite_ext(txtb_back_sprite,txtb_image,textbox_x,textbox_y[page]-border/2-txtb_sprite_h*_tt,_sww,_tt,0,c_white,global.trans_back_menus)
draw_sprite_ext(txtb_sprite,txtb_image,textbox_x,textbox_y[page]-border/2-txtb_sprite_h*_tt,_sww,_tt,0,c_white,1)
}
draw_text_outline(textbox_x+border,textbox_y[page]-border/2-txtb_sprite_h*_tt+border/2,_name)
draw_text(textbox_x+border,textbox_y[page]-border/2-txtb_sprite_h*_tt+border/2,_name)
//draw_text(textbox_x,textbox_y[page]+_height,_name)
}
		


//opções
if dial_mode=0{
	
if option_number>0 and page>=page_number-1 and draw_char = text_length[page]{
	option_rot++
	option_alpha = clamp(option_alpha + 0.2,0,1)
	if draw_char >= text_length[page] && page==page_number-1{
var _sound_option_pos =  option_pos
	//seletor de opções
var _upm=0 if _txtb_y<=128{_upm=1}

if (keyboard_check_pressed(global.down) - keyboard_check_pressed(global.up))!=0 and option_wait_input=1{option_wait_input=0}

if option_wait_input=0{
	
	if _upm{
	option_pos += keyboard_check_pressed(global.up) - keyboard_check_pressed(global.down)
	} else {
option_pos += keyboard_check_pressed(global.down) - keyboard_check_pressed(global.up)}
//option_pos=clamp(option_pos,0,option_number-1)
if option_pos >= option_number {option_pos=0}
if option_pos < 0 {option_pos= option_number-1}

if option_pos != _sound_option_pos {play_sfx(snd_menumove_ch1)}
	}
	
					}
	//desenhar as opções
	var _op_space=20
	//15
	var _op_bord=8
	//4
	var _op_bw=25
	for (var op=0; op < option_number; op++)
	{
		//desenhar a caixa das opções
		var _o_w=string_width(option[op])+_op_bord*2
		if _upm{
		draw_sprite_ext(txtb_back_sprite,txtb_image,textbox_x +_op_bw,(_txtb_y + textbox_height + _op_space*(option_number-1)-(_op_space*op)),_o_w/txtb_sprite_w,((_op_space)/txtb_sprite_h)-0.04,0,c_white,txtb_back_alpha*option_alpha)
		draw_sprite_ext(txtb_sprite,txtb_image,textbox_x +_op_bw,(_txtb_y + textbox_height + _op_space*(option_number-1)-(_op_space*op)),_o_w/txtb_sprite_w,((_op_space)/txtb_sprite_h)-0.04,0,c_white,option_alpha)
		} else {
		draw_sprite_ext(txtb_back_sprite,txtb_image,textbox_x +_op_bw,(_txtb_y - _op_space*option_number+(_op_space*op)),_o_w/txtb_sprite_w,((_op_space)/txtb_sprite_h)-0.04,0,c_white,txtb_back_alpha*option_alpha)
		draw_sprite_ext(txtb_sprite,txtb_image,textbox_x +_op_bw,(_txtb_y - _op_space*option_number+(_op_space*op)),_o_w/txtb_sprite_w,((_op_space)/txtb_sprite_h)-0.04,0,c_white,option_alpha)
		}
		
		//Desenhar a seta
if option_pos == op
{
	var _op_y_seta=(_txtb_y - _op_space*option_number+_op_space*op)+10
	if _upm{_op_y_seta=(_txtb_y + textbox_height + _op_space*(option_number-1)-(_op_space*op))+10}
draw_sprite_ext(stiro_atkc,0,textbox_x + _op_bw - sprite_get_width(stiro_atkc)/2 - 5,_op_y_seta,1,1,option_rot,image_blend,option_alpha)
//draw_sprite(stiro_atkc,0,textbox_x + 78-22,(_txtb_y - _op_space*option_number+_op_space*op)-2)
} 

	var _op_y
		//desenhar texto opção
		if _upm{
			_op_y=(_txtb_y+ textbox_height +_op_space*(option_number-1)-(_op_space*op)+((sprite_get_height(txtb_sprite)*(_op_space)/txtb_sprite_h)/3))-3
		} else {
			_op_y=(_txtb_y-_op_space*option_number+_op_space*op+((sprite_get_height(txtb_sprite)*(_op_space)/txtb_sprite_h)/3))-3
		}
		draw_text_outline(textbox_x + _op_bw +_op_bord,_op_y,option[op],10,999999,c_white,1,1)	
		draw_text_ext_color(textbox_x + _op_bw +_op_bord, _op_y,option[op],1,99999999999,c_white,c_white,c_white,c_white,option_alpha)

}
} else {
	option_alpha = clamp(option_alpha - 0.03,0,1)
}

}

//desenhar a cara
if speaker[page] != noone{
	sprite_index=speaker[page]
	if text_pause_timer<=0{
	txtb_image_spd_speaker= 0.2
	txtb_image_speaker+=txtb_image_spd_speaker
	} else {txtb_image_speaker=0}
	if draw_char>=text_length[page]{txtb_image_speaker=0}
	var _speaker_x=textbox_x+portrait_x_offset[page]
	if inv_mode=0{
	draw_sprite_ext(sprite_index,txtb_image_speaker,_speaker_x,_txtb_y+(textbox_height/2),55/sprite_width,55/sprite_height,0,image_blend,1)
	}
}

//desenhar o texto
for(var c=0;c<draw_char;c++){
	
	//coisas especiais
	//wave text
	var _float_y=0
	if float_text[c,page] == true
	{
		float_dir[c,page] += 6
		_float_y=dsin(float_dir[c,page])*flo[c,page]
	}
	//shake text
	var _shake_x=0
	var _shake_y=0
	if shake_text[c,page] == true
	{
		shake_timer[c,page]--
		if shake_timer[c,page] <= 0{
			shake_timer[c,page] = irandom_range(4,8)
			shake_dir[c,page]=irandom(360)
		}
		if shake_timer[c,page] <= 3{
		_shake_x=lengthdir_x(1,shake_dir[c,page])
		_shake_y=lengthdir_y(1,shake_dir[c,page])
		}
	}
	
	//o texto
	if inv_mode=0{
	var _ty
	var _outc
	if dial_mode=0 {_outc=col_1[c,page] _ty=1} else {_outc=c_black _ty=0}
	draw_text_outline(char_x[c,page] + _shake_x,char_y[c,page] + _float_y + _shake_y,char[c,page],10,9999999,_outc,1,_ty)	
	draw_text_color(char_x[c,page] + _shake_x,char_y[c,page] + _float_y + _shake_y,char[c,page],col_1[c,page],col_2[c,page],col_3[c,page],col_4[c,page],1)
	if icon_text[c,page] != noone{draw_sprite_ext(icon_text[c,page],0,char_x[c,page] + _shake_x,char_y[c,page] + _float_y + _shake_y,1,1,0,c_white,1)}
	}
}

//mudar a pag
if dial_mode!=2{

if type_text[page]="inst"{global.can_move=true instance_destroy()}
if type_text[page]="nor" or type_text[page]="fast" or type_text[page]="inv_fast"{
	
	if (type_text[page]="fast" or type_text[page]="inv_fast") and ((option_number>0 and page<page_number-1) or option_number<=0){
		if draw_char == text_length[page] {
		//proxima pag
			if page<page_number-1{
				if type_text[page]="inv_fast"{
					if cool_type_inv_text--<0{next_page_text()} else {inv_mode=1}
				} else {next_page_text()}
			} else{
				global.can_move=true
				instance_destroy()
			}
		}
	}
	
if superskip_key and can_superskip--<=0 { 
	if (option_number>0 and page=page_number-1) {draw_char = text_length[page]} else {confirm_key=1 skip_key=1}
	}
	
	
if confirm_key and (type_text[page]="nor"){
	//se já terminou de digitar
	if draw_char == text_length[page] {
		//proxima pag
		if page<page_number-1{
			next_page_text()
		} else {
			//link do text pras opções
			if option_number>0 and option_wait_input=0{
				play_sfx(snd_select_ch1)
				create_textbox(option_link_id[option_pos])
				instance_destroy()
				} else if option_number<=0{
					instance_destroy()
					global.can_move=true
				}
			
		}
	}
}

} else if type_text[page]="long" {
	if draw_char = text_length[page]
	{
			if cool_type_long_text--<0{
			if page<page_number-1{
				next_page_text()
			} else {
				global.can_move=true
				instance_destroy()
			}
		}
	}
}

if (confirm_key or superskip_key) and type_text[page]="inv"{
	if superskip_key{draw_char = text_length[page]}
	//se já terminou de digitar
	if draw_char == text_length[page] {
		//proxima pag
		if page<page_number-1{
				_cool_type_inv_text_manger=1
		} else {
			global.can_move=true
			instance_destroy()
		}
	}
	
}

if _cool_type_inv_text_manger{if cool_type_inv_text--<0{next_page_text()} else {inv_mode=1}}

if skip_key and draw_char != text_length[page]{
	//encher o texto
	draw_char = text_length[page]
}
	
}

//draw_text(textbox_x,camera_get_view_y(view_camera[0]) + 232,"Char:"+string(draw_char)+" /Page:"+ string(page)+" /Total:"+ string(page_number)+" /Option:"+ string(char_y))
//draw_text(textbox_x,textbox_y[page],string(type_text[page]) +"/" + string(cool_type_inv_text))
//draw_text(textbox_x,textbox_y[page],string(pause_text[draw_char,page]))
camerax= camera_get_view_x(view_camera[0])
cameray= camera_get_view_y(view_camera[0])
draw_set_valign(fa_top)
	draw_set_halign(fa_left)