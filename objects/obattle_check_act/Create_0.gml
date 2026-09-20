alpha_check=array_create(0)
text_status=array_create(0)
enemy_to_check=0
space=10
border=4
angle=0
textbox_spr=sTextbox_normal
textbox_spr_back=sTextbox_back_normal
delete_me=0
timer_delete=1 //serve para o menu não registrar o cancelar e voltar pro battle_state=1

for (var ii = 0; ii<instance_number(obattle_enemy); ii++) {
	alpha_check[ii]=0
}

surf = -1;
surf2 = -1;
