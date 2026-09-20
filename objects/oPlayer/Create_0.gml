// Assim que inicia (bandeira verde)
instance_create_depth(x,y,depth,oPlayerc)
	
//O quão rapido o player vai
//normal_spd=1
//run_spd=normal_spd*3
//move_spd = normal_spd
//walkspd=move_spd
//dagspd= round(move_spd*((sqrt(2))/2))
normal_spd=4
run_spd=normal_spd+2
move_spd = normal_spd
walkspd=move_spd
//n usa dagspd, como ta já ta bom
//dagspd= round(move_spd*((sqrt(normal_spd+1))/2))
//dagspd= 0.707

//Resto da movimentação
global.can_move = true
xspd=0
yspd=0
xspdb=0
yspdb=0
_xxx=0

try_menu=0
mtry_menu_timer=4
try_menu_timer=mtry_menu_timer

//new dash

player_dir=270
candash=0 //reseta quando chão
dashdis= 96 //96 //distancia que o dash andara
dashtime= 12 //12 //quanto tempo demorara até chegar a dis maxima
state=0 //0 normal 1 dash
td=0 //tempo do dash clone

///tiro
cool_tiro = 0
cool_tiro_ini = 20 //intervalo entre os tiros
quer_atirar=0
id_f=0

//plataformas
global.xspd=0
global.yspd=0

global.death=0

sup=sRecyUp
sdown=sRecyDown
sleft=sRecySide
sright=sRecySide
xscale=-1 //1 se os dois lados são deiferentes -1 se são iguais só inverte

track_xscale=1
_sface=sdown
_imface=1
sprite_index=_sface
image_xscale=_imface
_yspdb=yspd

damage_effect=0
dd=0

//follower
array_size=94//quantas posições são gravadas
follower_activity=0
allow_follower=0

for(var i=array_size-1;i>=0;i--){
	pos_x[i]=x
	pos_y[i]=y
	toRecordSprite[i]= sprite_index
	toRecord_Xscale[i]= image_xscale
}