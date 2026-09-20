flag_draw=1
if instance_exists(oMenu){depth=oMenu.depth-10} //fica por cima devido a descrição emcima 
width=192 //192
height=132
sprite_index=global.txtb_spr
back_sprite = global.txtb_spr_back

op_border=8
op_space=14

anim_frame = 0
anim_speed = -(30/30)
anim_total = sprite_get_number(sspike_block)
desc_x=camera_get_view_x(view_camera[0])
desc_y=camera_get_view_y(view_camera[0])
desc_yscale=0
desc_xscale=0
desc_height=62

charm_border=6
charm_space=10
charm_desc_space=8
anima=0
animation=0
transition_time = 20; // Número de passos para a transição completa
//40
timer = 0;
color_start = c_white;
color_end = c_yellow;
transition_progress = 0; // Progresso da transição, de 0 a 1
transitioning = true;

atvx=camera_get_view_x(view_camera[0])+camera_get_view_width(view_camera[0])/2 - (width)/2
atvy=camera_get_view_y(view_camera[0])+camera_get_view_height(view_camera[0])/2 - (height)/2

resx=camera_get_view_x(view_camera[0])+camera_get_view_width(view_camera[0])/2 + (width)
resy=atvy

x=resx y=resy tx=atvx ty=atvy
ending=0

///////

charm_num=22
charm_div=charm_num/2 
charm_min=0
charm_max=charm_num

charm_select=0

party_show_mode(1)
//pos=0 adicionar no omenu pra poder continuar o mesmo quando volta
status_ready=0
line_sep=10
line_sep_desc=10
textbox_width = width
line_width = textbox_width - op_border*2
rato_fps=0
_fps=1
_fps_timer=0

status_mode=0 //0 mostra os status, se apertar z troca pro equip 1 ao apertar c no 0 vc equipa os charms
_cc=c_red //aqui só pra não dar problema no charms_draw, é sobreescrito no draw de qualquer forma

show_status_step=function(){
	var _sound_pos= pos
	pos+= right_key - left_key
	if pos >= global.party_length {pos=0}
	if pos < 0 {pos= global.party_length-1}
	if _sound_pos!= pos{
		oMenu_charms_show.restart_rolamento=1
		play_sfx(snd_menumove_ch1)	 
	 }
 
	if !ending{
		oMenu_health.dark_mode=1 oMenu_health.pos_other=pos
		if cancel_key{oMenu_health.dark_mode=0 ending=1 play_sfx(snd_smallswing)}
		else if accept_key{play_sfx(snd_select_ch1) ending=1 instance_create_depth(x,y,depth-11,oMenu_equip,{member: global.party_members[pos],pos_m: pos})}
		else if menu_key{play_sfx(snd_select_ch1) status_mode=1}
	}//não desliga o dark mode aqui pq precisa aparecer pro menu_equip
	
	if !status_ready{status_ready=1}
	st_pos=0
	status_show=global.party_members[pos]
	status[st_pos]="Atk:" + string(status_show.atk)
	st_pos++
	status[st_pos]="Def:" + string(status_show.def)
	st_pos++
	status[st_pos]="Ener:" + string(status_show.mener)
	st_pos++
	status[st_pos]="Spd:" + string(status_show.spd)
	st_pos++
	status[st_pos]=string(status_show.ty1.name)+" / "+ string(status_show.ty2.name)
	st_pos++
	status[st_pos]=string(status_show.name)+" - "+ string(status_show.desc)
	st_pos++
	status[st_pos]=oitem_manager.invp[status_show.id_number,0].spr //6
	st_pos++
	status[st_pos]=oitem_manager.invp[status_show.id_number,1].spr
	st_pos++
	status[st_pos]=oitem_manager.invp[status_show.id_number,2].spr
	st_pos++
	status[st_pos]=oitem_manager.invp[status_show.id_number,3].spr
	st_pos++
	status[st_pos]=oitem_manager.invp[status_show.id_number,4].spr //10
	st_pos++
	status[st_pos]="|Arma Principal|"
	st_pos++
	status[st_pos]=string(oitem_manager.invp[status_show.id_number,0].name)
	st_pos++
	status[st_pos]="|Arma|"
	st_pos++
	status[st_pos]=string(oitem_manager.invp[status_show.id_number,1].name)
	st_pos++
	status[st_pos]="|Armadura 1|"
	st_pos++
	status[st_pos]=string(oitem_manager.invp[status_show.id_number,2].name)
	st_pos++
	status[st_pos]="|Armadura 2|"
	st_pos++
	status[st_pos]=string(oitem_manager.invp[status_show.id_number,3].name)
	st_pos++
	status[st_pos]="|Armadura 3|"
	st_pos++
	status[st_pos]=string(oitem_manager.invp[status_show.id_number,4].name) //20
	st_pos++
	status_spr[0]=s_status_atk
	status_spr[1]=s_status_def
	status_spr[2]=s_status_res
	status_spr[3]=s_status_spd
	st_length= array_length(status)
}

