function console_debug_text(_text){
	if array_length(debug_text)>=20{array_delete(debug_text,0,99)}
	array_push(debug_text, _text)
}
/// @param {string} command - O comando digitado
function process_command(command) {
    var parts = string_split(command, " ");
    var cmd = parts[0];
    var args = [];
    
    // Pega os argumentos manualmente
    for (var i = 1; i < array_length(parts); i++) {
        array_push(args, parts[i]);
    }
	
    // Processa cada comando
	var _worked=0
    switch (string_lower(cmd)) {
        case "/cap_increase":
            // Aumenta a variável global
            if (is_undefined(global.cap)) {
                global.cap = 0;
            }
            global.cap += 1;
            console_debug_text("CAP aumentado para: " + string(global.cap));
			_worked=1
            break;
            
        case "/cap_set":
            // Define um valor específico
            if (array_length(args) > 0) {
                var new_value = real(args[0]);
                if (!is_nan(new_value)) {
                    global.cap = new_value;
                    console_debug_text("CAP definido para: " + string(global.cap));
                } else {
                    console_debug_text("Erro: Valor inválido. Use /cap_set [número]");
                }
            } else {
                console_debug_text("Erro: Use /cap_set [número]");
            }
			_worked=1
            break;
            
        case "/cap_get":
            // Mostra o valor atual
            if (is_undefined(global.cap)) {
                console_debug_text("CAP não foi inicializado ainda.");
            } else {
                console_debug_text("CAP atual: " + string(global.cap));
            }
			_worked=1
            break;
		
		case "/save":
            // Define um valor específico
            if (array_length(args) > 0) {
                var new_value = real(args[0]);
			} else { var new_value = 0}
                if (!is_nan(new_value)) {
                    save(new_value) //global.cap
                    console_debug_text($"save_{new_value}_1 criado");
                } else {
                    console_debug_text("Erro: Valor inválido. Use /save [número]");
				}
			_worked=1
            break
		
		case "/load":
            // Define um valor específico
            if (array_length(args) > 0) {
                var new_value = real(args[0]);
			} else { var new_value = 0}
                if (!is_nan(new_value)) {
                    save(load(new_value)) //global.cap
                    console_debug_text($"save_{new_value}_1 carregado");
                } else {
                    console_debug_text("Erro: Valor inválido. Use /load [número]");
				}
			_worked=1
            break;
            
        case "/help":
            // Lista comandos disponíveis
            console_debug_text("Comandos disponíveis:");
            console_debug_text("  /cap_increase - Aumenta CAP em 1");
            console_debug_text("  /cap_set [valor] - Define CAP para um valor específico");
            console_debug_text("  /cap_get - Mostra o valor atual do CAP");
            console_debug_text("  /clear - Limpa o console");
            console_debug_text("  /help - Mostra esta mensagem");
			_worked=1
            break;
            
        case "/clear":
            // Limpa o histórico (opcional)
            debug_text = [];
            console_debug_text("Console limpo!");
			_worked=1
            break;
		
		default:
			console_debug_text("Esse comando não existe")
		break
    }
	
	if !_worked{}
}

/// @param {string} str - String a ser dividida
/// @param {string} delimiter - Delimitador (espaço por padrão)
/// @returns {array} Array com as partes
function string_split(str, delimiter = " ") {
    var result = [];
    var pos = 1;
    var len = string_length(str);
    
    while (pos <= len) {
        var next_delim = string_pos(delimiter, string_copy(str, pos, len - pos + 1));
        if (next_delim == 0) {
            array_push(result, string_copy(str, pos, len - pos + 1));
            break;
        } else {
            array_push(result, string_copy(str, pos, next_delim - 1));
            pos += next_delim + string_length(delimiter) - 1;
        }
    }
    
    return result;
}

