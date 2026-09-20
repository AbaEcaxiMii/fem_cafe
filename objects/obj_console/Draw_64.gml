// Se o console estiver fechado, não desenha nada
if (!is_open) exit;

// Configurações visuais
var border = 10;
var line_height = 10;
var padding = 5;
var console_width = display_get_gui_width();
var console_height = 30;
var console_x = 0;
var console_y = display_get_gui_height() - console_height;

// Fundo semi-transparente
draw_set_color(c_black)
draw_set_alpha(0.8);
draw_rectangle(console_x, console_y, console_x + console_width, console_y + console_height, false);
draw_set_alpha(1);

// Borda
draw_rectangle(console_x, console_y, console_x + console_width, console_y + console_height, true);

draw_set_color(c_white);
draw_set_halign(fa_left);
draw_set_valign(fa_top);

// Linha de input
var input_y = console_y + console_height - padding - line_height;
draw_text(console_x + padding, input_y, "$ " + command_input);

draw_text(console_x + padding, input_y-10, global.cap);

// Cursor piscando
if (floor(current_time / 500) mod 2 == 0) {
    var cursor_x = console_x + padding + string_width("$ " + command_input);
    draw_line(cursor_x, input_y, cursor_x, input_y + line_height);
}

//Console debug
for (var i = 0; i < array_length(debug_text); i++) {
	var _con_y=input_y-30-10*(array_length(debug_text)-1)+10*i
	draw_text_outline(console_x + padding, _con_y, debug_text[i]);
	draw_text(console_x + padding, _con_y, debug_text[i]);
}

//volta ao normal
draw_set_alpha(1);
draw_set_color(c_white);
draw_set_halign(fa_left);
draw_set_valign(fa_top);