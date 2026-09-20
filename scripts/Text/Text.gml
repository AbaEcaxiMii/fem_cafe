

function TextCr(){
text[0]=""
option[0]=""
option_link_id[0]=-1
page_number=0
option_number=0
text_id="text"
//n importantes
scr_set_defaults_for_text()
}

function scr_set_defaults_for_text(){
	line_break_pos[0,page_number]=999
	line_break_num[page_number]=0
	line_break_offset[page_number]=0
	
	//variaveis para cada char
	for (var c=0; c<1000;c++){
		col_1[c,page_number]=c_white
		col_2[c,page_number]=c_white
		col_3[c,page_number]=c_white
		col_4[c,page_number]=c_white
		
		text_speed[c,page_number]=1
		
		float_text[c,page_number]=0
		flo[c,page_number]=1
		float_dir[c,page_number]=c*20
		
		icon_text[c,page_number]=noone
		
		shake_text[c,page_number]=0
		shake_dir[c,page_number]= irandom(360)
		shake_timer[c,page_number]= irandom(4)
		
		pause_text[c,page_number]=0
	}
	
	speaker[page_number]=noone
	speaker_name[page_number]=noone
	snd[page_number]=DefText
	snd_delay[page_number]=2
	local[page_number]=180
	npc_presence[page_number]=0
	type_text[page_number]="nor"
	play_sfx_textbox[page_number]=noone
	fundo[page_number]=true
	
	npc_presence[page_number]=0
	npc_face[page_number]=0
}


function scr_text(_text,_face="nor", _local="nor", _type_text="nor",_sfx="nor",_fundo=1){
	scr_set_defaults_for_text()
text[page_number]=_text
npc_presence[page_number]=0
npc_face[page_number]=0
snd_delay[page_number]=1 //2
snd[page_number]= DefText
speaker[page_number]=noone
speaker_name[page_number]=noone
//colocar tal[page_number] = algo, tipo o default daquilo, pra que caso tenha argumento disso seja trocado

switch (_face)
	{
		case "rc":
		speaker[page_number]=CbRecy
		snd[page_number]= snd_txtnoe_ch1
		break
		
		case "al":
		speaker[page_number]=CbAlter
		snd_delay[page_number]=1
		break
		
		case "no voice":
		snd[page_number]= snd_text_novoice
		snd_delay[page_number]=99
		break
		
		case "voicetelefone":
		snd_delay[page_number]=0
		break
		
		case "npc":
		npc_presence[page_number]=1
		npc_face[page_number]=1
		break
		
		case "npc_2":
		npc_presence[page_number]=1
		npc_face[page_number]=2
		break
		
		case "npc_3":
		npc_presence[page_number]=1
		npc_face[page_number]=3
		break
		
		case "cara1":
		speaker[page_number]=CbRecy
		speaker_name[page_number]="Cara1"
		snd[page_number]= snd_txtnoe_ch1
		break
		
		case "cara111":
		speaker[page_number]=CbAlter4
		speaker_name[page_number]="Cara999aaa"
		break
		
		case "prodiag":
		speaker_name[page_number]="Programa de diagnostico"
		break
		
		case "sistema":
		speaker_name[page_number]="Sistema"
		break
	}

if _local="nor" {_local=150}
local[page_number]=_local
type_text[page_number]=_type_text
play_sfx_textbox[page_number]=_sfx
if _sfx="nor"{play_sfx_textbox[page_number]=noone}
fundo[page_number]=_fundo

page_number++
}
//Anotação dos type_text: "nor" = aperte Z para progedir, "long"=Demora um pouco para progedir
//"fast" progredi assim que termina a conversa, "inst" deleta a textbox, para dialogos q só servem para
//atualizar variaveis, sem texto, "inv" a textbox fica invisivel por um tempo antes de progedir
//"inv_fast" msm coisa, mas fica invisivel assim q a conversa termina

//text VFX
/// @param 1st_char
/// @param last_char
/// @param col1
/// @param col2
/// @param col3
/// @param col4
function scr_color(_start,_end,_col1=c_red,_col2=_col1,_col3=_col1,_col4=_col1){
	
	for (var c=_start; c <= _end; c++)
	{
		col_1[c,page_number-1]=_col1
		col_2[c,page_number-1]=_col2
		col_3[c,page_number-1]=_col3
		col_4[c,page_number-1]=_col4
	}
}

function scr_spd(_start,_end,_spd){
	
	for (var c=_start; c <= _end; c++)
	{
		text_speed[c,page_number-1]=_spd
	}
}

/// @param 1st_char
/// @param last_char
/// @param [flo]
function scr_text_float(_start,_end,_float=1){
	for (var c=_start; c <= _end; c++)
	{
		float_text[c,page_number-1]=true
			flo[c,page_number-1]=_float
	}
}

/// @param 1st_char
/// @param last_char
function scr_text_shake(_start,_end){
	for (var c=_start; c <= _end; c++)
	{
		shake_text[c,page_number-1]=true
	}
}

function scr_text_icon(_spr,_pos){
	icon_text[_pos,page_number-1]=_spr  //um espaço é 5 pixeis 
}

function scr_option(_option,_link_id){
option[option_number]=_option
option_link_id[option_number]=_link_id
option_number++
}

function scr_pause(_char,_time=5){
pause_text[_char,page_number-1]=_time
}

function draw_text_outline(_char_x,_char_y,_charr,_outsep=-1,_outw=-1,_outc=c_black,_outalpha=1,_type=0,_dc1=170){	

	var _desloc=0
	if _type=0{
	_desloc=1
	draw_text_ext_color((_char_x)+_desloc,(_char_y)+_desloc,_charr,_outsep,_outw,_outc,_outc,_outc,_outc,_outalpha)
	draw_text_ext_color((_char_x),(_char_y)+_desloc,_charr,_outsep,_outw,_outc,_outc,_outc,_outc,_outalpha)
	draw_text_ext_color((_char_x)+_desloc,(_char_y),_charr,_outsep,_outw,_outc,_outc,_outc,_outc,_outalpha)
	draw_text_ext_color((_char_x),(_char_y)-_desloc,_charr,_outsep,_outw,_outc,_outc,_outc,_outc,_outalpha)
	draw_text_ext_color((_char_x)-_desloc,(_char_y),_charr,_outsep,_outw,_outc,_outc,_outc,_outc,_outalpha)
	draw_text_ext_color((_char_x)-_desloc,(_char_y)+_desloc,_charr,_outsep,_outw,_outc,_outc,_outc,_outc,_outalpha)
	draw_text_ext_color((_char_x)+_desloc,(_char_y)-_desloc,_charr,_outsep,_outw,_outc,_outc,_outc,_outc,_outalpha)
	} else if _type=1 {
		var _desloc=0.6
		var _noutc=make_color_hsv(color_get_hue(_outc),color_get_saturation(_outc),color_get_value(_outc)-_dc1)
		draw_text_ext_color((_char_x)+_desloc,(_char_y)+_desloc,_charr,_outsep,_outw,_noutc,_noutc,_noutc,_noutc,_outalpha)
	}
}

