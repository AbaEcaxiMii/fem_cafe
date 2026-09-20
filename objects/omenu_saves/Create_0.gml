//Ele sempre é criado por outro objeto que lhe da a var proposito_save_load
//0 é pra caso o menu seja usado para salvar, durante a gameplay
//1 é para carregar um save, assim que inicia o jogo

depth=-800
global.can_move=0
tt=0
tini=4
dt=0

self_destruct=0

ybtw=5
border=8

slot_w=160
slot_h=50

xsl=camera_get_view_x(view_camera[0])+camera_get_view_width(view_camera[0])/2 - (slot_w)/2 //x dos slots
ysl=camera_get_view_y(view_camera[0])+camera_get_view_height(view_camera[0]) //y dos slots
resx=xsl
resy=ysl
xslt=0 yslt=0
flag_restart_ani=1

mode=0 //0 principal 1 opções 2 copiar 3 deletar 4 select cap

anima_load=0
load_save=0
ani_alpha=0

y1_size=0
y2_size=0

y1_sizet=40
y2_sizet=40

curx=xsl-20 //x do cursor
cury=ysl //y do cursor
curxreal=curx curyreal=cury
cur_rot=0 cur_col=c_white cur_alpha=1

pos_fa=0
pos_fa_max=3
pos_slot=0
pos_chp=1
chp_max=4
pos_op=0

pos_slot_max=(3*pos_fa_max)+3
for(var i=0;i<pos_slot_max;i++){
	slot_col[i]=c_white
}

cp_copiar=-1
cp_colar=-1

op_text[0]="Copiar"
op_text[1]="Deletar"
op_text[2]="Sair"

chp_name[1]="Ilhas gemeas"
chp_name[2]="Abominaçao da TV"
chp_name[3]="Uma ultima vez"
chp_name[4]="O passo final"

prog_nor=0
if proposito_save_load{
prog_nor_txt[1]="Gostaria de iniciar?" //um save sem data
prog_nor_txt[2]="Se divirta"
prog_nor_txt[3]="Gostaria de continuar?" //um save com data
prog_nor_txt[4]="Que assim seja"
} else {
prog_nor_txt[1]="Gostaria de salvar?" //um save sem data (Ou com um save com data mas que que o msm slot que vc tá jogando)
prog_nor_txt[2]="Arquivo salvo"
prog_nor_txt[3]="Tem certeza que quer sobrescrever esse save?" //um save com data
prog_nor_txt[4]="Pronto"
}


prog_del=0
prog_del_txt[0]="Qual gostaria de deletar?"
prog_del_txt[1]="Tem certeza que quer deletar este save?"
prog_del_txt[2]="VOCÊ TEM CERTEZA MSM???!!!!"

prog_cp=0
prog_cp_txt[0]="Qual save quer copiar?"
prog_cp_txt[1]="Tem certeza que quer copiar esse save?"
prog_cp_txt[2]="Ok. Aonde iremos cola-lo?"
prog_cp_txt[3]="Tem certeza que quer colar o save ai?"



//if file_exists("save2.sav"){file_delete("save2.sav")}
//if file_exists("save1.sav"){file_copy("save1.sav","save2.sav")}

basic_move=function(){
	var _noti_fa= pos_fa
	var _sound_slot= pos_slot
	
	pos_slot += down_key - up_key
	pos_slot=clamp(pos_slot,3*pos_fa,(3*pos_fa)+2)

	pos_fa+= right_key - left_key
	
	pos_fa=clamp(pos_fa,0,pos_fa_max)
	
	if _noti_fa!= pos_fa{
		pos_slot+=(right_key - left_key)*3
		xsl+=(right_key - left_key)*20
	}
	
	if _sound_slot!=pos_slot{play_sfx(snd_menumove_ch1)}
	
}

state[0]=function(){ //principal
	
	if load_save{
		if prog_nor=2{
			room_goto(Rtestroom)
		} else if prog_nor=4{
			load(pos_slot)
		}
		global.can_move=1
	}
	
	if (load_save) exit;
	
	y1_sizet=30
	y2_sizet=30
	
	if prog_nor=0{
	if pos_slot=(3*pos_fa)+2 and down_key{mode=1}
	if pos_slot=(3*pos_fa) and up_key and proposito_save_load{mode=4}
	basic_move()}
	
	if confirmar_key and !anima_load{
		var _filename="save"+ string(pos_slot) + "_" + string(pos_chp) +".sav"
			if prog_nor=0{
				if file_exists(_filename){
					prog_nor=3 play_sfx(snd_select_ch1)
					if !proposito_save_load{slot_col[pos_slot]=c_red}
				} else {prog_nor=1 play_sfx(snd_select_ch1)}
			} else if prog_nor=3 or prog_nor=1 {
				if proposito_save_load{
					prog_nor++ anima_load=1 play_sfx(snd_select_ch1)
					if prog_nor=2{
						set_song_ingame(noone,30,0)
						play_sfx(exit_door_undertale)
					}
				} else {
					prog_nor=0
					play_sfx(savepoint)
					save(pos_slot)
					slot_col[pos_slot]=c_white
				}
			}
		}
	
	if cancelar_key and !anima_load{
		if prog_nor>0{prog_nor=0 slot_col[pos_slot]=c_white} else if prog_nor=0 and proposito_save_load=0 {self_destruct=1}
	}
	
//	if pos_slot > (3*pos_fa)+2 {pos_slot-=3}
//	if pos_slot < 3*pos_fa {pos_slot+=3}
	
	
	
	//pos_slot += down_key - up_key
	//pos_slot += (right_key - left_key)*3
}

