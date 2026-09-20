draw_self()
var _item=global.loja_avenda[list_avenda_number]
if _item!=noone{
	if _item!="noone"{
		draw_text(x,y,$"{_item.name} {_item.price}$")
	} else {
		draw_text(x,y,_item)
	}
} else {draw_text(x,y,"Error")}