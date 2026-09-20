var _box_w=camera_get_view_width(view_camera[0])
var _x=camera_get_view_x(view_camera[0])
var _y=camera_get_view_y(view_camera[0])
var _ybaixo=camera_get_view_y(view_camera[0])+camera_get_view_height(view_camera[0])-box_h
var _box_xscale= _box_w/sprite_get_width(sblack)
var _box_yscale= box_h/sprite_get_height(sblack)

//fundo preto
draw_sprite_ext(sblack,0,_x,_y,_box_xscale,_box_yscale,0,c_white,1)
draw_sprite_ext(sblack,0,_x,_ybaixo,_box_xscale,_box_yscale,0,c_white,1)

//lista de pedidos em cima e dinheiro
var _cooking_total=0 //numero total de pratos sendo cozinhados ao mesmo tempo
for (var i = 0; i < array_length(global.lista_pedidos); i++){
	//checar se é possivel fazer
	var _loading_circle_inversed=0
	var _cooking=0
	var _can_cook=0
	var _c=c_red
	var _inst = global.lista_pedidos[i][0]
	var _check=0
	if global.ing_alface>=_inst.alface and
	global.ing_carne>=_inst.carne and
	global.ing_morta>=_inst.morta and
	global.ing_pao>=_inst.pao and
	global.ing_queijo>=_inst.queijo and
	global.ing_tomate>=_inst.tomate {_can_cook=1} //dá pra cozinhar
	
	if instance_exists(omaid_comida){ //checa se está sendo cozinhado
		for (var o = 0; o < instance_number(omaid_comida); o++){
				var _inst=instance_find(omaid_comida,o)
				if _inst.id_cliente=global.lista_pedidos[i][1]{
					_cooking=1
			}
		}
	}
	
	_cooking_total=instance_number(omaid_comida)
	if !_cooking and _can_cook and _cooking_total<cooking_total_max{ //se o pedido está esperando a ser cozinhado e tem ingredientes e se dá pra cozinhar mais um ao mesmo tempo
				number_pedido++
				instance_create_depth(x,y,depth,omaid_comida, {id_cliente: global.lista_pedidos[i][1], order: global.lista_pedidos[i][0], pedido: number_pedido})
				_cooking=1
			}
	
	
	var _x_food=x+20+40*(i)
	
	if _cooking{
		_c=c_yellow
		_loading_circle_inversed=1 
		for (var j = 0; j < instance_number(omaid_comida); j++){
			var _inst=instance_find(omaid_comida,j)
			if _inst.id_cliente=global.lista_pedidos[i][1]{
				val = _inst.cook_points
				val_max= _inst.cook_goal
				color_start = c_red;
				color_end = c_green;
				}
		}
	} else if _can_cook {
		_c=c_yellow
	}
	
	draw_circular_bar(_x_food,20 , 100, 100, _c, loading_radius, 1, loading_width)
	
	if _cooking{
		transition_progress = val/val_max
		////////////////
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
		draw_circular_bar(_x_food,20 , val, val_max, _cc, loading_radius, 1, loading_width)
		
	}
	
	draw_sprite(global.lista_pedidos[i,0].spr,0, _x_food,20)
}

draw_text(camera_get_view_x(view_camera[0])+camera_get_view_width(view_camera[0])-25,box_h/2,global.money)

//relogio e botão pra loja
if t_min<10{extra_zero="0"} else {extra_zero=""}
draw_text_ext_transformed(_x+20,_ybaixo+box_h/4, string(t_hour)+":"+string(extra_zero)+string(t_min)+"  "+string(time_work_total),0,999,2,2,0)

//Desenhar o botão da loja
y_botao_loja=_ybaixo+box_h/2
if (mouse_x > x_botao_loja - largura_botao_loja/2 and mouse_x < x_botao_loja + largura_botao_loja/2 and
    mouse_y > y_botao_loja - altura_botao_loja/2 and mouse_y < y_botao_loja + altura_botao_loja/2) 
{
	time_botao_loja+=0.1
    escala_nova_botao_loja=1.2
    angulo_botao_loja = sin(time_botao_loja) * 5; // -5 a +5 graus
	if mouse_check_button_pressed(mb_left) and !instance_exists(oloja_ingre){
		instance_create_depth(x,y,depth,oloja_ingre) escala_botao_loja=2}
} else {escala_nova_botao_loja=1 angulo_botao_loja=lerp(angulo_botao_loja,0,0.1)}

escala_botao_loja = lerp(escala_botao_loja, escala_nova_botao_loja,0.4)
draw_sprite_ext(sbotao_loja, 0, x_botao_loja, y_botao_loja, escala_botao_loja, escala_botao_loja, angulo_botao_loja, c_white, 1);

//happiness
var _text="Felicidade\n" +  string(global.happiness)+"%"
draw_text(x_botao_loja-string_width(_text)-10, y_botao_loja-10,_text)

//debug

var _ing_text= string(global.ing_alface) + " alf \n" + string(global.ing_tomate) + "tomate \n" + string(global.ing_pao) + "pao \n" + string(global.ing_morta) + "morta \n" + string(global.ing_carne) + "carne \n" + string(global.ing_queijo) + "queijo \n"

draw_text(x,y+ box_h,_ing_text)

draw_text_outline(mouse_x,mouse_y,string(mouse_x)+"/"+string(mouse_y))
draw_text(mouse_x,mouse_y,string(mouse_x)+"/"+string(mouse_y))