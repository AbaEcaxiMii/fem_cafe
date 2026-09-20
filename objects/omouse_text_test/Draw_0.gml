draw_self()
// Variáveis para as opções
var opcoes = ["Começar", "Opções", "Sair"];
var y_inicial = y; // Posição Y inicial do menu
var espacamento = 10; // Espaçamento entre as opções

// Percorre as opções
for (var i = 0; i < array_length(opcoes); i++) {
    var x_pos = x+20; // Posição X do menu (centralizado)
    var y_pos = y_inicial + (i * espacamento);
	var _c = c_white
    
    // Define a largura e altura do texto para detecção do mouse
    var text_width = string_width(opcoes[i]);
    var text_height = string_height(opcoes[i]);
    
    // Verifica se o mouse está sobre a opção
    if (mouse_x > x_pos && mouse_x < x_pos + string_width(opcoes[i]) &&
        mouse_y > y_pos && mouse_y < y_pos + string_height(opcoes[i])) {
		_c=c_yellow // Cor amarela para hover
    } else {
        _c=c_white; // Cor normal
    }
    
    // Desenha o texto (centralizado)
	draw_text_outline(x_pos, y_pos, opcoes[i],0,9999, c_black)
    draw_text_colour(x_pos, y_pos, opcoes[i],_c,_c,_c,_c,1)
}
