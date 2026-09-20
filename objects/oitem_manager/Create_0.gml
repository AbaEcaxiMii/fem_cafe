
////////////////Inventario
inv=array_create(0)
inv_sell=array_create(0)
inv_key=array_create(0)
bau_inv=array_create(0)
weapon_inv=array_create(0)
armor_inv=array_create(0)
main_inv=array_create(0)

equip_inv_max=50
inv_max=10
inv_max_key=30
inv_max_sell=90
//100

//0Main/1Weapon/2Armor1/3Armor2/4Armor3
invp[0,0]=global.equip_list.main_nada
invp[0,1]=global.equip_list.esp_nada
invp[0,2]=global.equip_list.arm_nada
invp[0,3]=global.equip_list.arm_nada
invp[0,4]=global.equip_list.arm_nada

invp[1,0]=global.equip_list.main_nada
invp[1,1]=global.equip_list.esp_nada
invp[1,2]=global.equip_list.arm_nada
invp[1,3]=global.equip_list.arm_nada
invp[1,4]=global.equip_list.arm_nada

invp[2,0]=global.equip_list.main_nada
invp[2,1]=global.equip_list.esp_nada
invp[2,2]=global.equip_list.arm_nada
invp[2,3]=global.equip_list.arm_nada
invp[2,4]=global.equip_list.arm_nada

invp[3,0]=global.equip_list.main_nada
invp[3,1]=global.equip_list.esp_nada
invp[3,2]=global.equip_list.arm_nada
invp[3,3]=global.equip_list.arm_nada
invp[3,4]=global.equip_list.arm_nada

invp[4,0]=global.equip_list.main_nada
invp[4,1]=global.equip_list.esp_nada
invp[4,2]=global.equip_list.arm_nada
invp[4,3]=global.equip_list.arm_nada
invp[4,4]=global.equip_list.arm_nada

var _v=0

//item_add(global.item_list.paco,_v)
//item_add(global.item_list.paco2,_v)
//item_add(global.item_list.feijao,_v)
//item_add(global.item_list.esto_ave,_v)
//item_add(global.item_list.paco,_v)
//item_add(global.item_list.default_food,_v)
//item_add(global.item_list.cafe_puro,_v)
//item_add(global.item_list.banana,_v)

//item_add(global.equip_list.main_def,_v)
//item_add(global.equip_list.esp_def,_v)
//item_add(global.equip_list.arm_def,_v)

//item_add(global.item_list.cartao,_v)
//item_add(global.item_list.blonotas,_v)

//array_push(bau_inv,global.item_list.feijao)
