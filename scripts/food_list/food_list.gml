global.ing_alface=0
global.ing_tomate=0
global.ing_pao=0
global.ing_morta=0
global.ing_carne=0
global.ing_queijo=0

function create_maid(_name, _habi, _cute, _sala) constructor
{
	maid = {
		name: _name,
		habi: _habi,
		cute: _cute,
		sala: _sala,
		pedido: 0
	}
	
	return maid
}

function create_food(_name, _num, _sprite, _price, _dif, _alface=0, _tomate=0, _pao=0, _morta=0, _carne=0, _queijo=0) constructor
{
	name= _name
	num= _num
	spr= _sprite
	price = _price //preço do prato
	dif= _dif //dificildade de fazer o prato
	alface= _alface //quanto x precisa
	tomate= _tomate
	pao= _pao
	morta= _morta
	carne= _carne
	queijo= _queijo

}

global.food_list=
{
	salada: new create_food(
		"Salada", 0,
		sfood_salada,
		20,
		100,
		4,
		2,
		0
		),
	
	sanduiche: new create_food(
		"Sanduiche", 1,
		sfood_sanduiche,
		10,
		50,
		0,
		0,
		1,
		1
		),
	
	lasanha: new create_food(
		"Lasanha", 2,
		sfood_lasanha,
		40,
		250,
		0,
		0,
		0,
		0,
		3,
		20
		),
}