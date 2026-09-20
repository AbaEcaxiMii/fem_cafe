if CRT.ShaderOn {
    shader_set(SHD_CRT);
    shader_set_uniform_f_array(UCRTParams, CRT.Params);
}

gpu_set_blendenable(false);

// Calcula a escala mantendo a proporção
var _window_w = window_get_width();
var _window_h = window_get_height();
var _aspect_ratio = global.view_width / global.view_height;

var _scale = 1;
var _draw_x = 0;
var _draw_y = 0;
var _draw_w = _window_w;
var _draw_h = _window_h;

// Calcula a escala para caber na tela mantendo a proporção
if (_window_w / _window_h > _aspect_ratio) {
    // Janela é mais larga que o jogo - sobra espaço nas laterais
    _draw_h = _window_h;
    _draw_w = _window_h * _aspect_ratio;
    _draw_x = (_window_w - _draw_w) / 2;
    _draw_y = 0;
} else {
    // Janela é mais alta que o jogo - sobra espaço em cima/baixo
    _draw_w = _window_w;
    _draw_h = _window_w / _aspect_ratio;
    _draw_x = 0;
    _draw_y = (_window_h - _draw_h) / 2;
}

// Desenha a superfície com a escala calculada
draw_surface_ext(application_surface, _draw_x, _draw_y, _draw_w/global.view_width, _draw_h/global.view_height, 0, c_white, 1);

gpu_set_blendenable(true);
shader_reset();