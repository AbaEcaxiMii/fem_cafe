// No evento Step do obj_console

// 1. Abrir/Fechar com F11
if (keyboard_check_pressed(vk_f12)) {
    is_open = !is_open;
	global.can_move=!is_open
    if (is_open) {
        // Quando abrir, pega o que já estava digitado e limpa o buffer
        command_input = keyboard_string;
    }
	keyboard_string = ""
}

// Se o console estiver fechado, não faz mais nada
if (!is_open) exit;


// 4. Atualiza o texto do console com o que foi digitado
// A variável 'keyboard_string' já contém o que foi pressionado
if (keyboard_string != command_input) {
    command_input = keyboard_string;
}