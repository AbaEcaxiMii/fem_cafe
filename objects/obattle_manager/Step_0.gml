right_key = keyboard_check_pressed(global.right)
left_key = keyboard_check_pressed(global.left)
up_key = keyboard_check_pressed(global.up)
down_key = keyboard_check_pressed(global.down)
confirmar_key = keyboard_check_pressed(global.confirmar)
cancelar_key = keyboard_check_pressed(global.cancelar)
menu_key = keyboard_check_pressed(global.menu_key)
//(right_key - left_key)
//(down_key-up_key)

global.can_move=0

box_rows_xy()

//atualizando o bg
layer_x(layer_id_not_bg, bg_x)
layer_y(layer_id_not_bg, bg_y)
bg_x+=bg_go_x
bg_y+=bg_go_y

switch (number_bg){
	case 1:
		glow_power+=glow_speed
		if glow_power>1 or glow_power<0{glow_speed*=-1}
		glow_power=clamp(glow_power,0,1)
		fx_set_parameter(glow_fx, "g_GlowIntensity", glow_power)
	break
	
	case 2:
		fx_set_parameter(ripples_fx, "g_RipplesPosition",[camera_get_view_x(view_camera[0])+camera_get_view_width(view_camera[0]),camera_get_view_y(view_camera[0])+camera_get_view_height(view_camera[0])])
	break
	
	case 3:
		distort_power+=distort_speed
		if distort_power>160 or distort_power<60{distort_speed*=-1}
		distort_power=clamp(distort_power,60,160)
		fx_set_parameter(distort_fx, "g_DistortAmount", distort_power)
	break

	case 4:
		layer_x(layer_id_not_bg2, bg_x2)
		layer_y(layer_id_not_bg2, bg_y2)
		bg_x2+=bg_go_x2
		bg_y2+=bg_go_y2
	break
}

//ajeitando a cor do desespero
if (end_of_battle) {deses--} //else {deses+= (keyboard_check(global.right) - keyboard_check(global.left))}
deses=clamp(deses,0,deses_max)
transition_progress = deses/deses_max;

if intervalo_btw_attacks>0{intervalo_btw_attacks-- intervalo_btw_attacks=clamp(intervalo_btw_attacks,0,mintervalo_btw_attacks)}
if !have_enemies(){no_more_enemies()}


//o limitador do spell seletc tá lá encima

//fo_meter+=(right_key - left_key)
//fo_meter2+=(down_key-up_key)