state[1]=function(){ //opções
	cur_col=c_white
	y1_sizet=30
	y2_sizet=40
	
	if up_key or cancelar_key{
			mode=0
			for(var i=0;i<pos_slot_max;i++){
				slot_col[i]=c_white
			}
		}
	
	pos_op+= right_key - left_key
	pos_op=clamp(pos_op,0,2)

	if pos_op > 2 {pos_op=0}
	if pos_op < 0 {pos_op=2}
	
	if confirmar_key{
		
		switch(pos_op){
			case 0:
				mode=2
			break
			
			case 1:
				mode=3
			break
			
			case 2:
				game_restart() //trocar pra end depois
			break
		}
	}

}

state[2]=function(){ //copiar
	cur_col=c_green
	y1_sizet=30
	y2_sizet=40
	
	if prog_cp=0 or prog_cp=2{basic_move()}
	
	if confirmar_key{
		var _filename="save"+ string(pos_slot) + "_" + string(pos_chp) +".sav"
		if cp_copiar=-1{
			if file_exists(_filename){
				if prog_cp=0{prog_cp=1 play_sfx(snd_select_ch1)} else if prog_cp=1{
					cp_copiar=pos_slot play_sfx(snd_select_ch1)
					slot_col[cp_copiar]=c_green
					prog_cp=2
					}
				}
		} else if cp_colar=-1{
			if pos_slot!=cp_copiar{
				prog_cp=3
				cp_colar=pos_slot play_sfx(snd_select_ch1)
				}
		} else if cp_copiar!=-1 and cp_colar!=-1{
			var _filenamecol="save"+ string(cp_colar) + "_" + string(pos_chp) +".sav"
			var _filenamecop="save"+ string(cp_copiar) + "_" + string(pos_chp) +".sav"
			file_delete(_filenamecol)
			file_copy(_filenamecop, _filenamecol)
			slot_col[cp_copiar]=c_white
			cp_copiar=-1 cp_colar=-1 prog_cp=0
			play_sfx(snd_select_ch1)
		}
	}
	
	if cancelar_key{
		
		switch(prog_cp){
			case 0:
			mode=1
			cp_copiar=-1 cp_colar=-1 prog_cp=0
			break
			
			case 1:
			prog_cp=0
			break
			
			case 2:
			slot_col[cp_copiar]=c_white
			cp_copiar=-1
			prog_cp=0
			break
			
			case 3:
			cp_colar=-1
			prog_cp=2
			break
			
			play_sfx(snd_swing)
		}
		
		}
}

state[3]=function(){ //deletar
	cur_col=c_red
	y1_sizet=30
	y2_sizet=40
	
	if prog_del=0{basic_move()}
	if confirmar_key{
	var _filename="save"+ string(pos_slot) + "_" + string(pos_chp) +".sav"
	if file_exists(_filename){
		if prog_del=0{slot_col[pos_slot]=c_red prog_del=1 play_sfx(snd_select_ch1)} else if prog_del=1{prog_del=2 play_sfx(snd_select_ch1)} else if prog_del=2{
		file_delete(_filename) play_sfx(snd_select_ch1) prog_del=0 slot_col[pos_slot]=c_white}
		}
	}
	
	if cancelar_key{if prog_del>0{prog_del=0 slot_col[pos_slot]=c_white} else { mode=1 play_sfx(snd_swing)}}
}

state[4]=function(){ //seleção de capitulo
	cur_col=c_white
	//cur x e y nos desenhos
	y1_sizet=50
	y2_sizet=30
	
	var _sound_chp= pos_chp
	
	pos_chp += right_key - left_key
	pos_chp=clamp(pos_chp,1,chp_max)
	
	if _sound_chp!=pos_chp{play_sfx(snd_menumove_ch1)}
	
	if cancelar_key or down_key{
		mode=0
		for(var i=0;i<pos_slot_max;i++){
		slot_col[i]=c_white
	}
		}
	
}
	
anima_slot=function(){
	
	curxreal=lerp(curxreal,curx,0.6)
	curyreal=lerp(curyreal,cury,0.6)
	
	xslt=atvx yslt=atvy
	xsl=lerp(xsl,xslt,0.6)
	ysl=lerp(ysl,yslt,0.6)
	y1_size=lerp(y1_size,y1_sizet,0.4)
	y2_size=lerp(y2_size,y2_sizet,0.4)
}