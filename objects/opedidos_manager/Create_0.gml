x=0 y=0
oPlayer.x=0 oPlayer.y=0
global.can_move=0

box_h=40
loading_radius=18
loading_width=6
number_pedido=0
number_pedido_max=6 //numero maximo de pedidos anotaveis ao mesmo tempo
cooking_total_max=1 //numero maximo de pedidos que podem ser cozinhados ao mesmo tempo
global.lista_pedidos=array_create(0)

global.happiness=100 //aqui que nasce essa global

//Relogio
time_work=0
time_work_total=0
t_hour=13
t_min=0
t_sec=0
end_hour=14 //20 é quando termina o dia
extra_zero=""

//botão da loja
x_botao_loja=400
y_botao_loja=0//muda no desenho
escala_botao_loja = 1
angulo_botao_loja = 0
largura_botao_loja = sprite_get_width(sbotao_loja);
altura_botao_loja = sprite_get_height(sbotao_loja);
time_botao_loja=0

//só pra resetar
global.ing_alface=0
global.ing_tomate=0
global.ing_pao=0
global.ing_morta=0
global.ing_carne=0
global.ing_queijo=0
