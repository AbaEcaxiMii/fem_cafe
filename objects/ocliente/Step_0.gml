depth= -bbox_bottom
paci+=0//+=1
if paci>paci_max{
	if order_anotada{		
		for (var i = 0; i < array_length(global.lista_pedidos); i++){ //checa a lista de pedidos para ver qual tem o id do cliente e então tirar o pedido
			if global.lista_pedidos[i][1]=id{array_delete(global.lista_pedidos,i,1)}
		}
	}
	global.happiness-=1
	with opedidos_manager{
	msg_show("-1",x_botao_loja-60, y_botao_loja,c_red,3)
	}
	autodestruicao=1
}

if autodestruicao=0{
	scalex=lerp(scalex,1,0.4)
	scaley=lerp(scaley,1,0.4)
} else {
	instance_destroy()
	//colocar animação legal qui
}