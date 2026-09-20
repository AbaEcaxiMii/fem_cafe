global.player_x=0
global.player_y=0

global.nosave_test=1

//se vc é um """hacker""" e descompilou o jogo pra julgar a minha programação, saiba que esse codigo de salvamento foi tirado de Peyton Burnham, por isso que é bom, eu não levo nenhum credito sksks 
	
function save_room(){
		//////
	var _itemNum = instance_number(oitem_overworld)
	
	var _roomStruct =
	{
		itemNum: _itemNum,
		itemData: array_create(_itemNum),
	}
	
	for (var i=0;i<_itemNum;i++){
		var _inst= instance_find(oitem_overworld,i)
		
		_roomStruct.itemData[i]={
			x: _inst.x,
			y: _inst.y,
			item: _inst.item
		}
	}
	
	if room=Rtestroom{global.levelData.level_testroom=_roomStruct}
		//////	
}

function load_room(){
	
	var _roomStruct=0
	
	if room=Rtestroom{_roomStruct=global.levelData.level_testroom}
	
	if !is_struct(_roomStruct) or global.nosave_test{exit}
	
	if instance_exists(oitem_overworld){instance_destroy(oitem_overworld)}
	
	for (var i=0;i<_roomStruct.itemNum;i++){
		var _data=_roomStruct.itemData[i]
		with instance_create_depth(_data.x,_data.y,depth,oitem_overworld)
		{
				item= _data.item
		}
		
	}
	
	
}

function save(_fileNum=0, _capNum=1){
	
	var _saveArray=array_create(0)
	
	save_room()
	
	var _dt=global.statData
	
	_dt.save_x=oPlayer.x
	_dt.save_y=oPlayer.y
	_dt.save_rm=room_get_name(room)
	_dt.save_party= global.party_members
	_dt.save_nameslot= "Nikhil"
	_dt.save_tsec= oParty_manager.t_sec
	_dt.save_tmin= oParty_manager.t_min
	_dt.save_thour= oParty_manager.t_hour
	
	_dt.exp=global.exp
	_dt.item_inv=oitem_manager.inv
	
	array_push(_saveArray, global.statData)
	
	array_push(_saveArray, global.levelData)
	
	var _filename="save"+ string(_fileNum) + "_" + string(_capNum) +".sav"
	var _json= json_stringify(_saveArray)
	var _buffer= buffer_create(string_byte_length(_json)+1, buffer_fixed,1)
	buffer_write(_buffer, buffer_string, _json)
	
	buffer_save( _buffer, _filename)
	buffer_delete(_buffer)
	
}

function load(_fileNum=0, _capNum=1){

	var _filename="save"+ string(_fileNum) + "_" + string(_capNum) +".sav"
	if !file_exists(_filename){return 0 exit}
	
	var _buffer=buffer_load(_filename)
	var _json=buffer_read(_buffer, buffer_string)
	buffer_delete(_buffer)
	
	var _loadArray=json_parse(_json)
	
	global.statData= array_get(_loadArray,0)
	global.levelData= array_get(_loadArray,1)
	
	var dt=global.statData
	
	var _loadRoom=asset_get_index(dt.save_rm)
	room_goto(_loadRoom)
	
	//não permitir osaveload salvar a sala que estamos saindo
	osaveload.skip_roomsave=1
	
	oPlayer.x= dt.save_x oPlayer.y= dt.save_y
	global.party_members=dt.save_party
	global.nameplayer= dt.save_nameslot
	oParty_manager.t_sec= dt.save_tsec
	oParty_manager.t_min= dt.save_tmin
	oParty_manager.t_hour= dt.save_thour
	oParty_manager.time_play=0
	
	load_room()
	
	global.exp= dt.exp
	oitem_manager.inv= dt.item_inv
	
	return 1

}


