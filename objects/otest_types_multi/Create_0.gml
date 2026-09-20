var _type1= global.types_list.agua
var _type2= global.types_list.normal
var _enemy_type1= global.types_list.silk
var _enemy_type2= global.types_list.psi


	_multi=1
	_m1=1
	_m2=1
	_m3=1
	_m4=1
	_m5=1
	_m6=1
	_m7=1
	_m8=1
	for(var i=0;i<array_length(_type1.van);i++){
		if _type1.van[i]=_enemy_type1.num{_m1=_m1*2}
		if _type1.van[i]=_enemy_type2.num{_m2=_m2*2}
	}
	
	for(var i=0;i<array_length(_type1.des);i++){
		if _type1.des[i]=_enemy_type1.num{_m3=_m3/2}
		if _type1.des[i]=_enemy_type2.num{_m4=_m4/2}
	}

	/////
	
	for(var i=0;i<array_length(_type2.van);i++){
		if _type2.van[i]=_enemy_type1.num{_m5=_m5*2}
		if _type2.van[i]=_enemy_type2.num{_m6=_m6*2}
	}
	
	for(var i=0;i<array_length(_type2.des);i++){
		if _type2.des[i]=_enemy_type1.num{_m7=_m7/2}
		if _type2.des[i]=_enemy_type2.num{_m8=_m8/2}
	}
	

	
	
	_multi= _m1*_m2*_m3*_m4*_m5*_m6*_m7*_m8
	
status[0]=_m1
status[1]=_m2
status[2]=_m3
status[3]=_m4
status[4]=_m5
status[5]=_m6
status[6]=_m7
status[7]=_m8
status[8]="Total:"+string(_multi)