function scr_icon_char_name(_spr,_pos,_id_number){ //usado para quando tem o icone do personagem com seu nome de forma rápida e pratica
	var _name=char_battle_info(_id_number,1)
	var _true_pos=_pos+3+string_length(_name)
	scr_text_icon(_spr,_pos)
	scr_color(_pos+3,_true_pos,char_battle_info(_id_number))
	scr_text_float(_pos,_true_pos)
}

/// @param _text_id
/// @param mode
/// @param 1_info
/// @param 2_info
/// @param 3_info
/// @param 4_info
/// @param 5_info
/// @param 6_info
function create_textbox(_text_id,_mode=0,_1_info="[Sem informação]",_2_info="[Sem informação]", _3_info="[Sem informação]", _4_info="[Sem informação]", _5_info="[Sem informação]", _6_info="[Sem informação]"){
	
	//mode 0 = overworld 1= Dialogo normal na batalha 2= Dialogo de cima nas batalhas
	var _textbox_depth = -room_height-1000
	var _textbox_layer_id = layer_create(_textbox_depth,"textbox_layer")
	var _textbox_id = instance_create_layer(0,0,_textbox_layer_id,oTextbox,{textbox_layer_id: _textbox_layer_id, dial_mode: _mode})
	with _textbox_id{
		scr_game_text(_text_id,_1_info,_2_info, _3_info, _4_info, _5_info, _6_info)
		text_id=_text_id
	}
	return _textbox_id
}

//Banco de dialogos encutadores

function sss_adic_char_talk(_char){
	if global.delay_text_bug=0{
		global.delay_text_bug=5
	if global.party_length>2{
		array_delete(global.party_members,1,99)
		array_push(global.party_members,_char)
		} else {array_push(global.party_members,_char)}
	}
}

function sss_op_talk(){
	scr_text("Adicionar qual personagem?","al",5)
			scr_option("Adicionar Dolissue","Adicionar Dolissue")
			scr_option("Adicionar Shepheard","Adicionar Shepheard")
			scr_option("Adicionar S.N","Adicionar S.N")
			scr_option("Delete_party","delete_party")
			scr_option("Default_party","Default_party")
			scr_option("Chega","")
}

function next_page_text(){
		page++
		draw_char = 0
		timervoice =0
		sfx_play=0
		cool_type_long_text=global.cool_type_long_text
		cool_type_inv_text=global.cool_type_inv_text
		_cool_type_inv_text_manger=0
		inv_mode=0
		txtb_image_speaker=0
}

///////////////Banco de dialogos

