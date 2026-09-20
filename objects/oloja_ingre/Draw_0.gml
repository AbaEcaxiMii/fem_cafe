loja[0]=["Alface",global.ing_alface,1] //nome var preço
loja[1]=["Tomate",global.ing_tomate,2]
loja[2]=["Pão",global.ing_pao,3]
loja[3]=["Mortadela",global.ing_morta,4]
loja[4]=["Carne",global.ing_carne,5]
loja[5]=["Queijo",global.ing_queijo,6]

_x=camera_get_view_x(view_camera[0])+camera_get_view_width(view_camera[0])/2
_y=camera_get_view_y(view_camera[0])+camera_get_view_height(view_camera[0])/2
pos+=keyboard_check_pressed(global.right)-keyboard_check_pressed(global.left)

draw_sprite_ext(sTextbox_normal,0,_x- (26*scalex)/2,_y-(26*scaley)/2,scalex,scaley,0,c_white,1)
draw_sprite_ext(sTextbox_back_normal,0,_x- (26*scalex)/2,_y-(26*scaley)/2,scalex,scaley,0,c_white,1)

var seta_esq_x = _x-55;
var seta_esq_y = _y;
var seta_esq_w = sprite_get_width(sloja_seta);
var seta_esq_h = sprite_get_height(sloja_seta);

var _c=c_white
if (mouse_x > seta_esq_x - seta_esq_w/2 && mouse_x < seta_esq_x + seta_esq_w/2 &&
    mouse_y > seta_esq_y - 30 && mouse_y < seta_esq_y + 30) {
    _c=c_yellow;
	if mouse_check_button_pressed(mb_left) {pos--}
} else {
    _c=c_white;
}
draw_sprite_ext(sloja_seta,0,seta_esq_x,seta_esq_y,-1,1,0,_c,1)

// Desenha a seta direita com hover
var seta_dir_x = _x+55;
var seta_dir_y = _y;

if (mouse_x > seta_dir_x - seta_esq_w/2 && mouse_x < seta_dir_x + seta_esq_w/2 &&
    mouse_y > seta_dir_y - 30 && mouse_y < seta_dir_y + 30) {
    _c=c_yellow
	if mouse_check_button_pressed(mb_left) {pos++}
} else {
    _c=c_white
}
draw_sprite_ext(sloja_seta,0,seta_dir_x,seta_dir_y,1,1,0,_c,1)

//ajeitar a pos em relação aos limites
if pos<0{pos=array_length(loja)-1}
if pos>array_length(loja)-1{pos=0}

// Desenha os textos
draw_set_halign(fa_middle)
draw_set_valign(fa_center)
draw_text(_x, _y-10, string(loja[pos][0])+ " $" + string(loja[pos][2]))
draw_text(_x, _y, "Quant: "+ string(loja[pos][1]));

var text_comprar_x = _x;
var text_comprar_y = _y+10;
var text_width = string_width("Comprar");
var text_height = string_height("Comprar");

if keyboard_check_pressed(global.confirmar) {
		switch(pos) {
	            case 0: if global.money>=loja[0][2]{ global.money-=loja[0][2] global.ing_alface++}; break;
	            case 1: if global.money>=loja[1][2]{ global.money-=loja[1][2] global.ing_tomate++}; break;
	            case 2: if global.money>=loja[2][2]{ global.money-=loja[2][2] global.ing_pao++}; break;
	            case 3: if global.money>=loja[3][2]{ global.money-=loja[3][2] global.ing_morta++}; break;
	            case 4: if global.money>=loja[4][2]{ global.money-=loja[4][2] global.ing_carne++}; break;
	            case 5: if global.money>=loja[5][2]{ global.money-=loja[5][2] global.ing_queijo++}; break;
	        }
	}

if (mouse_x > text_comprar_x - text_width/2 && mouse_x < text_comprar_x + text_width/2 &&
    mouse_y > text_comprar_y - text_height/2 && mouse_y < text_comprar_y + text_height/2) {
    _c=c_yellow
	if mouse_check_button_pressed(mb_left) {
		switch(pos) {
	            case 0: if global.money>=loja[0][2]{ global.money-=loja[0][2] global.ing_alface++}; break;
	            case 1: if global.money>=loja[1][2]{ global.money-=loja[1][2] global.ing_tomate++}; break;
	            case 2: if global.money>=loja[2][2]{ global.money-=loja[2][2] global.ing_pao++}; break;
	            case 3: if global.money>=loja[3][2]{ global.money-=loja[3][2] global.ing_morta++}; break;
	            case 4: if global.money>=loja[4][2]{ global.money-=loja[4][2] global.ing_carne++}; break;
	            case 5: if global.money>=loja[5][2]{ global.money-=loja[5][2] global.ing_queijo++}; break;
	        }
	}
} else {
    _c=c_white
}

draw_text_colour(text_comprar_x, text_comprar_y, "Comprar",_c,_c,_c,_c,1)

//texto que avisa como sai
draw_text_outline(_x,_y-14-(26*scaley)/2,"Clique acima da caixa ou aperte C para sair",10,200)
draw_text_ext(_x,_y-15-(26*scaley)/2,"Clique acima da caixa ou aperte C para sair",10,200)

draw_set_halign(fa_left)
draw_set_valign(fa_top)
draw_set_color(c_white)

if wait<10{wait++} else {
	if keyboard_check_pressed(global.menu_key) or (mouse_check_button_pressed(mb_left) and mouse_y<_y-(26*scaley)/2)
	{instance_destroy()}
}