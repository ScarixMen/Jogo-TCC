// Distância em X e Y

if(obj_Player.x>10000)
{

	y_dist_split =810;

}
var dx = abs(obj_Apollo.x - obj_Luana.x);
var dy = abs(obj_Apollo.y - obj_Luana.y);

// Verifica se deve fazer split
var split_now = (dx > x_dist_split) || (dy > y_dist_split);

// Se houve mudança de modo, atualiza
if (split_now != is_split) {
    is_split = split_now;
}
// Inicializa valores padrão com os valores atuais
var target_width = cam_width;
var target_height = cam_height;
var target_x1, target_y1, target_x2, target_y2;

if (!is_split) {
    // Câmera unificada
    target_width = display_get_width();
    target_height = display_get_height();

    var mid_x = (obj_Apollo.x + obj_Luana.x) / 2 - target_width / 2;
    var mid_y = (obj_Apollo.y + obj_Luana.y) / 2 - target_height / 2;

    target_x1 = clamp(mid_x, 0, room_width - target_width);
    target_y1 = clamp(mid_y, 0, room_height - target_height);

    // Ajustes de viewport e view
    view_visible[1] = false;
    view_set_wport(0, target_width);
    view_set_hport(0, target_height);
    view_set_xport(0, 0);
} else {
    // Split-screen
    target_width = display_get_width() / 2;
    target_height = display_get_height();

    target_x1 = clamp(obj_Apollo.x - target_width / 2, 0, room_width - target_width);
    target_y1 = clamp(obj_Apollo.y - target_height / 2, 0, room_height - target_height);

    target_x2 = clamp(obj_Luana.x - target_width / 2, 0, room_width - target_width);
    target_y2 = clamp(obj_Luana.y - target_height / 2, 0, room_height - target_height);

    view_visible[1] = true;

    view_set_wport(0, target_width);
    view_set_hport(0, target_height);
    view_set_xport(0, 0);

    view_set_wport(1, target_width);
    view_set_hport(1, target_height);
    view_set_xport(1, target_width);
}

// Interpolação suave de tamanho da câmera
cam_width = lerp(cam_width, target_width, 0.1);
cam_height = lerp(cam_height, target_height, 0.1);
camera_set_view_size(camera_1, cam_width, cam_height);
if (is_split) {
    camera_set_view_size(camera_2, cam_width, cam_height);
}

// Interpolação de posição
var cam_x1 = camera_get_view_x(camera_1);
var cam_y1 = camera_get_view_y(camera_1);
var new_x1 = lerp(cam_x1, target_x1, 0.1);
var new_y1 = lerp(cam_y1, target_y1, 0.1);
camera_set_view_pos(camera_1, new_x1, new_y1);

if (is_split) {
    var cam_x2 = camera_get_view_x(camera_2);
    var cam_y2 = camera_get_view_y(camera_2);
    var new_x2 = lerp(cam_x2, target_x2, 0.025);
    var new_y2 = lerp(cam_y2, target_y2, 0.025);
    camera_set_view_pos(camera_2, new_x2, new_y2);
}
