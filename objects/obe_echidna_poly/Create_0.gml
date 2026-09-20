start_status_enemy(global.enemies_list.echidna)
blink_hit_create()

//posição que vão seguir
x_target=x
y_target=y
spdb=1 
//NOTA IMPORTANTE: Não escrever spd=etc pq spd é um status, escreva spdb "speed battle"

all_time=function(){
}

funny_text=function(){}

enemy_can_act=function(){
	global.enemy_attacking=1
	change_info_text(,2)
	type_atk=0
}

cons_hitou=function(){}

no_time_stop=function(){
x= clamp(x,global.barrier_x[0],global.barrier_x[1])
y= clamp(y,global.barrier_y[0],global.barrier_y[1])

move_x=sign(x_target-x)
move_y=sign(y_target-y)

x+=move_x*spdb
y+=move_y*spdb

if x=x_target or y=y_target{
	x_target =irandom_range(global.barrier_x[0],global.barrier_x[1])
	y_target =irandom_range(global.barrier_y[0],global.barrier_y[1])
}

}

time_stop=function(){
}

attacking=function(){
type_atk=4
switch(type_atk){
		case 0:
		invocar_atk(0)
		break
		
		case 1:
		invocar_atk(1)
		break
		
		case 2:
		invocar_atk(2)
		break
		
		case 3:
		end_turn()
		break
		
		case 4:
		invocar_atk(16)
		break
		
		case 5:
		invocar_atk(14)
		break
		
		case 6:
		invocar_atk(15)
		break
	}
}
