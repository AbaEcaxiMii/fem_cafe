//var _filename="save"+ string(pos_slot) + "_" + string(pos_chp) +".sav"
if flag_restart_ani{
		xsl=camera_get_view_x(view_camera[0])+camera_get_view_width(view_camera[0])/2 - (slot_w)/2 //x dos slots
		ysl=camera_get_view_y(view_camera[0])+camera_get_view_height(view_camera[0]) //y dos slots
		flag_restart_ani=0
	}

//atualizar a dat
if tt--<=0{
///
	for(var i=0;i<12;i++){
			var _filename="save"+ string(i) + "_" + string(pos_chp) +".sav"
			if !file_exists(_filename){tt=tini dt[i]=0} else {
	
			var _buffer=buffer_load(_filename)
			var _json=buffer_read(_buffer, buffer_string)
			buffer_delete(_buffer)
	
			var _loadArray=json_parse(_json)
	
			dt[i]=array_get(_loadArray,0)
			}
	}
///	

tt=tini
}
//desenhar os slots
for(var i=0;i<3;i++){
	var _dt=dt[i+(3*pos_fa)]
	draw_sprite_ext(sTextbox_back,0,xsl,ysl+(slot_h+ybtw)*i,slot_w/sprite_get_width(sTextbox),slot_h/sprite_get_height(sTextbox),0,slot_col[i+(3*pos_fa)],global.trans_back_menus)
	draw_sprite_ext(sTextbox,0,xsl,ysl+(slot_h+ybtw)*i,slot_w/sprite_get_width(sTextbox),slot_h/sprite_get_height(sTextbox),0,slot_col[i+(3*pos_fa)],1)
	xx=xsl+border yy=(ysl+(slot_h+ybtw)*i)+border

	//cursor set x y
	if mode!=1 and mode!=4 and pos_slot=i+(3*pos_fa){
	curx=xsl-20
	cury=ysl+slot_h/2+(slot_h+ybtw)*i
	}
	
	if _dt!=0{
	var _line1=string(_dt.save_nameslot) + " " + string(_dt.save_thour) + ":" + string(_dt.save_tmin) + ":" + string(_dt.save_tsec)
	
	draw_text_outline(xx,yy,_line1)
	draw_text(xx,yy,_line1)
	draw_text_outline(xx,yy+10,_dt.save_rm)
	draw_text(xx,yy+10,_dt.save_rm)
	//draw_text(xx,yy+ybtw*i+20,"x:" + string(_dt.save_x) +" y:"+ string(_dt.save_y))
	
	var _pl= array_length(_dt.save_party)
		
		if _pl>= 1{
			var _id_num=_dt.save_party[0].id_number
			draw_sprite(global.icon_health[_id_num],0, xx+110,yy+10)
		}
		
		if _pl>= 2{
			var _id_num=_dt.save_party[1].id_number
			draw_sprite(global.icon_health[_id_num],0, xx+130,yy+10)
		}
		
		if _pl>= 3{
			var _id_num=_dt.save_party[2].id_number
			draw_sprite(global.icon_health[_id_num],0, xx+120,yy+25)
		}
	
	} else {
		draw_text_outline(xx,yy,"[NADA]")
		draw_text(xx,yy,"[NADA]")
	}
}

//draw_text(mouse_x,mouse_y,point_distance(mouse_x,mouse_y,x,y))

//desenhar fundos pretos
draw_sprite_ext(sspike_block,image_index,camera_get_view_x(view_camera[0]),camera_get_view_y(view_camera[0])+y1_size,camera_get_view_width(view_camera[0])/sprite_get_width(sprite_index),-(y1_size/sprite_get_height(sprite_index)),0,c_white,1)
draw_sprite_ext(sspike_block,image_index,camera_get_view_x(view_camera[0]),camera_get_view_y(view_camera[0])+camera_get_view_height(view_camera[0])-y2_size,camera_get_view_width(view_camera[0])/sprite_get_width(sprite_index),y2_size/sprite_get_height(sprite_index),0,c_white,1)

draw_set_halign(fa_center)
draw_set_valign(fa_middle)

