confirmar_key = keyboard_check_pressed(global.confirmar)
var _item=global.loja_avenda[list_avenda_number]
if _item!=noone and _item!="noone"{
	if place_meeting(x,y,oloja_mouse) and confirmar_key{
		if global.exp>=_item.price{
			var _cobrar=0
			if array_contains(global.charms_gallery,_item){
				var _index=array_get_index(global.loja_avenda,_item)
				charm_add(global.loja_avenda[_index])
				global.loja_avenda[_index]="noone"
				_cobrar=1
			} else {
				var _index=array_get_index(global.loja_avenda,_item)
				if item_add(global.loja_avenda[_index]){
					global.loja_avenda[_index]="noone"
					_cobrar=1
				} else {msg_show("Sem espaço")}
			}
			if _cobrar{
				global.exp-=_item.price
				msg_show(_item.price,x,y,c_green)
			}
		} else {msg_show("Sem didin o suficiente")}
	}
}

