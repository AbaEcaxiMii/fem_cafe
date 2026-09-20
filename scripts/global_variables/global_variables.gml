//algumas anotações importantes
//ctrl + tab abre a tabela com as janelas ativas, tira as que não estão sendo usadas
//shift + tab em um texto selecionado faz ele ir para atrás
//var=!var 1=-1
//Music 100 Action/click sounds 90 Enemy sounds 80 Ambient 50 <-prioridade de musica

//controles
global.right =vk_right
//vk_right 39
global.left =vk_left
//vk_left 37
global.up =vk_up
//vk_up 38
global.down=vk_down
//vk_down 40
global.confirmar=ord("A")
//ord("Z") 90
global.cancelar=ord("S")
//ord("X") 88
global.menu_key=ord("D")
//ord("C") 67
global.correr= global.cancelar

//Player
global.nameplayer="Nikhil"
global.can_move=1
global.auto_correr=0
global.debug_mode=1
global.podedano=true
global.invi_frames=40
global.exp=2 //quantos fragmentos de alma tem sobrando
global.level=1
global.exp_storage=0

//Textbox
global.delay_text_bug=0
global.trans_back_menus=0.8
global.cool_type_long_text=30
global.cool_type_inv_text=90
global.txtb_spr= sTextbox
global.txtb_spr_back= sTextbox_back

//Music
global.masterVol= 1
global.musicVol= 1

//Battle
global.battle_mode=false
global.hp=0 //global.party_list.recy.hp no party manager
global.mhp=0 //global.party_list.recy.mhp no party manager
global.orange_attacks=[3]

//language
global.language=0 //0 portugues 1 ingles

//Loja
global.loja_estoque=[]
global.loja_avenda=["noone","noone","noone","noone"]

array_push(global.loja_estoque,global.charm_list.fast_charm)
array_push(global.loja_estoque,global.charm_list.gcharm)
array_push(global.loja_estoque,global.charm_list.postura_raiva_charm)
array_push(global.loja_estoque,global.charm_list.postura_defesa_charm)
array_push(global.loja_estoque,global.charm_list.postura_agilidade_charm)
array_push(global.loja_estoque,global.charm_list.ninho_charm)
array_push(global.loja_estoque,global.charm_list.estatua_mortal_charm)
array_push(global.loja_estoque,global.charm_list.morri_pronto_charm)
array_push(global.loja_estoque,global.charm_list.amor_vida_charm)
array_push(global.loja_estoque,global.charm_list.odio_vida_charm)
array_push(global.loja_estoque,global.charm_list.polimata_charm)
array_push(global.loja_estoque,global.equip_list.esp_def)


//Femboy cafe
global.money=0