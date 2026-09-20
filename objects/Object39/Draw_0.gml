//Desenhar o botão da loja

if (mouse_x > x - largura_botao_loja/2 && mouse_x < x + largura_botao_loja/2 &&
    mouse_y > y - altura_botao_loja/2 && mouse_y < y + altura_botao_loja/2) 
{
	time_botao_loja+=0.1
    escala_nova_botao_loja=1.2
    angulo_botao_loja = sin(time_botao_loja) * 5; // -5 a +5 graus
	if mouse_check_button_pressed(mb_left){escala_botao_loja=2}
} else {escala_nova_botao_loja=1 angulo_botao_loja=lerp(angulo_botao_loja,0,0.1)}

escala_botao_loja = lerp(escala_botao_loja, escala_nova_botao_loja,0.4)
draw_sprite_ext(sbotao_loja, 0, x, y, escala_botao_loja, escala_botao_loja, angulo_botao_loja, c_white, 1);