/// @param _text_id
/// @param 1_info
/// @param 2_info
/// @param 3_info
/// @param 4_info
/// @param 5_info
/// @param 6_info
function scr_game_text(_text_id,_1_info,_2_info, _3_info, _4_info, _5_info, _6_info){
	
	if oAdm_mundo.lg[global.language]="eng"{
		_text_id=_text_id+"eng"
}


	
	switch(_text_id){ ////////%técnicos/testes

	case "selector_party":
		sss_op_talk()
	break
	
	case "Adicionar Dolissue":
	sss_adic_char_talk(global.party_list.doli)
	sss_op_talk()
	break
	
	case "Adicionar Shepheard":
	sss_adic_char_talk(global.party_list.shep)
	sss_op_talk()
	break
	
	case "Adicionar S.N":
	sss_adic_char_talk(global.party_list.sn)
	sss_op_talk()
	break
	
	case "delete_party":
	if global.delay_text_bug=0{
		global.delay_text_bug=5
	array_delete(global.party_members,1,3)
	}
		sss_op_talk()
	break
	
	case "Default_party":
	if global.delay_text_bug=0{
		global.delay_text_bug=5
	array_delete(global.party_members,0,5)
	array_push(global.party_members,global.party_list.doli)
	array_push(global.party_members,global.party_list.shep) //shopia
	array_push(global.party_members,global.party_list.sn) //emma
	}
		sss_op_talk()
	break
	
	case "":
	scr_text("", "no voice",-100,"inst")
	break
	
	case "-":
	scr_text("Uh, oq?")
	scr_text("Isso não significada nada- quer disser, sim, mas-","nor","nor","fast")
	scr_text("Escuta não é assim que você tá pensando-","nor","nor","inv_fast")
	scr_text("Ah esquece :/")
	break
	
	case "1":
		scr_text("oiiiiii","rc",5)
		scr_text("eu acho","al",5)
		scr_text("deu certo, meu santo deus, está finalmente funcionando! eba! yayyyyyyyy")
		break
		
	case "1eng":
		scr_text("hiiiiii","rc",5)
		scr_text("i think","al",5)
		scr_text("it worked, my goodness, it's finally working! yay!yayyyyyyyy!")
		break
		
	case "npc3":
scr_text("Não está morto")
scr_text("Na verdade, nunca esteve vivo")
	scr_option("Prestar respeito","respeito")
	scr_option("Sentir","sentir")
break

case "respeito":
		scr_text("Eu sinto muito, nunca iria sentir a emocionante sensação de viver. Pelo lado bom, nunca irá sentir o frio da morte. Continue dormindo pequenino","rc",5)
		break
case "sentir":
		scr_text("Você não pode sentir","nor",5)
		scr_text("Você não é um ser vivo","nor",5)
		scr_text("Amalgamados de células, pele e unha, sentem","nor",5)
		scr_text("Um aglomerado de terra refinada, não","nor",5)
		scr_text("Não se esqueça das suas limitações","nor",5)
		scr_text("Mentir é feio sabia? Ainda mais pra si mesmo","nor",5)
		break

case "npc2":
scr_text("Meu deus! quanto trabalho, tudo isso pra fazer um sistema de dialogo usável","rc")
	scr_color(17,24,c_yellow,c_yellow,c_white,c_white); scr_color(0,9,c_aqua,c_lime,c_aqua,c_aqua)
	scr_text_float(0,9); scr_text_float(49,67,3)
	scr_text_shake(10,16)
	//18 25
//scr_text("mas, pelo menos eu venci?!","rc",5)
//scr_text("EU. preciso. de. respostas!","rc")
scr_text("Teste de opção, teste longo porque eu preciso ver como a caixa de dialogo se comporta em um texto longo ebaaaa")
	scr_option("Sim, valeu o esforço","test1")
	scr_option("Não, perdeu seu tempo","test2")
	scr_option("Não, perdeu seu tempo","test2")
	scr_option("Não, perdeu seu tempo","test2")
	scr_option("Não, perdeu seu tempo","test2")
break

case "test1":
scr_text("Ufa","rc",100)
scr_text("Ainda bem")
scr_text("valeu a pena")
break

case "test2":
scr_text("...")
scr_text("ok, vamos de novo")
break

case "nor":
scr_text("text padrão")
break

case "curado":
scr_text("(Jogo salvo e completamente curado)","al","nor","nor",heal_2)
break

case "exemplo":
//coisas
break

case "test_de_aaa":
scr_text("Teste de opção, teste longo porque eu preciso ver como a caixa de dialogo se comporta em um texto longo ebaaaa")
break

case "pegou x item":
scr_text(global.party_members[0].name+" pegou "+ _1_info)
break

case "test_no_back":
scr_text("Teste para texto sem fundo","cara1","nor","nor","nor",0)
scr_text("!!!!00000","nor","nor","nor","nor",0)
break

case "npc_default":
scr_text("abc  f gioy 6878yddgfhfvjhx gchf","npc")
//scr_spd(7,28,0.1)
scr_text(".............","npc")
scr_text("Aparecer em todos os lugares é bom né? mas isso significa que eu n tenho personalidade, minha identidade não é singular, e os beta-testers pensam que eu sou gayzinho pela minha cor de pele, por isso eu estou triste :(","npc")
scr_text("Opa, agora eu to feliz, mas não por muito tempo, quando essa mensagem acabar eu provavelmente vou voltar a ser triste, yayy!!!","npc_2")
scr_text("Ok, agora eu não posso mais falar, porque é uma mensagem do narrador")
break

case "npc_quest1":
scr_text("Hey Recy, tenho uma missão pra você, como é a sua primeira essa é bem facil, fale comigo de novo!","npc_2")
break

case "npc_quest1-2":
scr_text("Isso msm, viu que simples?","npc_2")
break

case "$$$":
if global.delay_text_bug=0{
		global.delay_text_bug=5
		global.money+=10
}
scr_text("Aqui seu dinheiro")
break

case "fast":
scr_text("Hipoteticamente isso deveria acabar assim que eu terminasse de falar","rc","nor","fast")
scr_text("Uau funcionou mesmo! Pera um poucoquinhoq ue o texto já acaba","rc","nor","long")
scr_text("Pronto, agora tem texto comum")
break

case "Emma_mother_magic":
scr_text("Emma sentiu algo bem no fundo do seu espirito!","nor","nor","nor",savepoint)
scr_text("Emma aprendeu dobra de água!","nor","nor","nor",Heal)
break

case "folheto_elev_nfunfa":
scr_text("(O folheto lhe chama a atenção)")
scr_text("AVISO: Não use o elevador, pelo visto o mundo crasha quando é usado, então ele tá aqui mais por decoração mesmo")
break

case "painel_nfunfa":
scr_text("Esse painel não está funcionando")
scr_text("...Não, literalmente não tá funfando, isso não foi programado ainda","nor","nor","inv")
scr_text("Helloo hfhfhdhd","nor","nor","long")
break


case "puz1_numero_primos":
	scr_text("Há um conto sobre um principe e uma exploradora que cairam em paixão, os dois tiveram uma filha e o irmão do principe só pode sonhar com esse futuro")
		scr_color(21,29) scr_color(36,47) scr_color(90,95) scr_color(100,105)
	scr_text("Deixe ligado apenas os botões referentes as pessoas destacadas. O Principe e a Exploradora são os primeiros ''primos'', e o irmão é o número da filha menos 1")
	scr_text("Tem um textinho escrito no canto da placa, parece ser uma dica")
		scr_option("Ler a dica","puz1_numero_primos_dica")
		scr_option("Nah, eu não preciso de ajuda","")
break

case "puz1_numero_primos_dica":
scr_text("Dica: Comece pelo 9, então a filha e termine no 4")
break

case "nome_encima_text":
scr_text("Teste tem uma caixa dizendo meu nome cara 1","cara1")
scr_text("Teste tem uma caixa dizendo meu nome cara 2","cara111")
break

case "teste_icon":
scr_text("Oi, eu sou o      kris!")
	scr_text_icon(srosto_kris_1,13) //um espaço é 5 pixeis
	scr_text_float(13,22)
	scr_color(13,22,#00A2E8)
//	scr_text_icon(srosto_kris_1,13) //um espaço é 5 pixeis
//	scr_text_float(13,22)
//	scr_color(13,22,#00A2E8)
break	
	
	}

	switch(_text_id){////////%Cutscene

//numero pause= Ch(inicial)-Ch(atual)
		case "cut001-1":
			scr_text("Então você realmente veio. Estou admirado. de verdade! Não se preocupe, eu irei cumprir a minha parte do acordo. Antes, eu preciso te integrar. Diga, me de o seu nome","nor","nor","nor","nor",0)
				scr_pause(5,20) scr_pause(26,30) scr_pause(42,20) scr_pause(55,20) scr_pause(71,30) scr_pause(112,20) scr_pause(143,20) scr_pause(149,40) scr_pause(155,40)
	
			scr_text("Esplendido! ''NOME'' é... interessante","nor","nor","nor","nor",0)
				scr_pause(11,20) scr_pause(20,20)
		
			scr_text("Enfim, acredito que seja hora de eu ir. Sim eu sei que nosso tempo foi curto, mas você não pode possuir o que ainda tem dono. Por favor, não se preocupe, está tudo pronto, meu anfifrião irá te guiar até os confins deste mundo.","nor","nor","nor","nor",0)
				scr_pause(125,30)
	
			scr_text("Foi bom te conhecer NOME. Lembre-se que você pediu por isso","nor","nor","nor","nor",0)
				scr_pause(19,30) scr_pause(25,40)
	
			scr_text("Adeus","nor","nor","nor","nor",0)
		break
		
		case "cut003":
		//Programa de diagnostico
			scr_text("Error. Nucleo incompleto, incapaz de produzir energia de forma eficiente. Perigo de desligamento abrupto - Ativando modo de economia de energia","prodiag")
				scr_color(0,6,c_red)
				scr_color(74,9999,c_orange)
			scr_text("Ações recomendadas: Procure o especialista mais próximo para realizar conserto","prodiag")
				scr_color(0,19,c_aqua)
		break
		
		case "cut004-1":
			scr_text("Você clica no icone da assistência")
			scr_text("(Chamando......)")
			scr_text("...")
			scr_text("Alô? É da assistência? Estou preso no laboratorio","rc")
			scr_text("...")
			scr_text("Eu uh... não consigo chegar no laboratorio de informatica para criar um cartão de acesso, poderia mandar alguém pra abrir a porta?","rc")
			scr_text("...")
			scr_text("Pelo menos da pra mandar alguém mais tarde? Minha bateria está quase acabando, então avisa pra quando chegar trocar a minha bateria","rc")
			scr_text("...Ninguém vai te salvar nessa terra esquecida. Apodreça como o resto desta cidadela","voicetelefone")
				scr_spd(3,9999,0.2)
			scr_text("**************")
		break
		
		case "cut004-2":
			scr_text("Error. Bateria em estado critico. Inicializando desligamento")
				scr_color(0,6,c_red)
				scr_color(34,60,c_red,c_red,c_dkgray,c_dkgray)
		break
		
		case "cut004-3":
			scr_text("Tempo estimado até a reanimação: Indefinitivo")
				scr_pause(32,70)
		break
		
		case "cut004-4":
			scr_text("Recy Prototipo. Modelo 04UY78 MADE IN NERA //Zahl//")
			scr_text("Rodando programa de diagnostico")
			scr_text("Cabeça Ok Tronco OK Braços OK Pernas OK Sistema de interpretação do ambiente OK Mecanismos de locomoção avançada OK Nucleo ESTAVÉL","prodiag")
			scr_text("Não foi possível sincronizar com a nuvem //Não essencial para funcionamento//","prodiag")
			scr_text("Diagnostico: Preparado para reanimação","prodiag")
			scr_text("Ativando programas restantes.....")
		break
		
		case "cut004-5":
			scr_text("Huh tem alguém ai?","rc","nor")
			scr_text("seja lá quer for, obrigado","rc")
			scr_text("Foi por nada","al")
		break
		
		case "cut004-6":
			//recy ! na cabeça e alter aparece
			scr_text("mas que-","rc")
			scr_text("Bom dia! como que foi o sono de beleza?","al")
		break
		
		case "cut004-7":
			//Recy olha pro lado
			scr_text("Bom dia prra você tbm?","rc")
			scr_text("Pera...","rc")
		break
		
		case "cut004-8":
			//Recy olha pra cima
			scr_text("Foi você quem me consertou?","rc")
			scr_text("Foi sim, foi dificil tá, eu não sou bem um cara da tecnologia, mas você já tava basicamente pronto, só tive que trocar umas peças vagabundas e voalá! fiz um bom trabalho?","al")
			scr_text("...Sim, valeu","rc")
			scr_text("Ô e oque vc achou da sua nova capa?","al")
			scr_text("Minha... capa?","rc")
		break
		
		case "cut004-9":
			//animação dele olhando a capa
			scr_text("É... Robusta","rc")
			scr_text("Legal né? foi o meu pai que fez","al")
			scr_text("Ela é hidrofobica então não se preocupe em lavar ela","al")
			scr_text("Que bom","rc")
			scr_text("Û ela possui uma mini dimensão nos bolsos que te permite guardar um monte de coisa sem ficar pesado","al")
			scr_text("Muito conveniente","rc")
			scr_text("Ela tbm tem um sistema de auto-correção que se ajeita ao vento e situação para nunca atrapalhar no combate, perfeito para farmar aura","al")
			scr_text("Bem util","rc")
			scr_text("Ela consegue brilhar no escuro!","al")
			scr_text("Legal","rc")
			scr_text("E tem fator elastico para você compartilhar cobrir os proximos, revestida em pó cosmico pra servir de escuro, seu tecido é INinflamável, indestrutivel e-","al")
			scr_text("Eu estou ficando sem sinonimos. Eu gostei tá bom?","rc")
			scr_text("Eu uh fico feliz que tenha gostado","al")
		break
		
		case "cut004-10":
			//nota: alter saber o nome do recy sem ele ter falado
			//Recy olha pra cima
			scr_text("E você seria?","rc")
			scr_text("Oh! Pode me chamar de Alter","al")
			scr_text("Eu tava me referindo ao oq vc é, definitivamente não é um robo","rc")
			scr_text("Ah eu uhm sou um espirito! Acho que você ainda não viu muitos né?","al")
		break
		
		case "cut004-11":
			//Recy olha pra baixo
			scr_text("Na vdd eu não vi muito coisa no geral","rc")
			scr_text("Eu sinto que era pra eu ser capaz de me conectar com a rede para baixar pacotes de contexto, mas não pareço ser capaz. Você sabe de alguma coisa?","rc")
			scr_text("Desculpa, não. Eu só tava passando por aqui quando achei você. Mas tipo, esse lugar com certeza está abandonado","al")
			scr_text("Mas hey agora você tá 100% não é? tenho certeza que vc vai achar um jeito de sair","al")
			scr_text("Tem razão. Vamos indo então","rc")
		break
		
		case "cut004-12":
			//anda pra fora
			scr_text("Você vem ou?","rc")
			scr_text("Eu uhm eu não gosto de sair daqui, se importa de ir na frente?","al")
			scr_text("Sem problema","rc")
			scr_text("Mas se você tiver algum problema não hesite em bater um papo comigo viu","al")
			scr_text("Compreendo, até mais","rc")
		break
		
		case "cut005": //computador mestre alerta
		//lembra de colocar a cut com o alerta
			scr_text("Este é o computador mestre, portador de toda DATA, rodando programas de ultima geração. Surpreendentemente, não tem senha")
			scr_text("Vc aperta o enter e procura como-")
			//barulho alto e piscando vermelho musica de alarme
			scr_text("ALERTA! PERIGO MAXIMO, O DOMO FOI VIOLADO, SUA CASA NÃO É SEGURA, TODOS DEVEM SE ALOJAR NA MANSÃO ZAHL IMEDIATAMENTE, É O UNICO LUGAR SEGURA. REPITO SUA CASA NÃO É SEGURA. TODOS DEVEM SE ALOJAR NA MANSÃO ZAHL IMEDIATAMENTE")
			scr_text("CONFIEM NAS AUTORIDADES, LEVEM O MAXIMO QUE PUDER, OS NOVOS ROBOS MILITARES E GUARDIÕES IRIAM CUIDAR DA AMEAÇA. APÓS CHEGAR NA MANSÃO FIQUEM NO BUNKER ATÉ UM GUARDIÃO ESCOLTA-LOS PARA FORA")
			scr_text("A mensagem e repete sem parar e freneticamente, vc aperta todos os botões na esperança que pare, pare, Pare, PaRE, POr FAvOR PArE, ME DESCUlPA, NOS NÃO CONSEGUIMOS, ME PERDOE, ME PERDOEM, FAÇA PARAR")
			//computador volta a ser azul
			scr_text("... o alerta se foi... vc acha um icone de um cartão e escreve o seu nome. de repente, um cartão é ejetado do computador")
		break
		
		case "cut006":
			//camera vai pro orecemana1, bang anda até a porta e Recy olha pro lado
			scr_text("Bruh, mermão valeu, qualquer coisa passa no meu beco, a gente normalmente atirar em idosas, saca, pra passar o tempo?")
			scr_text("Oi","rc")
			scr_text("Tô zuando leke, nos só atira em criança")
			scr_text("OI","rc")
			scr_text("cê é loko, não entende sarcasmo não? mas o convite, ainda tá de pé, tá ligado? Tchau tchau, flw~","nor","nor","inv")
			//bang entra na porta
		break
		
		case "cut007":
			//dummy surpreso
			scr_text("Gasp! Eu não creio nisso")
			scr_text("(Esse não é dummy de mais cedo?)")
		break
		
		case "cut007-1":
			//dummy chega mais perto
			scr_text("Vc não seria o robo do laboratorio né?")
			scr_text("Assim, sou eu msm, pode me explicar oq vc tava fazendo lá? vc me deu um susto sumindo assim do nada")
			scr_text("É que eu vou lá as vezes pra descansam, é o unico lugar q eu tenho sussego e-")
		break
		
		case "cut007-2":
			//dummy se afasta e as coisas ficam escuras
			scr_text("...espera, vc não estava inativo? como que vc está aqui... a não que... vo-você é um fantasma?!")
		break
		
		case "cut007-3":	
			//fog desaparece
			scr_text("Não. um espirito gentil me consertou")
		break
		
		case "cut007-4":	
			//dummy camhinha pra preto dnv
			scr_text("Ah")
			scr_text("Pera se vc sabia que eu tava lá pq não me consertou?")
			scr_text("A) Eu não sou um engenheiro B) Eu não tenho mãos C) As aranhas iriam encher o meu saco D) Msm se eu te conserta-se eu não sei abrir a porta, eu só arrombo a janela pra entrar e E) EU NÃO TENHO MÃOS")
			scr_text("São... bons motivos")
		break
		
		case "cut007-5":	
			//dummy fica girando/dancinha feliz
			scr_text("Ai que emoção! fazia tempo que eu não via um guardião por aqui")
			scr_text("Um oque?")
		break
		
		case "cut007-6":
			//dummy olha pra frente rindo
			scr_text("Ora, o seu modelo: ''Gurdião''! como que vc não sabe disso haha")
		break
		
		case "cut007-7":	
			//dummy fica serio
			scr_text("Não, serio, isso é tipo, o basico, como que não sabe disso")
		break
		
		case "cut007-8":	
			//recy olha pro lado
			scr_text("Foi mal, eu to esse bug estranho que não me permite baixa outros pacotes de informação, então eu meio que não sei o ''basico''")
			scr_text("...Serio? Isso é")
		break
		
		case "cut007-9":	
			//dummy dancinha recy frente
			scr_text("PERFEITO!")
			scr_text("Co-como assim?")
			scr_text("Sabe, eu não sou um dummy por nada, eu fui feito para treinar diversos robos, o seu modelo era o meu preferido de ser professor, porém, normalmente, eu ensinava coisa mais... avançada")
			scr_text("Ah... foi mal-")
			scr_text("Mas quem se importa? Eu não me importo! é melhor absorver o conhecimento de forma tardia do que viver na sombra da ignorancia...")
			scr_text("(Poético)")
		break
		
		case "cut007-10":	
			//dummy fica normal
			scr_text("por favor, me permita te ensinar, significaria muito pra mim!")
			scr_text("Uhhhhhhh tá bom né, eu to precisando que umas aulinhas msm")
			scr_text("yayyyyyy! Beleza, presta atenção")
		break
		
		case "cut007-11":
			scr_text("HORA DO TUTORIAL")
			scr_text("Blz! Energia é usada pra realizar ações, oq são ações? São todos os movimentos e truques que se pode usar numa batalha, selecionando eles no cartão de batalha")
			scr_text("Ai a gente tem tensão, vc ganha tensão quando é atacado, normalmente ela não faz nada, mas se passar de um ponto vc perde resiliencia e out- oh pera vc não sabe oq isso faz ainda né?")
		break
		
		case "cut007-12":	
			//dummy sua
			scr_text("T- ta bom, acho que a gente precisa revisar os status primeiro, ATK e ATK-ESPECIAL são usados para dar dano, fisico e especial respectivamente, fisico é... auto-explicativo e especial... ok, na vdd as vezes ATK é usado em ataques não fisicos, mas vc ele se refere a força fisica no seu corpo usada pra atacar (EU TÔ USANDO MUITO A PALAVA ATAQUE)")
		break
		
		case "cut007-13":
			//dummy sua mais
			scr_text("Quer dizer- vc tbm tem se preucupar com o alcance já que os inimigos se mover então vc tem que usar o ''C'' pra lugar de lugar e.......")
		break
		
		case "cut007-14":
			//pausa e ele olha pra tras
			scr_text("que droga viu *suspiro* ai ai. isso não tá dando certo. Posso ser sincero parceiro? Ensinar de forma didatica é tão... pifil")
			scr_text("Vc nem deve ter entendido nada certo? que jeito vagabundo de ensinar, ficar só... recitando um texto... isso, isso não é o suficiente. Não se preocupe aluno, eu conheço um metodo muito mais pratico")
		break
		
		case "cut007-15":
			//facas aparecem e dummy sorriso maliciosamente
			scr_text("A DOR É O MELHOR PROFESSOR")
		break
		
		case "cut007-16":
			//dummy fica calmo
			scr_text("Finalmente, o desejo sanguinario do dummy foi contido eternamente. fim")
		break
		
		case "cut007-17":
			//pausa
			//recy e dummy riem
			scr_text("Ok ok isso foi bem divertido admito")
			scr_text("Vc é um otimo aluno recy! aqui, pode ficar com isso, fui eu msm q fiz")
			scr_text("(Recy ganhou uma medalinha)")
			scr_text("Fico feliz em ter sido divertido de educar, mas vc sabe onde fica o laboratorio mais proximo? ainda preciso arrumar esse bug","rc")
		break
		
		case "cut007-18":
			//dummy sua
			scr_text("Voc- você tá bem do que está! Eu já vi muitos guardiões e vc com certeza é o mais bem feito deles! Não precisa de conserto")
			scr_text("Agradeço, mas faria mal um checkup basico, e eu tbm gostaria de conhecer outros guardiões")
		break
		
		case "cut007-19":	
			//dummy vai um pouco pra tras
			scr_text("Oh! uh....... é que a rede ela meio que não existe mais")
			scr_text("Oh então eles trocaram ela? blz é só pedir pra me conectarem na nova")
		break
		
		case "cut007-20":	
			//dummy vai mais pra tras e sua2
			scr_text("Recy, querido, eles... e-el- eles não vão vir. Os humanos, os guardiões... se foram, a muito tempo")
			scr_text("Co-como ass-ssim? (tremendo)")
		break
		
		case "cut007-21":	
			//dummy triste e quando vai embora a camera vai pro recy
			scr_text("Droga... eu não fui programado pra isso. Recy, eu acho que eu preciso pensar isso melhor, eu já volto tá? (sai)")
		break
		
		case "cut007-22":	
			//alter fala fora da tela (house flower cmc)
			scr_text("Eae Recy!")
		break
		
		case "cut007-23":	
			//recy anda até ele no espelho, alter normal
			scr_text("Oh uh vc não tava no laboratorio?")
			scr_text("Eu não fico preso a só um lugar bobinho haha...ha")
			scr_text("Aconteceu alguma coisa?")
		break
		
		case "cut007-24":	
			//recy olha pra tras alter olha pro chão cabisbaixo(triste)
			scr_text("... Eu pensei, eu e-... achei que eu só estava em um distrito abandonado talvez, mas não. A cidadela, ela... está em ruinas, oq aconteceu...?")
			scr_text("Eu... eu não sei Recy, eu sinto muito, eu sinto muito msm")
			scr_text("... O dummy, ele falou que meu modelo era especial, um guardião, para a cidade... então se ela já caiu, significa que eles falharam... eu falhei. Oq eu faço agora Alter, meu proposito é irrelevante")
		break
		
		case "cut007-25":	
			//pausa balao ! por um tempo alter normal
			scr_text("O alerta!")
			scr_text("Que alerta?")
		break
		
		case "cut007-26":	
			//recy olha pra frente
			scr_text("Quan- quando eu liguei o computador central, tocou uma alerta, era um aviso, mandava todo mundo se refugiar na mansão Zahl. Um refugio que os manteria seguro até os guardiões lidarem com o perigo")
			scr_text("Meu modelo ''Guardião'' eles estavam falando de nós! de mim! Alter, eles não se foram, eles ainda estão lá, me esperando, nos temos que resgata-los!")
		break
		
		case "cut007-27":	
			//alter fica surpreso pq aqui ele percebe que recy realmente pode ser o polylute
			//alter ficar supreso
			scr_text("... Mansão? Tá falando da mansão zahl?!")
			scr_text("R-Recy, ela tá no centro de NERA, é muito longe! Como vc vai chegar até lá?!")
			scr_text("Eu não ligo, é o meu dever, meu proposito! Aquelas pessoas estão contando cmg")
		break
		
		case "cut007-28":	
			//alter olha pro lado
			scr_text("Proposito... é?")
			scr_text("Talvez... realmente seja...")
		break
		
		case "cut007-29":	
			//alter olha pra frente
			scr_text("Bom não é como se vc tivesse nada melhor pra fazer né? Conte cmg, não sou o melhor lutador mas posso de tratar em um piscar de olhos!")
			scr_text("*risos* valeu")
			scr_text("Pq ainda estamos aqui? não quer deixar eles esperando mais tempo né? Vamos nessa!")
		break
		
		case "cut007-30":	
			scr_text("Recy! a esperança de NERA!!!","al")//recy posa
		break
		
		case "cut007-31":	
			scr_text("Que barulho é esse?!") //bangman chega
		break
		
		case "cut007-32":	
			scr_text("O loko, oq vc, tipo, tá fazendo?")
			scr_text("... Treinando pose e discurso... sabe pra... farmar aura?")
			scr_text("legal, me convida no proximo, ce sabe, treino, o pai aqui, pode te ensinar, umas coisas, sabe, sobre ser maneiro, flw~")
		break
		
		case "cut007-33":
			//Recy fica com vergonha e tira a pose
			scr_text("(Eu provavelmente deveria ir indo)")
		break
		
		case "cut008":
			scr_text("Recy, que bom te ver! desculpa ter saido assim tão de repente, é meio complicado explicar, principalmente pra o seu modelo, eu só-")
			scr_text("Não, tá tudo certo, não precisa de desculpar","rc")
			scr_text("Que bom... Acredito que vc vá explorar NERA agora, correto? Então eu preparei um presente pra vc")
			scr_text("(Recy recebeu modelo de espada do Dummy)")
			scr_text("Eu percebi que a sua adaga estava meio defasada, então eu quero q vc leve isto ao ferreiro, ele irá fazer uma espada de respeito pra vc")
			scr_text("Não se preucupe com o dinheiro, eu já o paguei adiantado, eu gostaria muito de ir lá pegar pra vc, mas eu tenho que dar aula agora, você consegue chegar lá sozinho né?")
		break
		
		case "cut008-1":	
			scr_text("Até lá pode usar essa espada comum, é melhor que nada")
		break
		
		case "cut008-2":		
			scr_text("Opa, vc vai dá um role? show, saca, uma ajudinha pra vc")
			scr_text("(Bangman lhe entregou uma paçoca! ...já comida pela metade)")
		break
		
		case "cut008-3":	
			scr_text("Flw~")
			scr_text("Até mais recy, qualquer coisa estou aqui")
		break
		
		case "cut008-4":
			scr_text("(Recy cria um bloco de notas digital para anotar informações gerais, vc pode checa-lo nos itens-chave)")
		break
	}
	
	switch(_text_id){////////%npcs
		
		case "mural de avisos":
			scr_text("É um mural de avisos, não parece ser usado a muito tempo. A mensagem mais recente diz: ''Por motivos de segurança, o sistema da porta foi atualizado para só abrir com um cartão de acesso level 1 pra cima-")
			scr_text("-Se você não tem o seu cartão você pode fazer um no computador mestre. Lembre-se de trancar novamente a porta na hora de saida, irá ser descontado no salário caso contrário''")
			
		break
		
		case "placa_computador":
			scr_text("''Laboratorio de informatica''")
			scr_text("''Não permitido uso não profissional dos aparelhos''")
			scr_text("''nota: usar o pc mestre pra ver filmes em full HD 4K definitivamente não é profissional''")
			scr_text("''A menos que seja junto cmg''")
		break
		
		case "dummy desativado":
			scr_text("É um boneco de treino. Seus olhos estão vazios")
		break
		
		case "peças bloqueando computador1":
			scr_text("Pedaços do teto estão bloqueando a entrada, você está muito fraco para move-los")
		break
		
		case "peças bloqueando computador2":
			scr_text("Pedaços do teto estão bloqueando a entrada")
				scr_option("Abrir caminho","peças bloqueando computador abrir")
				scr_option("Deixa pra lá","")
		break
		
		case "peças bloqueando computador3":
			scr_text("Pedaços do teto, organizadas por cor")
		break
		
		case "peças bloqueando computador abrir":
			scr_text("(Arregaça as suas hipoteticas mangas)")
		break
		
		case "porta trancada inicio":
			scr_text("A porta não se move por nada")
		break
		
		case "telefone inicio jogo":
			scr_text("A um painel telefonico, talvez você possa usar pra pedir ajuda?")
				scr_option("Ligar","cut004-1")
				scr_option("Ainda não","")
		break
		
		case "telefone inicio jogo2":
			scr_text("É um painel telefonico, não parece muito util")
		break
		
		case "computador mestre":
		//lembra de colocar a cut com o alerta
			scr_text("Este é o computador mestre, portador de toda DATA, rodando programas de ultima geração. Surpreendentemente, não tem senha")
				scr_option("Encarar a tela","cm encarar tela")
				scr_option("Acessar a internet","cm internet")
				scr_option("Assistir filmes","cm filmes")
		break
		
		case "cm encarar tela":
			scr_text("Você encara o papel de parede","nor","nor","inv")
			scr_text("Que uso produtivo do seu tempo!")
		break
		
		case "cm filmes":
			scr_text("Não tem nenhum que você gosta. Se bem que vc ainda não sabe oq vc gosta")
		break
		
		case "cm internet":
			scr_text("Você conecta a internet e pesquisa por... uhm? Que estranho, o pc não consegue entrar na rede por algum motivo")
		break
		
		case "bangman tutorial1":
			scr_text("Mano, que azar, tipo, minha arma, tá ligado, ficou sem bateria, ai saca, não dá atirar, nos recepitores, então sem porta, sacou mano?")
			scr_text("Então nos estamos presos?","rc")
			scr_text("Que isso mano, coisa nenhuma, você não consegue, tipo, atirar, com o seu olho né? Precisar apertar ''A'', tá ligado")
		break
		
		case "bangman idosa piada":
		//adicionar fala sobre jardinagem
			scr_text("Meu sobrinho recentimente tá passando tempo demais com aquele robozinho, eu não gosto muito dele")
			scr_text("É pq ele atirou em vc?","rc")
			scr_text("Uh? oq? NÃO! de onde vc tirou isso? ele nunca faria isso. Eu não gosto dele pq tive que dar todo o meu dinheiro quando perdi no truco pra ele, não apostem crianças!")
			scr_text("OI?! Quer dizer, deve ter sido uma perda terrível, quanto que foi?","rc")
			scr_text("Era de -1069 Reais")
			scr_text("Mas isso é um valor negativo","rc")
			scr_text("Exato! Eu perdi de proposito pra ele pagar as minhas dividas! Apostem crianças!")
		break
		
		
		
	}
	
	switch(_text_id){////////%Itens
		
		case "item_nada_aconteceu":
			scr_text("Mas nada aconteceu")
		break
		
		case "bloconotas":
			scr_text("Oq vc gostaria de ver sobre?")
				scr_option("Chega","")
				scr_option("Movimentação","bloconotas-movi")
				scr_option("Status","bloconotas-status")
				scr_option("Batalha","bloconotas-batalha")
				scr_option("Contexto","bloconotas-contexto")
		break
		
		case "bloconotas-movi":
			scr_text("Oq vc gostaria de entender sobre movimentação?")
				scr_option("Voltar pro inicio","bloconotas")
				scr_option("Atirar","")
				scr_option("Dash","")
				scr_option("Correr","")
		break
		
		case "bloconotas-status":
			scr_text("Oq vc gostaria de entender sobre status?")
				scr_option("Voltar pro inicio","bloconotas")
				scr_option("HP","")
				scr_option("RES","")
				scr_option("ATK & ATKE","")
				scr_option("DEF","")
				scr_option("SPD","")
				scr_option("TEN & TEN LEVEL","")
		break
		
		case "bloconotas-batalha":
			scr_text("Oq vc gostaria de entender sobre batalhas?")
				scr_option("Voltar pro inicio","bloconotas")
				scr_option("Ações","")
				scr_option("Cartão de batalha","") //explicar folego
				scr_option("Inimigos","") //como funcionam os inimigos e seus ataques
		break
		
		case "bloconotas-contexto":
			scr_text("Você quer lembrar sobre oq?")
				scr_option("Voltar pro inicio","bloconotas")
				scr_option("História","")
				scr_option("Pessoas","")
				scr_option("Recap de tudo que aconteceu","")
		break
		
	}
	
	switch(_text_id){////////%Saves
		
		case "saveantescartão1":
			scr_text("Enquanto eu tava consertando vc é vi uns folhetos sobre o sistema de segurança, acredito que você precise de uma cartão de acesso pra passar (Que original), mas onde será que você vai achar um?","al")
		break
		
		case "savedepoiscartão1":
			scr_text("Você achou o cartão Recy?","al")
			scr_text("Pera você fez um, no computador mestre!?","al")
			scr_text("Tinha jogos lá?","al")
		break
		
		case "savebacktracking":
			scr_text("Recy, o que você tá fazendo aqui?","al")
			scr_text("Só dando mais uma olhada","rc")
		break
		
		case "dummy post tutorial":
			scr_text("Eu achei, uh, a pose maneira, vc deveria fazer mais vezes")
		break
		
		case "alterracista_préarranhas":
			scr_text("Aquele cara é chato né?","al")
			scr_text("Sim, mas não o culpo, os sensores dele não estão nas melhores condições","rc")
			scr_text("Falando em chato, mais a frente vc vai se encontrar com as tecedores. Oque vc precisa saber é que as azul são de boa, mas lhe aconselho ficar longe das vermelhas, elas são perigosas","al")
			scr_text("Isso é racismo","rc")
			scr_text("...Não, não é- eu... vai se lascar","al")
		break
		
		
	}
	
	switch(_text_id){////////%Batalha

case "text_victory":
scr_text($"Você venceu! você coletou {_1_info} de residuo espiritual!")
	scr_text_float(0,12,2)
break

case "tb_flavor_text_temporário":
scr_text("        Algo deu errado, esse texto não deveria aparecer lol")
break

case "tb_generic":
scr_text("Hora de batalhar!")
break

case "tb_generic2":
scr_text("Texto longo pra testar kepckup é legal olha i i i i i ssso que legal que ficou uauau aua agua funeralTexto longo pra testar kepckup é legal olha i i i i i ssso que legal que ficou uauau aua agua funeralTexto longo pra testar kepckup é legal olha i i i i i ssso que legal")
break

case "tb_generic_flavor":
scr_text(string(_1_info) + " bloqueia o seu caminho!")
break

case "tb_char_attack_generic":
scr_text("Inimigo(s) foram atacados!")
break

case "tb_char_faisca":
//scr_text("    "+string(_1_info)+" atacou "+string(_3_info)+" com uma faísca!")
scr_text(string(_2_info)+" foi atacado por "+"    "+string(char_battle_info(_1_info,1))+" com uma faísca!")
	scr_icon_char_name(srosto_kris_1,string_length(string(_2_info)+" foi atacado por "),_1_info)
break

case "tb_char_cura":
scr_text("    "+string(char_battle_info(_1_info,1))+" curou "+"    "+string(char_battle_info(_2_info,1))+"!")
	scr_icon_char_name(srosto_kris_1,0,_1_info)
	scr_icon_char_name(srosto_kris_1,string_length("    "+string(char_battle_info(_1_info,1))+" curou "),_2_info)
break

case "tb_char_machuca":
scr_text("    "+string(char_battle_info(_1_info,1))+" machucou "+"    "+string(char_battle_info(_2_info,1))+"!")
	scr_icon_char_name(srosto_kris_1,0,_1_info)
	scr_icon_char_name(srosto_kris_1,string_length("    "+string(char_battle_info(_1_info,1))+" machucou "),_2_info)
break

case "tb_char_lombriga":
scr_text("    "+string(char_battle_info(_1_info,1))+" sugou os nutrientes de todos na fileira!")
	scr_icon_char_name(srosto_kris_1,0,_1_info)
break

case "tb_char_costura_de_pele":
scr_text("    "+string(char_battle_info(_1_info,1))+" costurou todos no chão!")
	scr_icon_char_name(srosto_kris_1,0,_1_info)
break

case "tb_enemy_faz_nada":
scr_text(string(_1_info) + " faz porra nenhuma")
break

case "tb_enemy_arranhao":
scr_text(string(_1_info)+" arranha "+"    "+string(char_battle_info(_2_info,1))+"!")
	scr_icon_char_name(srosto_kris_1,string_length(string(_1_info)+" arranha "),_2_info)
break

case "tb_enemy_luva":
scr_text($"{string(_1_info)} aperta suas luvas. Preste atenção nos seus muros!")
break

case "tb_char_evapora_agua":
scr_text("    "+string(char_battle_info(_1_info,1))+" evaporou toda agua!")
	scr_icon_char_name(srosto_kris_1,0,_1_info)
break



	}
		
	switch(_text_id){ ////////%Loja

case "talk_lojaatend":
scr_text("Como posso ajudar?","npc_2","nor","nor","nor",0)
	scr_option("Bater um papo","talk2_lojaatend")
	scr_option("Negócios","vender_template")
break

case "talk2_lojaatend":
scr_text("Conversar? Uh, por que não?","npc_3","nor","nor","nor",0)
	scr_option("Laboratorios","labs_latend")
	scr_option("O incidente","incidente_latend")
	scr_option("Rotina","rotina_latend")
	scr_option("Chega","talk_lojaatend")
break

case "labs_latend":
	scr_text("Aqui são- Quer dizer, ERA os laboratorios e zonas de teste do NERA, correto? Porque que ele tá...","rc","nor","nor","nor",0)
	scr_text("Uma bagunça? Culpe a Alura","npc_3","nor","nor","nor",0)
	scr_text("Quem?","rc","nor","nor","nor",0)
	scr_text("Alura, ela é uma super inteligencia artificional que cuidava da infraestrura. Ela fazia parede, construia plataformas, ajustava o terreno, basicamente segurava as pontas até os engenheiros consertassem","npc","nor","nor","nor",0)
	scr_text("Mas ai, teve o ''incidente'' e a Alura ficou sobrecarregada com tanta destruição","npc","nor","nor","nor",0)
	scr_text("Após alguns meses ela estava criando quebra-cabeças e dificultando passagens, recentemente ela decidiu fazer esses puzzles de atirar, eles são um saco viu","npc_3","nor","nor","nor",0)
	scr_text("E não dá pra pedir pra Alura parar?","rc","nor","nor","nor",0)
	scr_text("E como vc planeja fazer isso? A Alura não tem uma voz, ou um corpo, ela envolve todo o complexo de NERA. Até onde eu sei, só o chefe de da cidade pode mandar nela, mas ele...","npc","nor","nor","nor",0)
	scr_text("Ainda bem que ele não esta aqui para ver sua cidade em ruinas","npc_3","nor","nor","nor",0)
break

case "incidente_latend":
	scr_text("E eu lá vou saber?","npc_3","nor","nor","nor",0)
	scr_text("Só sei que ocorreu algo muito impactante, tao destrutivo que colocou a cidade mais evoluida do mundo em ruinas","npc","nor","nor","nor",0)
	scr_text("Ou algo assim, e tava hibernando quando ocorreu, talvez vc devesse perguntar para as aranhas, pra elas esse evento foi grande coisa","npc","nor","nor","nor",0)
break

case "rotina_latend":
scr_text("Desculpa te decepcionar, mas a minha vida não é nada interessante, mesmo depois do incidente","npc_3","nor","nor","nor",0)
scr_text("As vezes eu saiu pra recolher materias, faço acordos com alguns robos, o de sempre","npc","nor","nor","nor",0)
scr_text("Tipo, é legal, mas nada emocionante. Quero dizer, eu gosto da minha vida assim, tranquila, sem preocupações. Vivendo até a energia acabar para sempre","npc_2","nor","nor","nor",0)
scr_text("...","npc","nor","nor","nor",0)
scr_text("Ta bom, eu não sei ser misterioso","npc_3","nor","nor","nor",0)
break

case "vender_template":
scr_text("O que gostaria de fazer?")
	scr_option("Vender itens","vender_itens")
	scr_option("Vender equipamento","vender_equip")
break

case "vender_itens":
scr_text("", "no voice",-100,"inst")
if global.delay_text_bug=0{
		global.delay_text_bug=5
var _inst=instance_create_depth(x,y,-9999,oMenu_item)
_inst.vender_mode=1
}
break

case "vender_equip":
scr_text("", "no voice",-100,"inst")
if global.delay_text_bug=0{
		global.delay_text_bug=5
var _inst=instance_create_depth(x,y,-9999,oMenu_equip)
_inst.vender_mode=1
}
break

case "paço_descl":
scr_text("Quem não gosta de uma paçoquinha? Simples e deliciosa!","npc_2","nor","nor","nor",0)
scr_text("Bom, eu acho, eu e vc não conseguimos provar já que somos... robôs né","npc","nor","nor","nor",0)
scr_text("Na verdade, eu fui equipado com um orgão arficial que me permite transforma massa organica em eletricidade, além de identificar o sabor. Então, eu consigo","rc","nor","nor","nor",0)
scr_text("He he he, Bastardo","npc_2","nor","nor","nor",0)
break

case "esp_comum_descl":
scr_text("Se você estava procurando por uma espada ...robusca? uhhh","npc_2","nor","nor","nor",0)
scr_text("Essa espada é perfeita para...?","npc","nor","nor","nor",0)
scr_text("Pera ai, já vem","npc","nor","nor","nor",0)
scr_text("Esse modelo é o mais amigavel pros iniciantes porque... por que... É eu confesso, essa espada não tem nada demais, mas tipo, é melhor que nada né?","npc_3","nor","nor","nor",0)
break

	}


	
		///////
}