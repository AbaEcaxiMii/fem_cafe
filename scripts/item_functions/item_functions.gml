function item_add(_item, _show_name=1){
	
	var _added =false
	var _type = _item.item_type
	var _inv var _inv_max
	if _type=1{
	_inv_max=oitem_manager.equip_inv_max
	if _item.wora=0{_inv=oitem_manager.armor_inv} else if _item.wora=1{_inv=oitem_manager.weapon_inv} else if _item.wora=2{_inv=oitem_manager.main_inv}
	} else if _type=0 {_inv=oitem_manager.inv _inv_max=oitem_manager.inv_max} else
	if _type=2 {_inv=oitem_manager.inv_key _inv_max=oitem_manager.inv_max_key} else
	if _type=3 {_inv=oitem_manager.inv_sell _inv_max=oitem_manager.inv_max_sell}
	
	if array_length(_inv)<_inv_max{
	array_push(_inv,_item)
	_added=true
	}
	
	if instance_exists(oPlayer){
	if _added and _show_name{
		name_above(_item.name)
	} else {
		msg_show("Sem Espaço!",oPlayer.x,oPlayer.y)
	}
								}
	
	return _added
}

function name_above(_name){
	if not instance_exists(oitem_collect_name){
	var _id= instance_create_depth(oPlayer.x,oPlayer.y,oPlayer.depth,oitem_collect_name)
	} else {var _id= oitem_collect_name}
	with _id {array_push(name_list,_name)}
}

function mission_start(_num){name_above("*Nova Missão!*") array_push(global.mission_inv,_num)}
function mission_update(_num_mis,_update="+"){name_above("*Missão atualizada*") if _update="+"{omission_manager.mis_prog[_num_mis]++} else {omission_manager.mis_prog[_num_mis]=_update}}
