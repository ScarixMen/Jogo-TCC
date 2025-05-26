// Distância para ativar o split
split_distance = 1700;
is_split = false;

// Tamanho de cada viewport (metade da tela)
viewport_width = display_get_width() / 2;
viewport_height = display_get_height();

// Viewport 0 - Player 1
camera_1 = camera_create_view(0, 0, viewport_width, viewport_height, 0, obj_Apollo, -1, -1, 0, 0);
view_camera[0] = camera_1;
view_visible[0] = true;
view_set_wport(0, viewport_width);
view_set_hport(0, viewport_height);
view_set_xport(0, 0); // Lado esquerdo

// Viewport 1 - Player 2
camera_2 = camera_create_view(0, 0, viewport_width, viewport_height, 0, obj_Luana, -1, -1, 0, 0);
view_camera[1] = camera_2;
view_visible[1] = true;
view_set_wport(1, viewport_width);
view_set_hport(1, viewport_height);
view_set_xport(1, viewport_width); // Lado direito

// Cria as duas câmeras (uma para cada view)
camera_left = camera_create();
camera_right = camera_create();


// Valores atuais interpolados da câmera
cam_width = display_get_width();
cam_height = display_get_height();