show_status_draw=function(){
	if status_ready{
		for(var i=0;i<5;i++){
			var _o=i var _p=0
			if i>1 {_o=i-2 _p=5} //separar os status em um quadrado de 2x2
			if i<4{ //desenhando os status com icone
				if i=2{
					status_spr[i]=char_battle_info(status_show.id_number,3)
					status[i]=char_battle_info(status_show.id_number,2)+":" + string(status_show.mener)
					}
				draw_sprite(status_spr[i],0,x+op_border+op_space*_p,1+y+op_border + op_space*_o)
				draw_text_outline(10+x+op_border+op_space*_p,y+op_border + op_space*_o,status[i])
				draw_text(10+x+op_border+op_space*_p,y+op_border + op_space*_o,status[i])
				}
			//desenhando o tipo
			draw_text_outline(x+op_border,y+op_border + op_space*2,status[4])
			draw_text(x+op_border,y+op_border + op_space*2,status[4])
			//desenhando a descrição
			draw_text_outline(x+op_border,y+op_border + op_space*3,status[5],line_sep_desc,line_width)
			draw_text_ext(x+op_border,y+op_border + op_space*3,status[5],line_sep_desc,line_width)
		}

		//desenhando os sprites dos equipamentos
		var _xx=x+op_border
		for(var i=6;i<10;i++){
			draw_sprite(status[i],0,_xx,y+(height)-20-op_border)
			_xx+=sprite_get_width(status[i])+op_border
		}

		}
}

charms_step=function(){
	var _sound_charm_select= charm_select
	charm_select+=(down_key-up_key)
	charm_select+=(right_key - left_key)*charm_div	
	
	///////// parte que mexe no spell_slect e no _min _max para mostrar as magias melhor
	var _len=array_length(global.charms_gallery)
	if charm_select >= _len {charm_select=0 charm_min=0 charm_max=charm_num}
	if charm_select < 0
	{
		charm_select= _len-1
			for(var i=0;i<9999;i++){
			var _tnum=charm_num*i
			if _tnum>= _len{charm_max=_tnum charm_min=charm_max-charm_num i=9999}
			}
	}

	if charm_select>=charm_max{charm_min+=charm_num charm_max+=charm_num} else if charm_select<charm_min{charm_min-=charm_num charm_max-=charm_num}
	////////////
	
	if _sound_charm_select!= charm_select{
		play_sfx(snd_menumove_ch1)	 
	}

	var _charm=global.charms_gallery[charm_select]
	if accept_key{ //ve se não está tentando usar um "-----"
		var _snd=snd_cantselect
		if array_contains(global.charms_inv_total,_charm){
			var _idi=global.party_members[pos].id_number
			if array_contains(global.charms_inv,_charm) {
				_snd=snd_cantselect
				if (global.charms_points_spend[_idi]+_charm.price<=global.charms_points[_idi]){ //verifica se o charme selecionado está no inventario de charmes ainda não equipados e se tem pontos o suficiente (Equipar um charme)
					_snd=Equip1
					array_push(global.charms[_idi],_charm)
					var _index= array_get_index(global.charms_inv,_charm)
					array_delete(global.charms_inv,_index,1)
					oMenu_charms_show.restart_rolamento=1
				}
			} else if array_contains(global.charms_inv_total,_charm) {
				_snd=snd_cantselect
				if !array_contains(global.charms_inv,_charm) and array_contains(global.charms[_idi],_charm){ //vê se o jogador já pegou esse charme (não é "-----") e se ele já foi equipado (por ele, não por outro), para então desequipar
					_snd=Cancel1
					array_push(global.charms_inv,_charm)
					var _index= array_get_index(global.charms[_idi],_charm)
					array_delete(global.charms[_idi],_index,1)
					oMenu_charms_show.restart_rolamento=1
				}
			}
		}
		play_sfx(_snd)
	} else if cancel_key{play_sfx(snd_smallswing) status_mode=0}
}

