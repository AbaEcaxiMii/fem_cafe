num_mis=-1 num_txt=0 _ast="" 
global.mission_inv=array_create(0) 
//array_push(global.mission_inv,0)
///array_push(global.mission_inv,1)
function new_mis_create(_name_mis, _rapidinhopratest=0)
{
	num_mis++ num_txt=0 _ast=""
	mis_name[num_mis]=_name_mis
	mis_prog[num_mis]=0
	mis_prog_max[num_mis]=num_txt
	if _rapidinhopratest{mis_txt[num_mis,num_txt]=string(_ast) + string("aaaateste ggaf")}
	
}

function mis_text(_text){
	mis_prog_max[num_mis]=num_txt
	_ast=string(_ast)+string("*")
	mis_txt[num_mis,num_txt]=string(_ast) + string(_text)
	num_txt++
}

//Missão 1 0

new_mis_create("Missão 1")
mis_text("OK, eu só preciso falar com esse npc e poderei prosseguir com a missão")
mis_text("Opa, deu certo!")

//Afazeres de casa 1

new_mis_create("Afazeres de casa")
mis_text("O Zahl me pediu pra regar as flores, vou aproveitar e pegar uns tomates tbm")
mis_text("Peguei os tomates, bora comprar carne")
mis_text("Uh, acho que peguei tudo, hora do almoço")

mis_prog[0]=0 mis_prog[1]=2