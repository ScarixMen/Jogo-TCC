// Evento: Draw GUI (do obj_sunset_display)

// 1. Ativa o shader
shader_set(shd_sunset);

// 2. Obtém a altura da GUI
var _screenHeight = display_get_gui_height();

// 3. Obtém o ID do uniform e passa a altura da tela
var _uniform_height = shader_get_uniform(shd_sunset, "u_screenHeight");
shader_set_uniform_f(_uniform_height, _screenHeight);

// 4. ADICIONE ESTAS LINHAS: Define o valor de alpha (transparência)
// Um valor entre 0.0 (totalmente transparente) e 1.0 (totalmente opaco).
// Tente 0.5, 0.6, 0.7 para começar e ajuste conforme sua necessidade.
var _alpha_value = 0; // Por exemplo, 60% de opacidade

var _uniform_alpha = shader_get_uniform(shd_sunset, "u_alpha");
shader_set_uniform_f(_uniform_alpha, _alpha_value);


// 5. Desenha o retângulo que cobre toda a área da GUI.
draw_rectangle(0, 0, display_get_gui_width(), _screenHeight, false);

// 6. Desativa o shader
shader_reset();