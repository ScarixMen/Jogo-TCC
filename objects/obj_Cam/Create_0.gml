// Distâncias de split
x_dist_split = 1600;
y_dist_split = 700;

// Estados
is_split = false;
cam_width = display_get_width();
cam_height = display_get_height();

// Viewport padrão
viewport_width = display_get_width() / 2;
viewport_height = display_get_height();

// Câmeras dos jogadores
camera_1 = camera_create_view(0, 0, viewport_width, viewport_height, 0, obj_Apollo, -1, -1, 0, 0);
camera_2 = camera_create_view(0, 0, viewport_width, viewport_height, 0, obj_Luana, -1, -1, 0, 0);

// Câmera de foco
camera_focus = camera_create();
global.cam_override = false; // ativa/desativa override
global.focus_target = obj_Bridge; // instância para focar

// Viewport inicial
view_camera[0] = camera_1;
view_visible[0] = true;
view_set_wport(0, viewport_width);
view_set_hport(0, viewport_height);
view_set_xport(0, 0);

view_camera[1] = camera_2;
view_visible[1] = false;
view_set_wport(1, viewport_width);
view_set_hport(1, viewport_height);
view_set_xport(1, viewport_width);
