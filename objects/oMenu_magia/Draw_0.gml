if !flag_draw{exit}
atvx=camera_get_view_x(view_camera[0])+camera_get_view_width(view_camera[0])/2 - (width)/2
atvy=camera_get_view_y(view_camera[0])+camera_get_view_height(view_camera[0])/2 - (height)/2

resx=camera_get_view_x(view_camera[0])- (width)
resy=atvy

draw_set_valign(fa_top)
draw_set_halign(fa_left)
draw_sprite_ext(back_sprite,image_index,x,y,width/sprite_width,height/sprite_height,0,image_blend,1) //global.trans_back_menus
draw_sprite_ext(sprite_index,image_index,x,y,width/sprite_width,height/sprite_height,0,image_blend,1)
var _dis_res = distance_to_point(resx,resy)

var r1 = color_get_red(color_start);
var g1 = color_get_green(color_start);
var b1 = color_get_blue(color_start);
var r2 = color_get_red(color_end);
var g2 = color_get_green(color_end);
var b2 = color_get_blue(color_end);

var r = lerp(r1, r2, transition_progress);
var g = lerp(g1, g2, transition_progress);
var b = lerp(b1, b2, transition_progress);

var _cc = make_color_rgb(r, g, b);
///////////////

///////retirado do primor

var _desc_w=70
//desenha a classe
var _c= c_white
if state=1{_c=_cc}
var _idi=id_number[char_selected]
var _txt_pontos=" (Pontos:" + string(global.charms_points_spend[_idi])+"/" + string(global.charms_points[_idi])+")"
draw_text_colour(x+border,y+border,"< "+ string(spells_classes_name[spell_class_select]) + " >" + string(_txt_pontos),_c,_c,_c,_c,1) //depois colocar as setas para impulsinar pro lado usado
//desenha as magias em si
var _yo=0
var _xo=0
var _li=array_length(spells_classes[char_selected][spell_class_select])
for (var i=spell_min;i<spell_max;i++){
	var _c1= c_white
	var _c2= c_white
	if _li>0{
		if (i<_li){
			if array_contains(global.spells_bloqueadas[id_number[char_select]],spells_classes[char_select][spell_class_select][i]){_c1=c_red}
		}
		if spell_select=i and state=2{_c2=_cc if _c1=c_white{_c1=_cc}}
	}
	var _namei
	if (i<_li) and _li>0{
		var _spelli=spells_classes[char_selected][spell_class_select][i]
		_namei=_spelli.name
	
		if spell_mode=1 and _spelli=spell_organizar_old_info and  i=spell_organizar_old_pos{
			draw_text_outline(x+border+space*_xo,y+border+space*(_yo+1),_namei,10,9999,_cc)
		}
	
	} else {_namei=""}
	
	draw_text_colour(x+border+space*_xo,y+border+space*(_yo+1),_namei,_c1,_c2,_c1,_c2,1)
	_yo++
	if _yo>=spell_div{_yo=0 _xo=10}
		
}

//fundo do texto da descrição
anim_frame += anim_speed

draw_sprite_ext(sspike_block,anim_frame,desc_x,desc_y,desc_xscale,desc_yscale,0,c_white,1)
if (anim_frame >= anim_total) {anim_frame = 0} else if anim_frame <= 0{anim_frame = anim_total}

if state=2{
	
	//texto que indica a pagia e a seleção
	var _page=0
	var _page_discover=1
	var _page_li=spell_select+1
	while _page_discover{
		_page_li-=spell_num
		_page++
		if _page_li<=0{_page_discover=0}
	}
	var _txt=string(spell_select+1)+"/"+string(_li)+" Pag."+string(_page)
	//Antes tinha uma caixinha de fundo embaixo da caixa com magias
	//var _xscale_mini=(border*2+string_width(_txt))/sprite_get_width(sTextbox_normal)
	//var _yscale_mini=(border*2+string_height(_txt))/sprite_get_height(sTextbox_normal)
	//draw_sprite_ext(sTextbox_back_normal,0,x,y+height+border,_xscale_mini,_yscale_mini,0,c_white,1)
	//draw_sprite_ext(sTextbox_normal,0,x,y+height+border,_xscale_mini,_yscale_mini,0,c_white,1)
	draw_text(desc_x+camera_get_view_width(view_camera[0])-border-string_width(_txt),desc_y-20,_txt)

	//texto da descrição

	var _spell=spells_classes[char_selected][spell_class_select][spell_select]
	var _spell_contac
	if _spell.contac=1{_spell_contac="Físico"} else {_spell_contac="À distância"}
	var _txt=string(_spell.ty1.name)+"/"+string(_spell.ty2.name)+" "+_spell_contac+" "+string(_spell.price)
	//var _y=(desc_y)-sprite_get_height(sspike_block)*abs(desc_yscale)+border
	draw_text_ext(desc_x+border,(desc_y)-60+border,_spell.desc2,space,camera_get_view_width(view_camera[0])-border)
	draw_text(desc_x+border,desc_y-20,_txt)
	draw_sprite(s_star_mis,0,desc_x+border+string_width(_txt),desc_y-20)
		
}

//draw_sprite(sfast_charm,0,mouse_x,mouse_y)
//draw_text(mouse_x,mouse_y,point_distance(x,y,mouse_x,y))
