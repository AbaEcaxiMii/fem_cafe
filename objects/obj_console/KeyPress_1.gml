// Só processa se o console estiver aberto
if (!is_open) exit;

// Pega a tecla pressionada
var key = keyboard_lastchar;

// Se for ENTER, processa o comando
if (keyboard_check_pressed(vk_enter)) {
    
    // Processa o comando
    process_command(command_input);
    
    // Limpa o input
    command_input = "";
    keyboard_string = "";
    exit;
}

// Se for BACKSPACE, remove o último caractere
if (keyboard_check_pressed(vk_backspace)) {
    if (string_length(command_input) > 0) {
        command_input = string_delete(command_input, string_length(command_input), 1);
    }
    exit;
}

// Se for ESC, fecha o console
if (keyboard_check_pressed(vk_escape)) {
    is_open = false;
    exit;
}

// Adiciona caracteres válidos (ignora teclas especiais)
if (key != "" && key != "\n" && key != "\r" && key != "\t") {
    // Verifica se é um caractere imprimível (ASCII 32-126)
    var char_code = ord(key);
    if (char_code >= 32 && char_code <= 126) {
        command_input += key;
    }
}