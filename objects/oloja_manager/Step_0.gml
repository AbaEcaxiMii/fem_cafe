for (var i = 0; i<4; i++) {
	if global.loja_avenda[i]="noone" and array_length(global.loja_estoque)>0{
		var _item=array_last(global.loja_estoque)
		global.loja_avenda[i]=_item
		array_delete(global.loja_estoque,array_length(global.loja_estoque)-1,1)
	}
}

if !instance_exists(oloja_produto){
	for (var i = 0; i<4; i++) {
		instance_create_depth(50,50+20*i,depth,oloja_produto,{list_avenda_number: i})
	}
}

//array get index
//produto tranforma em "nada" sua parte e acrecenta ao global.loja_javendido quando usado