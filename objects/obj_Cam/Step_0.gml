// === 1. CÂMERA DE FOCO TEMPORÁRIO ===
if (global.cam_override) {
    // Mostra apenas a viewport 0

	with(obj_Cinematic_Bars){
    target_alpha = 1;  // ou 0 para desligar
	}

	
	view_visible[2] = true
    view_visible[0] = false;
    view_visible[1] = false;

    // Usa a câmera de foco
    view_camera[2] = camera_focus;
    view_set_wport(0, display_get_width());
    view_set_hport(0, display_get_height());
    view_set_xport(0, 0);
    view_set_yport(0, 0);

    // Calcula posição para focar
    var fx = instance_exists(global.focus_target) ? global.focus_target.x : room_width / 2;
	if(global.focus_target == obj_Niobio)
	{
		var fy = (instance_exists(global.focus_target) ? global.focus_target.y : room_height / 2) + 100;
	}
	else{
		
		var fy = instance_exists(global.focus_target) ? global.focus_target.y : room_height / 2;
	}

    var tx = clamp(fx - display_get_width() / 2, 0, room_width - display_get_width());
    var ty = clamp(fy - display_get_height() / 2, 0, room_height - display_get_height());

    var cx = camera_get_view_x(camera_focus);
    var cy = camera_get_view_y(camera_focus);

    // Move a câmera suavemente
    camera_set_view_pos(camera_focus, lerp(cx, tx, 0.1), lerp(cy, ty, 0.1));
    camera_set_view_size(camera_focus, display_get_width(), display_get_height());

    return; // IMPORTANTE! Para interromper o resto do código só enquanto o foco estiver ativo
}
else 
{
	with(obj_Cinematic_Bars) {
    target_alpha = 0;  // ou 0 para desligar
	}

}
// Ajuste de split dinâmico baseado em posição
if (obj_Player.x > 10000) {
    y_dist_split = 810;
}

// Distância entre jogadores
var dx = abs(obj_Apollo.x - obj_Luana.x);
var dy = abs(obj_Apollo.y - obj_Luana.y);

// Verifica se precisa ativar split
var split_now = (dx > x_dist_split) || (dy > y_dist_split);
if (split_now != is_split) {
    is_split = split_now;
}

// Inicializa valores-alvo com os valores atuais
var target_width  = cam_width;
var target_height = cam_height;
var target_x1, target_y1, target_x2, target_y2;

if (!is_split) {
    // === MODO UNIFICADO ===
    target_width  = display_get_width();
    target_height = display_get_height();

    var mid_x = ((obj_Apollo.x + obj_Luana.x) / 2) - target_width / 2;
    var mid_y = ((obj_Apollo.y + obj_Luana.y) / 2) - target_height / 2;

    target_x1 = clamp(mid_x, 0, room_width - target_width);
    target_y1 = clamp(mid_y, 0, room_height - target_height);

    // Atualiza visualização
	view_visible[2] = false
    view_visible[0] = true;
    view_visible[1] = false;

    view_set_wport(0, target_width);
    view_set_hport(0, target_height);
    view_set_xport(0, 0);
    view_set_yport(0, 0);

} else {
    // === MODO SPLIT SCREEN ===
    target_width  = display_get_width() / 2;
    target_height = display_get_height();

    target_x1 = clamp(obj_Apollo.x - target_width / 2, 0, room_width - target_width);
    target_y1 = clamp(obj_Apollo.y - target_height / 2, 0, room_height - target_height);

    target_x2 = clamp(obj_Luana.x - target_width / 2, 0, room_width - target_width);
    target_y2 = clamp(obj_Luana.y - target_height / 2, 0, room_height - target_height);

	view_visible[2] = false;
    view_visible[0] = true;
    view_visible[1] = true;

    view_set_wport(0, target_width);
    view_set_hport(0, target_height);
    view_set_xport(0, 0);
    view_set_yport(0, 0);

    view_set_wport(1, target_width);
    view_set_hport(1, target_height);
    view_set_xport(1, target_width);
    view_set_yport(1, 0);
}

// Interpolação de tamanho da câmera
cam_width  = lerp(cam_width, target_width, 0.1);
cam_height = lerp(cam_height, target_height, 0.1);
camera_set_view_size(camera_1, cam_width, cam_height);
if (is_split) {
    camera_set_view_size(camera_2, cam_width, cam_height);
}

// Interpolação de posição das câmeras
var new_x1 = lerp(camera_get_view_x(camera_1), target_x1, 0.1);
var new_y1 = lerp(camera_get_view_y(camera_1), target_y1, 0.1);
camera_set_view_pos(camera_1, new_x1, new_y1);

if (is_split) {
    var new_x2 = lerp(camera_get_view_x(camera_2), target_x2, 0.1);
    var new_y2 = lerp(camera_get_view_y(camera_2), target_y2, 0.1);
    camera_set_view_pos(camera_2, new_x2, new_y2);
}