charms_draw=function(){
	//desenha os charms
	var _yo=0
	var _xo=0
	var _li=array_length(global.charms_gallery)
	for (var i=charm_min;i<charm_max;i++){
	var _c1= c_white
	var _c2= c_white
	var _namei=""
	var _charmi=0
	
	if _li>0{
		if (i<_li){
				//if array_contains(global.spells_bloqueadas[id_number[char_select]],spells_classes[char_select][charm_select][i]){_c1=c_red}
				//vermelho se já equipada
				_namei="------"
				_charmi=global.charms_gallery[i]
				if array_contains(global.charms_inv_total,_charmi){
					_namei=_charmi.namep
					if !array_contains(global.charms_inv,_charmi){//possui o charme, mas já tá equipado
						_c1=c_red
						for (var ii = 0; ii<array_length(global.playable_members_total); ii++) {
							if array_contains(global.charms[ii],_charmi){_c1=char_battle_info(ii)}
						}
					}
				}
			}
			if charm_select=i{_c2= _cc if _c1=c_white{_c1= _cc}}
		}

		draw_text_outline(x+charm_border+charm_space*_xo,y+charm_border+charm_space*(_yo+1),_namei)
		draw_text_colour(x+charm_border+charm_space*_xo,y+charm_border+charm_space*(_yo+1),_namei,_c1,_c2,_c1,_c2,1)
		_yo++
		if _yo>=charm_div{_yo=0 _xo=10}
	}
	
	//desenha o x/x page x Custo x
	var _idi=global.party_members[pos].id_number
	var _page=0
	var _page_discover=1
	var _page_li=charm_select+1
	while _page_discover{
		_page_li-=charm_num
		_page++
		if _page_li<=0{_page_discover=0}
	}
	var _txt=string(charm_select+1)+"/"+string(_li)+" Pag."+string(_page) + " (Pontos:" + string(global.charms_points_spend[_idi])+"/" + string(global.charms_points[_idi])+")"
	draw_text_outline(x+charm_border,y+charm_border,_txt)
	draw_text(x+charm_border,y+charm_border,_txt)

	//texto da descrição
	var _charm_desc=0
	if array_contains(global.charms_inv_total,global.charms_gallery[charm_select]){_charm_desc=global.charms_gallery[charm_select]}
	if _charm_desc!=0{
		//var _txt=string(_spell.ty1.name)+"/"+string(_spell.ty2.name)+" "+_spell_contac
		var _custo=string(_charm_desc.price)
		var _x=desc_x+charm_border
		var _y=(desc_y)-desc_height
		draw_sprite(_charm_desc.spr,0,_x,_y+charm_border)
		draw_text_ext(_x+50,_y+charm_border,_charm_desc.desc,charm_desc_space,camera_get_view_width(view_camera[0])-charm_border*2-50)
		draw_sprite(s_star_mis,0,desc_x+camera_get_view_width(view_camera[0])-charm_border-sprite_get_width(s_star_mis),desc_y-20)
		draw_text(desc_x+camera_get_view_width(view_camera[0])-charm_border-sprite_get_width(s_star_mis)-string_width(_custo),desc_y-20,_custo)
		//draw_text(desc_x+border,desc_y-20,_txt)
	}
	
}

//Equip1 para equipar charmes