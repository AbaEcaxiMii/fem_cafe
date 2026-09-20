global.tocando_music_ten=false //temporario

time_play=0
t_hour=0
t_min=0
t_sec=0

//variaveis dos followers
follow_timer_ini=20
follow_timer=follow_timer_ini
spawn_follow=1
//ESSAS COISA PRECISAM FICAR AQUI PARA RETORNAREM PROS SEUS VALORES ORIGINAIS QUANDO GAME_RESTART()
//o spd é pra ser o cool da ten, mas sei la se quero usar
function create_member(_name, _hp, _mhp, _atk, _def, _spd, _mener, _type1, _type2, _desc, _id_number) constructor
	{
		name= _name
		mhp= _mhp //Tolerância
		hp= _hp

		atk= _atk //Vínculo
		def= _def //Determinação
		spd= _spd //Agilidade
		mener= _mener //maximo de ES FG

		ty1= _type1
		ty2= _type2
		desc= _desc
		id_number= _id_number
		//original, os de cima podem sofrer alterações (Menos o id_number claro)
		base_name= _name
		base_mhp= _mhp //Tolerância
		base_hp= _hp

		base_atk= _atk
		base_def= _def
		base_spd= _spd
		base_mener= _mener

		base_ty1= _type1
		base_ty2= _type2
		base_desc= _desc
		
	}
	

global.party_list=
{
			
			doli: new create_member(
			"Dolissue",
			100,100,
			5,
			6,
			12,
			50,
			global.types_list.silk,
			global.types_list.psi,
			"Boneca de pano sujo e desbotado, mas fofa, tem poderes de costura e psíquicos",
			0
			),
			
			lamb: new create_member(
			"Lambary",
			40,40,
			12,
			10,
			8,
			80,
			global.types_list.recl,
			global.types_list.fire,
			"Menino missionário com uma vela, muitas queimaduras",
			1
			),
			
			sn: new create_member(
			"S.N",
			30,30,
			8,
			6,
			2,
			100,
			global.types_list.psita,
			global.types_list.carne,
			"Ser com parasitas por todo o corpo, seu corpo está desfigurado pela constante mutilação e regeneração",
			2
			),
			
}

global.hp=global.party_list.doli.hp
global.mhp=global.party_list.doli.mhp

global.party_members=array_create(0) //Quem está na batalha
array_push(global.party_members,global.party_list.doli)
array_push(global.party_members,global.party_list.lamb)
array_push(global.party_members,global.party_list.sn)
//array_push(oParty_manager.party_members,global.party_list.sophia)
//array_push(oParty_manager.party_members,global.party_list.emma)
global.party_length=array_length(global.party_members)

global.playable_members_total=array_create(0)
array_push(global.playable_members_total,global.party_list.doli)
array_push(global.playable_members_total,global.party_list.lamb)
array_push(global.playable_members_total,global.party_list.sn)

global.spells=array_create(0) //todas as magias que os personagens possuem
global.spells_classes=array_create(0) // magias separadas por classes
global.spells_bloqueadas=array_create(0) //magias que foram bloqueadas
global.charms=array_create(0) //quais charms estão equipados em cada personagem
global.charms_inv=array_create(0) //inventarios com os charms não equipados
global.charms_inv_total=array_create(0) //inventario com TODOS os charmes coletados, para verificar progresso
global.charms_gallery=array_create(0) //todos os charms disponiveis no jogo, e a ordem como são mostrados
global.charms_points=array_create(0) //quantos pontos o personagem tem para gastar em charms
global.charms_points_spend=array_create(0) //quantos pontos cada personagem já gastou em charmes

array_push(global.charms_gallery,global.charm_list.fast_charm)
array_push(global.charms_gallery,global.charm_list.gcharm)
array_push(global.charms_gallery,global.charm_list.postura_raiva_charm)
array_push(global.charms_gallery,global.charm_list.postura_defesa_charm)
array_push(global.charms_gallery,global.charm_list.postura_agilidade_charm)
array_push(global.charms_gallery,global.charm_list.ninho_charm)
array_push(global.charms_gallery,global.charm_list.estatua_mortal_charm)
array_push(global.charms_gallery,global.charm_list.morri_pronto_charm)
array_push(global.charms_gallery,global.charm_list.amor_vida_charm)
array_push(global.charms_gallery,global.charm_list.odio_vida_charm)
array_push(global.charms_gallery,global.charm_list.polimata_charm)

for (var i = 0; i<array_length(global.playable_members_total); i++) {
	global.spells[global.playable_members_total[i].id_number]=array_create(0) //todas as magias que os personagens possuem
	global.spells_bloqueadas[global.playable_members_total[i].id_number]=array_create(0)
	global.spells_classes[global.playable_members_total[i].id_number]=array_create(0) // magias separadas por classes
	global.spells_classes[global.playable_members_total[i].id_number][0]=array_create(0)
	global.spells_classes[global.playable_members_total[i].id_number][1]=array_create(0)
	global.spells_classes[global.playable_members_total[i].id_number][2]=array_create(0)
	global.spells_classes[global.playable_members_total[i].id_number][3]=array_create(0)
	
	global.charms[global.playable_members_total[i].id_number]=array_create(0)
	global.charms_points[global.playable_members_total[i].id_number]=0
	global.charms_points_spend[global.playable_members_total[i].id_number]=0
}


spell_add(global.spells_list.costura_pele, 0)
spell_add(global.spells_list.ember, 0)
spell_add(global.spells_list.lombriga, 0)
spell_add(global.spells_list.fire_heal, 0)

spell_add(global.spells_list.ember, 1)
spell_add(global.spells_list.fire_heal, 1)
spell_add(global.spells_list.fire_hurt_char, 1)
spell_add(global.spells_list.evapora_agua, 1)

spell_add(global.spells_list.lombriga, 2)

/*
charm_add(global.charm_list.fast_charm)
charm_add(global.charm_list.gcharm)
charm_add(global.charm_list.postura_raiva_charm)
charm_add(global.charm_list.postura_defesa_charm)
charm_add(global.charm_list.postura_agilidade_charm)
charm_add(global.charm_list.ninho_charm)
charm_add(global.charm_list.estatua_mortal_charm)
charm_add(global.charm_list.morri_pronto_charm)
charm_add(global.charm_list.amor_vida_charm)
charm_add(global.charm_list.odio_vida_charm)
charm_add(global.charm_list.polimata_charm)
*/

//array_push(global.charms[0],global.charm_list.fast_charm) //0=dolissue (personagem cmc com charme)
//array_push(global.charms[0],global.charm_list.fast_charm)


