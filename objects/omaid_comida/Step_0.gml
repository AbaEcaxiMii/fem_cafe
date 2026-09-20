cook_points+=1 //+MAID HABI
cook_points=clamp(cook_points,0,cook_goal)
cook_progress=cook_points/cook_goal

if cancel_order{ //pedido cancelado
	for (var i = 0; i < array_length(global.lista_pedidos); i++){ //checa a lista de pedidos para ver qual tem o id do cliente e então tirar o pedido
		if global.lista_pedidos[i][1]=id_cliente{array_delete(global.lista_pedidos,i,1)}
	}
	instance_destroy()
}

if cook_points>=cook_goal{ //pedido pronto
	dindin=order.price
	chance_gorjeta= 5 //+MAID CUTE
	
	if irandom(100)<=chance_gorjeta{
		dindin+=round(order.price*0.3)
		msg_show("GORJETA!!!",id_cliente.x,id_cliente.y-40,c_orange,2) audio_play_sound(smaaaash,75,false,0.6)
	}
	global.money+=dindin
	msg_show(dindin,id_cliente.x,id_cliente.y,c_lime,3)
		for (var i = 0; i < array_length(global.lista_pedidos); i++){ //checa a lista de pedidos para ver qual tem o id do cliente e então tirar o pedido
			if global.lista_pedidos[i][1]=id_cliente{array_delete(global.lista_pedidos,i,1)}
		}
	global.happiness+=1
	with opedidos_manager{
	msg_show("+1",x_botao_loja-60, y_botao_loja,c_lime,3)
	}
	id_cliente.autodestruicao=1
	instance_destroy()
	
}