//desenhar texto encima
var _btw_chp=camera_get_view_width(view_camera[0])/(chp_max+1)
var _btw_op=camera_get_view_width(view_camera[0])/(array_length(op_text)+1)
var _meioy1=camera_get_view_y(view_camera[0])+(y1_size/2)-7/2
var _meioy2=camera_get_view_y(view_camera[0])+(camera_get_view_height(view_camera[0])-y2_size/2+7/2)

if mode!=4{
draw_text_outline(camera_get_view_x(view_camera[0])+20,_meioy1,string(pos_slot+1)+"/12")
draw_text(camera_get_view_x(view_camera[0])+20,_meioy1,string(pos_slot+1)+"/12")
}
if mode=0 or mode=1{
var _txt=chp_name[pos_chp]
if prog_nor>0{_txt=prog_nor_txt[prog_nor]}
draw_text_outline(camera_get_view_x(view_camera[0])+camera_get_view_width(view_camera[0])/2,_meioy1,_txt,10,200)
draw_text_ext(camera_get_view_x(view_camera[0])+camera_get_view_width(view_camera[0])/2,_meioy1,_txt,10,200)
draw_sprite(icon_recy,0,camera_get_view_x(view_camera[0])+camera_get_view_width(view_camera[0])-60,_meioy1)
}

if mode=2 or mode=3{
	if mode=2{var _txt= prog_cp_txt[prog_cp]} else if mode=3{var _txt= prog_del_txt[prog_del]}
	draw_text_outline(camera_get_view_x(view_camera[0])+camera_get_view_width(view_camera[0])/2,_meioy1,_txt,10,200)
	draw_text_ext(camera_get_view_x(view_camera[0])+camera_get_view_width(view_camera[0])/2,_meioy1,_txt,10,200)
}

if mode=4{ //desenhando os icones dos capitulos quando selecionando
	
	for(var i=0;i<chp_max;i++){
		
	var _x=camera_get_view_x(view_camera[0])+_btw_chp*(i+1)
	var _y=_meioy1
	curx=_btw_chp*pos_chp cury=y1_size+20
		if i=pos_chp-1{
			draw_rectangle(_x-10,_y-10,_x+10,_y+10,1)
		}
	draw_sprite(icon_recy,0,_x,_y)
	}
}

//desenhar cursor
cur_rot++
if cur_rot=360{cur_rot=0}
draw_sprite_ext(stiro_atkc,0,curxreal,curyreal,1,1,cur_rot,cur_col,cur_alpha)

//desenhar texto embaixo

if mode!=4{
	for(var i=0;i<3;i++){
		var _c=c_white
		if i=pos_op and mode!=0{_c=c_yellow}
		draw_text_outline(camera_get_view_x(view_camera[0])+_btw_op*(i+1),_meioy2,op_text[i])
		draw_text_colour(camera_get_view_x(view_camera[0])+_btw_op*(i+1),_meioy2,op_text[i],_c,_c,_c,_c,1)
		if mode=1{curx=camera_get_view_x(view_camera[0])+_btw_op*(pos_op+1) cury=_meioy2}
	}
}

if mode=4{
	draw_text_outline(camera_get_view_x(view_camera[0])+camera_get_view_width(view_camera[0])/2,_meioy2,chp_name[pos_chp])
	draw_text(camera_get_view_width(view_camera[0])/2,_meioy2,chp_name[pos_chp])
}

//animação de load

if anima_load{
	var _a=0
	if prog_nor=2{_a=0.006} else if prog_nor=4{_a=0.1}
	ani_alpha+=_a
	draw_set_alpha(ani_alpha)
	draw_rectangle(camera_get_view_x(view_camera[0]),camera_get_view_y(view_camera[0]),camera_get_view_x(view_camera[0])+600,camera_get_view_y(view_camera[0])+600,0)
	if ani_alpha>=1{
		load_save=1
	}
}

draw_set_halign(fa_left)
draw_set_valign(fa_top)
draw_set_alpha(1)
//testes

//draw_text(xsl,ysl-10,prog_nor)
//draw_text(xsl,ysl-10,string(pos_fa)+string("/")+string(pos_slot))
//draw_text(mouse_x,mouse_y,point_distance(xsl,ysl,xsl,mouse_y))
//52 é a altura dos slots







