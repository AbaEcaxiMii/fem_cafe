draw_sprite_ext(sprite_index,image_index,x,y,scalex,scaley,image_angle,image_blend,image_alpha)
var x_pos = x
if y>=90{var y_pos = y-40} else {var y_pos = y+40}
var _order_scale = 0.5    
var spr_width = sprite_get_width(order.spr);
var spr_height = sprite_get_height(order.spr);
   
if paci<paci_max{
	// Verifica se o mouse está sobre a opção
	if (mouse_x > x_pos - spr_width/2 && mouse_x < x_pos + spr_width/2 &&
		mouse_y > y_pos - spr_height/2 && mouse_y < y_pos + spr_height/2) and !instance_exists(oloja_ingre){
		_order_scale=1
		if mouse_check_button_pressed(mb_left) and !order_anotada and array_length(global.lista_pedidos)<opedidos_manager.number_pedido_max {
			order_anotada=1
			array_push(global.lista_pedidos, [order, id])
		}
	}

	order_scale=lerp(order_scale, _order_scale,0.3)

	draw_sprite_ext(sfood_circle,0,x_pos,y_pos,1,1,0,c_white,1)

		///////////////
		transition_progress = paci / paci_max;

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
		
		if maid_chegando{_cc=c_ltgrey}
		draw_pie(x_pos,y_pos, paci, paci_max, _cc, 13, 1)
		draw_sprite_ext(sfood_circle,1,x_pos,y_pos,1,1,0,c_white,1)
		if order_anotada{draw_sprite_ext(sfood_circle,2,x_pos,y_pos,1,1,0,c_green,1)}
		draw_sprite_ext(order.spr,0,x_pos,y_pos,order_scale,order_scale,0,c_white,1)
}
