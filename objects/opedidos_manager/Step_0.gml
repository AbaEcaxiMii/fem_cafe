var _alter=1
if keyboard_check(vk_enter){_alter=-1}
global.ing_alface+= keyboard_check_pressed(vk_numpad1)*_alter
global.ing_tomate+= keyboard_check_pressed(vk_numpad2)*_alter
global.ing_pao+= keyboard_check_pressed(vk_numpad3)*_alter
global.ing_morta+= keyboard_check_pressed(vk_numpad4)*_alter
global.ing_carne+= keyboard_check_pressed(vk_numpad5)*_alter
global.ing_queijo+= keyboard_check_pressed(vk_numpad6)*_alter

if keyboard_check_pressed(global.menu_key) and !instance_exists(oloja_ingre){
	instance_create_depth(x,y,depth,oloja_ingre)
}

if t_hour<end_hour{
time_work+=30
//+=1
} else {}

if time_work>29{ time_work_total+=time_work time_work=0 t_sec+=2}
//t_sec+=1

if t_sec>59{
	t_sec=0
	t_min++
}

if t_min>59{
	t_min=0
	t_hour++
}

//mil=milissegundo=time_work
//30mil-2seg  900mil-60seg   54000mil-3600seg (1 hora)
//x    -60seg x     -3600seg x       -2600*2 seg (2horas)

global.happiness=clamp(global.happiness,0,100)